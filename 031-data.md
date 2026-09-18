# Data Lifecycle and Schema

Pipeline:
DISCOVER -> INVENTORY -> HASH -> TYPE DETECTION -> SAFETY CHECK -> EXTRACT -> STRUCTURAL VALIDATION -> NORMALIZE -> CHUNK -> INDEX -> RETRIEVE -> CHAT/CREATE -> REVIEW -> OUTPUT -> AUDIT.

## Identity
- source_id: stable identity of a source location.
- content_id: SHA-256 of bytes.
- version_id: version/supersession identity.
- artifact_id: generated output identity.
- chunk_id: retrieval unit identity.
- run_id/session_id/event_id/exception_id/model_run_id: operational trace.

## States
presence_state: PRESENT | MISSING.
processing_status: SUCCESS | PARTIAL | FAILED | ENCRYPTED | UNSUPPORTED | DUPLICATE | INTENTIONALLY_EXCLUDED | PENDING_REVIEW.
review_state: DRAFT | HUMAN_REVIEW | APPROVED | SUPERSEDED | REJECTED.

Presence and processing are never collapsed into one status.

## Durable evidence
SQLite is operational state. SOURCE + manifests + canonical JSON/Markdown/text + append-only JSONL are durable evidence/exchange. Search indexes are disposable and rebuildable.
