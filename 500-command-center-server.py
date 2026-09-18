#!/usr/bin/env python3
from http.server import ThreadingHTTPServer,SimpleHTTPRequestHandler
from pathlib import Path
import argparse,os
def main():
 p=argparse.ArgumentParser();p.add_argument("--port",type=int,default=8765);a=p.parse_args()
 root=Path(__file__).resolve().parent;os.chdir(root)
 print(f"Docling AI Command Center: http://127.0.0.1:{a.port}")
 ThreadingHTTPServer(("127.0.0.1",a.port),SimpleHTTPRequestHandler).serve_forever()
if __name__=="__main__":main()
