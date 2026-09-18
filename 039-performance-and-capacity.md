# Performance and Capacity Plan

CPU-first target profiles must measure rather than promise performance.

Track:
- discovery/hash throughput
- parser documents/pages per minute
- OCR time per page
- chunk/index throughput
- retrieval latency
- model load time
- prompt-evaluation tokens/second
- generation tokens/second
- end-to-end chat latency
- peak RAM and free disk
- corpus/index/model/temp/output growth

Start conservatively with 2-4 parser workers on 32 GB systems and benchmark. Hashing is I/O-bound; OCR/model inference are constrained. Models should run one at a time on low-memory systems.

Capacity forecast includes SOURCE + canonical corpus + OCR derivatives + indexes + models + temp + generated outputs + backups.
