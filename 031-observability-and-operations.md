# Observability and Operations

Required local logs:
- engine.log
- events.jsonl
- exceptions.jsonl
- audit.jsonl
- performance.jsonl
- ai_sessions.jsonl
- deployment/run ledger

Every run records run_id, start/end, duration, edition, engine/config/schema/parser versions, Python/package versions, Ollama/model digests, file counts, reconciliation and validation results.

Dashboard metrics include total/discovered/visited/accounted, current stage/file, bytes, throughput, elapsed, statuses, file families, pages/slides/sheets/media, open exceptions, disk, last scan, index state, model health and backup state.

No invented ETA. Current/open exception count is distinct from all-time history.
