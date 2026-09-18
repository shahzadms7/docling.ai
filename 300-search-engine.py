#!/usr/bin/env python3
"""Local SQLite FTS search over extracted deterministic corpus."""
import argparse,json,sqlite3
from pathlib import Path
def main():
 p=argparse.ArgumentParser(); p.add_argument("query"); p.add_argument("--root",default=r"C:\Projects\docling.ai"); p.add_argument("--limit",type=int,default=10); a=p.parse_args()
 db=Path(a.root)/"SYSTEM"/"state"/"corpus.db"; con=sqlite3.connect(db)
 con.execute("CREATE VIRTUAL TABLE IF NOT EXISTS fts USING fts5(content_id,text_content)")
 con.execute("DELETE FROM fts"); con.execute("INSERT INTO fts(content_id,text_content) SELECT content_id,text_content FROM content WHERE text_content IS NOT NULL"); con.commit()
 rows=con.execute("SELECT content_id,snippet(fts,1,'[',']',' … ',18),bm25(fts) FROM fts WHERE fts MATCH ? ORDER BY bm25(fts) LIMIT ?",(a.query,a.limit)).fetchall()
 print(json.dumps([{"content_id":r[0],"snippet":r[1],"score":r[2]} for r in rows],indent=2))
if __name__=="__main__": main()
