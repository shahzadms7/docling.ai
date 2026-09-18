# AI Model Catalog — CPU-First Local Profiles

> Model metadata below is taken from current Ollama library listings. Actual tokens/second, time-to-first-token and usable context depend on CPU, RAM, quantization, context, background load and Ollama version. The deployment controller must benchmark locally and store measured results; it must never invent speed.

| Model | Ollama size | Published context | Inputs | Intended project role |
|---|---:|---:|---|---|
| qwen3:0.6b | 523 MB | 40K | text | ultra-light/diagnostic |
| qwen3:1.7b | 1.4 GB | 40K | text | fast CPU chat |
| qwen3:4b-instruct | 2.5 GB | 256K | text | balanced instruction/reasoning candidate |
| qwen3:8b | 5.2 GB | 40K | text | stronger balanced/deep candidate |
| qwen3:14b | 9.3 GB | 40K | text | slower high-RAM evaluation |
| granite3.3:2b | 1.5 GB | 128K | text | fast enterprise-document/RAG candidate |
| granite3.3:8b | 4.9 GB | 128K | text | document/RAG/code candidate |
| gemma3:1b | 815 MB | 32K | text | lightweight chat |
| gemma3:4b | 3.3 GB | 128K | text+image | multimodal candidate |
| gemma3:12b | 8.1 GB | 128K | text+image | slower high-RAM multimodal evaluation |

## RAM starting policy
8 GB: 0.6B–2B class. 16 GB: 1.7B–4B class. 24 GB: 4B–8B class evaluation. 32 GB: 4B–8B balanced default candidates; 12B/14B only after local benchmark and memory headroom checks.

## Benchmark record
For every installed candidate record: model/tag/digest, file size, configured context, prompt tokens, generated tokens, load time, prompt-eval rate, generation rate, total duration, peak working set if measurable, test prompt hash and timestamp.

## Context rule
Published maximum context is NOT the default operating context. Large context consumes memory and can sharply reduce CPU responsiveness. Long documents use structural extraction + hybrid retrieval first. Deep mode expands evidence only when needed.

## Modes
FAST = smallest approved model + narrow hybrid retrieval.
BALANCED = normal reasoning model + reranking + citations.
DEEP = stronger model/broader retrieval/iterative synthesis, explicitly slower.
VISION = only when an approved local multimodal model is needed for images/figures.
