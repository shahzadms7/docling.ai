# CPU-Only Ollama Profiles
The installer measures actual RAM/CPU/disk and benchmarks locally. These are conservative starting classes, not speed guarantees.

- **8 GB RAM:** small 1–3B chat class; small embedding model; short retrieval context; one model workload at a time.
- **16 GB:** 3–4B chat class; small embedding model; moderate context.
- **24 GB:** 7–9B quantized chat class can be evaluated; small/medium embeddings; keep concurrency low.
- **32 GB:** 8B-class balanced default candidate; optional stronger/slower profile after benchmark.

Modes: **FAST** = small model + narrow retrieval; **BALANCED** = normal hybrid RAG; **DEEP** = broader retrieval/rerank/iterative analysis with explicit time cost.

Do not solve 600-page documents by forcing the whole document into context. Use structural extraction + FTS + embeddings + hybrid ranking + citations.
