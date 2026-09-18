import argparse, hashlib, json, os, sqlite3
from datetime import datetime, timezone
from pathlib import Path
def now(): return datetime.now(timezone.utc).isoformat()
def sha(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''): h.update(b)
 return h.hexdigest()
def sid(rel): return hashlib.sha256(rel.casefold().encode('utf-8','surrogatepass')).hexdigest()
def db(root):
 p=root/'SYSTEM'/'state'/'corpus.db'; p.parent.mkdir(parents=True,exist_ok=True); c=sqlite3.connect(str(p))
 c.execute('CREATE TABLE IF NOT EXISTS files(source_id TEXT PRIMARY KEY,relative_path TEXT NOT NULL,content_id TEXT,size_bytes INTEGER,status TEXT NOT NULL,error TEXT,first_seen TEXT NOT NULL,last_seen TEXT NOT NULL)')
 c.execute('CREATE INDEX IF NOT EXISTS ix_content ON files(content_id)'); c.commit(); return c
def scan(root,dry=False):
 src=root/'SOURCE'; c=db(root); stamp=now(); seen=set(); n=0
 for dp,dns,fns in os.walk(str(src),followlinks=False):
  dns[:]=sorted(x for x in dns if not (Path(dp)/x).is_symlink())
  for name in sorted(fns):
   p=Path(dp)/name; rel=p.relative_to(src).as_posix(); source=sid(rel); seen.add(source); n+=1; content=None; size=None; status='DISCOVERED'; err=None
   try:
    if name.startswith('~$') or p.is_symlink(): status='INTENTIONALLY_EXCLUDED'
    else:
     size=p.stat().st_size; content=sha(p); dup=c.execute('SELECT source_id FROM files WHERE content_id=? AND source_id<>? LIMIT 1',(content,source)).fetchone(); status='DUPLICATE' if dup else 'SUCCESS'
   except Exception as e: status='FAILED'; err=type(e).__name__+': '+str(e)
   if not dry: c.execute('INSERT INTO files VALUES(?,?,?,?,?,?,?,?) ON CONFLICT(source_id) DO UPDATE SET relative_path=excluded.relative_path,content_id=excluded.content_id,size_bytes=excluded.size_bytes,status=excluded.status,error=excluded.error,last_seen=excluded.last_seen',(source,rel,content,size,status,err,stamp,stamp))
 if not dry:
  for (old,) in c.execute('SELECT source_id FROM files').fetchall():
   if old not in seen: c.execute("UPDATE files SET status='MISSING',last_seen=? WHERE source_id=?",(stamp,old))
  c.commit()
 print(json.dumps({'dry_run':dry,'discovered':n},indent=2)); c.close()
def main():
 a=argparse.ArgumentParser(); a.add_argument('--root',default=r'C:\Projects\docling.ai'); s=a.add_subparsers(dest='cmd',required=True); s.add_parser('init'); q=s.add_parser('scan'); q.add_argument('--dry-run',action='store_true'); s.add_parser('status'); x=a.parse_args(); root=Path(x.root)
 if x.cmd=='init': db(root).close(); print('INIT PASS')
 elif x.cmd=='scan': scan(root,x.dry_run)
 else:
  c=db(root); [print('{:<24} {:>8}'.format(st,n)) for st,n in c.execute('SELECT status,COUNT(*) FROM files GROUP BY status ORDER BY status')]; c.close()
if __name__=='__main__': main()