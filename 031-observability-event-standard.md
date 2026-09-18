# Observability and Event Standard

## Durable ledgers
- engine.log — human-readable operational log
- events.jsonl — structured append-only processing events
- exceptions.jsonl — structured failures/open exceptions
- audit.jsonl — operator/system changes and approvals
- performance.jsonl — throughput/durations/resource observations
- ai_sessions.jsonl — local AI request metadata and evidence references
- run-ledger.jsonl — run start/end/reconciliation/version evidence

## Required IDs
deployment_id, run_id, session_id, task_id, event_id, source_id, content_id, artifact_id, chunk_id, exception_id, model_run_id.

## File accountability
Presence state: PRESENT / MISSING.
Processing state: SUCCESS / PARTIAL / FAILED / ENCRYPTED / UNSUPPORTED / DUPLICATE / INTENTIONALLY_EXCLUDED / PENDING_REVIEW.

MISSING is lifecycle/presence information, not a processing result.

## Evidence coordinates
DOCX: section/paragraph/table/relation where available.
XLSX: workbook/sheet/range/cell/name/object.
PPTX: slide/shape/note/media.
PDF: page/block/image.
Code/text: file/line range.
Image: image/object/OCR region when available.

Unsupported coordinates are reported as unavailable; never fabricated.
