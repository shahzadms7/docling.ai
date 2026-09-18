# Upgrade and Migration Standard

Every upgrade declares:
- from/to release and schema versions
- compatible editions
- dependency/model changes
- migration steps
- preflight requirements
- backup requirement
- rollback procedure
- regression suite
- evidence bundle

Schema changes are versioned and idempotent where practical. Interrupted migrations resume or roll back from a known checkpoint. Never silently reinterpret historical evidence.
