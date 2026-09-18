# Performance Validation

Measure on each target hardware profile rather than extrapolate.

Corpus metrics:
- files/sec and MB/sec discovery/hash;
- parser pages/sheets/slides per minute;
- chunking/index throughput;
- index size and corpus growth ratio.

Retrieval metrics:
- exact/FTS/semantic/hybrid latency;
- top-k relevance regression queries;
- cold/warm index behavior.

AI metrics:
- model load time;
- prompt-eval tokens/sec;
- generation tokens/sec;
- end-to-end latency;
- context size;
- peak RAM;
- concurrent workload behavior.

Generation metrics:
- DOCX/XLSX/PPTX/PDF generation and validation time.

Run each benchmark with machine/model/config identifiers. Never publish a universal speed claim from one machine.
