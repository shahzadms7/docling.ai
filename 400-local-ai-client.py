#!/usr/bin/env python3
"""Minimal localhost-only Ollama client. Evidence retrieval integration is a later gate."""
import argparse,json,urllib.request
def main():
 p=argparse.ArgumentParser();p.add_argument("--model",required=True);p.add_argument("--prompt",required=True);a=p.parse_args()
 body=json.dumps({"model":a.model,"prompt":a.prompt,"stream":False}).encode()
 req=urllib.request.Request("http://127.0.0.1:11434/api/generate",data=body,headers={"Content-Type":"application/json"})
 with urllib.request.urlopen(req,timeout=300) as r: out=json.load(r)
 print(out.get("response",""))
if __name__=="__main__":main()
