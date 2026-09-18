#!/usr/bin/env python3
"""Docling AI deterministic corpus foundation.
Read-only SOURCE inventory/hash plus safe text extraction for plain text/code.
Office/PDF rich extraction is intentionally gated for later approved parser modules.
"""
from __future__ import annotations
import argparse, hashlib, json, os, sqlite3, sys, time
from pathlib import Path

TERMINAL={"SUCCESS","PARTIAL","FAILED","ENCRYPTED","UNSUPPORTED","DUPLICATE","INTENTIONALLY_EXCLUDED","PENDING_REVIEW"}
TEXT_EXT={".txt",".md",".py",".ps1",".cmd",".bat",".sh",".json",".yaml",".yml",".csv",".log",".xml",".html",".css",".js",".ts",".sql"}

def sha256(path:Path)->str:
    h=hashlib.sha256()
    with path.open("rb") as f:
        for b in iter(lambda:f.read(1024*1024),b""): h.update(b)
    return h.hexdigest()

def safe_text(path:Path)->tuple[str,str]:
    if path.suffix.lower() not in TEXT_EXT:
        return "UNSUPPORTED",""
    data=path.read_bytes()
    for enc in ("utf-8","utf-8-sig","utf-16","cp1252"):
        try:return "SUCCESS",data.decode(enc)
        except UnicodeDecodeError:pass
    return "PARTIAL",data.decode("utf-8",errors="replace")

def init_db(db:Path):
    db.parent.mkdir(parents=True,exist_ok=True)
    con=sqlite3.connect(db)
    con.executescript("""
    PRAGMA journal_mode=WAL;
    CREATE TABLE IF NOT EXISTS meta(key TEXT PRIMARY KEY,value TEXT NOT NULL);
    CREATE TABLE IF NOT EXISTS source(
      source_id TEXT PRIMARY KEY,relative_path TEXT NOT NULL UNIQUE,content_id TEXT,
      size INTEGER,mtime_ns INTEGER,presence_state TEXT NOT NULL,
      processing_status TEXT NOT NULL,error TEXT,updated_at TEXT NOT NULL);
    CREATE TABLE IF NOT EXISTS content(
      content_id TEXT PRIMARY KEY,canonical_source_id TEXT,text_content TEXT,created_at TEXT NOT NULL);
    CREATE TABLE IF NOT EXISTS run(
      run_id TEXT PRIMARY KEY,started_at TEXT NOT NULL,ended_at TEXT,status TEXT,discovered INTEGER DEFAULT 0,accounted INTEGER DEFAULT 0);
    """)
    con.execute("INSERT OR REPLACE INTO meta(key,value) VALUES('schema_version','1.0')")
    con.commit(); return con

def source_id(rel:str)->str:
    return hashlib.sha256(rel.replace("\\","/").lower().encode("utf-8")).hexdigest()

def scan(root:Path)->int:
    src=root/"SOURCE"; sysdir=root/"SYSTEM"; db=sysdir/"state"/"corpus.db"
    if not src.exists(): raise SystemExit("[STOP] SOURCE not found. Run deployment bootstrap first.")
    run_id=f"run-{int(time.time())}"
    con=init_db(db); now=lambda:time.strftime("%Y-%m-%dT%H:%M:%SZ",time.gmtime())
    con.execute("INSERT INTO run(run_id,started_at,status) VALUES(?,?,?)",(run_id,now(),"RUNNING"))
    seen=set(); discovered=accounted=0; content_owner={}
    for base,dirs,files in os.walk(src,followlinks=False):
        dirs[:]=[d for d in dirs if not (Path(base)/d).is_symlink()]
        for name in sorted(files):
            p=Path(base)/name; rel=str(p.relative_to(src)).replace("\\","/")
            discovered+=1; sid=source_id(rel); seen.add(sid)
            try:
                st=p.stat()
                if p.is_symlink(): status,text,cid,err="INTENTIONALLY_EXCLUDED","",None,"symlink blocked"
                else:
                    cid=sha256(p)
                    if cid in content_owner:
                        status,text,err="DUPLICATE","",f"duplicate_of_source_id={content_owner[cid]}"
                    else:
                        status,text=safe_text(p); err=None
                        content_owner[cid]=sid
                        if status=="SUCCESS":
                            con.execute("INSERT OR IGNORE INTO content(content_id,canonical_source_id,text_content,created_at) VALUES(?,?,?,?)",(cid,sid,text,now()))
                con.execute("""INSERT INTO source(source_id,relative_path,content_id,size,mtime_ns,presence_state,processing_status,error,updated_at)
                VALUES(?,?,?,?,?,?,?,?,?) ON CONFLICT(source_id) DO UPDATE SET content_id=excluded.content_id,size=excluded.size,mtime_ns=excluded.mtime_ns,
                presence_state='PRESENT',processing_status=excluded.processing_status,error=excluded.error,updated_at=excluded.updated_at""",
                (sid,rel,cid,st.st_size,st.st_mtime_ns,"PRESENT",status,err,now()))
            except Exception as e:
                con.execute("""INSERT INTO source(source_id,relative_path,presence_state,processing_status,error,updated_at)
                VALUES(?,?,?,?,?,?) ON CONFLICT(source_id) DO UPDATE SET presence_state='PRESENT',processing_status='FAILED',error=excluded.error,updated_at=excluded.updated_at""",
                (sid,rel,"PRESENT","FAILED",repr(e),now()))
            accounted+=1
    rows=con.execute("SELECT source_id FROM source WHERE presence_state='PRESENT'").fetchall()
    for (sid,) in rows:
        if sid not in seen: con.execute("UPDATE source SET presence_state='MISSING',updated_at=? WHERE source_id=?",(now(),sid))
    status="PASS" if discovered==accounted else "FAIL"
    con.execute("UPDATE run SET ended_at=?,status=?,discovered=?,accounted=? WHERE run_id=?",(now(),status,discovered,accounted,run_id))
    con.commit()
    print(json.dumps({"run_id":run_id,"status":status,"discovered":discovered,"accounted":accounted,"db":str(db)},indent=2))
    return 0 if status=="PASS" else 2

def main():
    ap=argparse.ArgumentParser(); ap.add_argument("action",choices=["init","scan","status"]); ap.add_argument("--root",default=r"C:\Projects\docling.ai")
    a=ap.parse_args(); root=Path(a.root)
    con=init_db(root/"SYSTEM"/"state"/"corpus.db")
    if a.action=="init": print("[PASS] corpus database initialized"); return 0
    if a.action=="scan": return scan(root)
    rows=con.execute("SELECT processing_status,COUNT(*) FROM source GROUP BY processing_status ORDER BY processing_status").fetchall()
    print(json.dumps({"statuses":dict(rows)},indent=2)); return 0
if __name__=="__main__": raise SystemExit(main())
