# Traceability Contract
Permanent IDs include deployment_id, run_id, session_id, task_id, event_id, source_id, content_id, document_version_id, artifact_id, chunk_id, exception_id and model_run_id.

Every requirement maps:
REQ-ID → design → risk → implementation → PowerShell entry → positive test → failure test → recovery → rollback → evidence → acceptance state.

Every run records environment/config/schema/parser/model/dependency versions. No prose-only feature is DONE.
