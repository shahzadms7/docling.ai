# FOUNDATION-FIRST ENGINEERING MODEL

> Status: FOUNDATION GATE. Feature development must not outrun the foundation.

## Why this exists
This project is being rebuilt around public engineering patterns rather than feature-first coding. Microsoft Azure Well-Architected explicitly uses pillars, checklists, design strategies, tradeoffs, maturity and production-readiness assessment. AWS Well-Architected uses foundational questions and six quality pillars. GitHub recommends a clear README plus repository governance/security material. We adapt those public patterns to this local Windows/no-admin workload; we do not claim Microsoft, AWS, Google or GitHub use this exact implementation.

## Foundation milestone F0 - Project constitution
Before document parsers, dashboard or AI, freeze: mission, scope, non-goals, constraints, trust boundaries, terminology, source immutability, public/private boundary, supported Windows/PowerShell contract, local-only policy, status taxonomy, definition of done and acceptance authority.

## Foundation milestone F1 - Requirements traceability
Every requirement gets a stable REQ-ID and maps to design, risk, implementation, PowerShell entry point, automated test, failure test, recovery, evidence and acceptance state. Nothing is DONE merely because it appears in prose.

## Foundation milestone F2 - Architecture decisions
Use lightweight ADR records for consequential choices: C:\Projects\docling.ai root, PowerShell ISE 5.1 human control plane, Python internal engine, SQLite baseline, immutable SOURCE, no Docker initially, no admin, localhost-only UI, offline dependency model, Ollama local AI, parser strategy and migration boundaries.

## Foundation milestone F3 - Engineering quality pillars
Every component is reviewed for Reliability, Security, Operational Excellence, Performance Efficiency, Maintainability, Recoverability, Auditability, Privacy/Data Boundary, Supply-Chain Integrity and Resource/Storage Efficiency. Tradeoffs are recorded rather than hidden.

## Foundation milestone F4 - Threat and failure model
Model hostile documents, prompt injection, macros/OLE, archives, path traversal, symlink/junction loops, partial copies, locked files, malformed containers, parser crashes, disk full, DB lock/corruption, process crash, power loss, stale lock, dependency drift, model drift, accidental public disclosure and operator error.

## Foundation milestone F5 - Repository engineering
Repository structure, naming, branch/change policy, issue/requirement templates, review gates, release/version policy, security policy, contribution rules, dependency policy, test layout, synthetic fixtures and documentation rules are defined before scale-out.

## Foundation milestone F6 - Environment qualification
One PowerShell 5.1 ISE diagnostic must detect OS/build, PowerShell, bitness, user/elevation, root/writeability, fixed/network drive, free disk, long-path behavior, execution policy visibility, Python/venv, SQLite, Ollama/models, package/wheelhouse state and likely enterprise-policy blockers. Detection does not bypass policy.

## Foundation milestone F7 - Data contracts and lifecycle
Freeze source_id vs content_id, run_id, parser_id/version, schema_version, presence state, processing state, validation state, review state, duplicate relationship, version/supersession relationship, error code, retry state, timestamps and durable manifest format before full ingestion.

## Foundation milestone F8 - Transaction and recovery model
All derived writes use temp -> fsync/close -> validate -> atomic publish where supported. Runs are idempotent. Crash recovery, checkpointing, bounded retry, stale-lock handling, DB integrity check, index rebuild and reconciliation are designed before production corpus.

## Foundation milestone F9 - Observability
Structured run/event/error/performance/audit ledgers; exact current stage/file; counts by state; bytes; throughput; disk; parser versions; reconciliation; open exceptions; health status. Logs rotate without destroying required audit evidence.

## Foundation milestone F10 - Synthetic certification suite
Fixtures cover normal, duplicate, rename, delete, zero-byte, Unicode, long path, locked, partial-copy, corrupt, encrypted, unsupported, huge, hidden Office structures, macros, image-only PDF, low-confidence OCR, symlink/junction, archive limits later, crash, DB lock and disk-low simulations where safe.

## Foundation milestone F11 - Supply-chain and reproducibility
Approved offline wheelhouse, pinned versions, hashes, provenance, licenses/SBOM, deterministic environment report and upgrade procedure. No silent internet installation.

## Foundation milestone F12 - Human operations contract
Human runs PowerShell ISE 5.1 entry points. Every lab has Purpose, Prerequisite, Exact Action, Expected Output, Evidence, PASS/WARN/FAIL, Troubleshooting, Auto-repair Boundary, Rollback, STOP condition and Next Task. Python remains an implementation detail wherever practical.

## Foundation milestone F13 - Production readiness gate
Real corpus is blocked until requirements traceability, environment qualification, lifecycle schema, transaction/recovery, observability, synthetic tests, dependency integrity, backup/restore and reconciliation pass. A machine-readable acceptance report records evidence.

## Foundation milestone F14 - Learning/training architecture
Public documentation follows a progressive path: concepts -> prerequisites -> guided lab -> expected result -> validation -> failure lab -> recovery -> knowledge check -> next module. The repository should teach a new operator how and why the system works, not merely expose source code.

## Mandatory traceability record
REQ-ID | requirement | source/decision | pillar | risk | design | implementation | PS entry | positive test | failure test | recovery | evidence | status

## Change rule
No new feature milestone may be marked complete if it introduces an untracked requirement, undocumented tradeoff, untested failure mode or unrecoverable state.

## Foundation exit criteria
Foundation is PASS only when a clean standard-user Windows 11 environment can run the qualification/bootstrap/synthetic certification path from PowerShell ISE 5.1; every discovered synthetic input is reconciled; intentional failures are visible; restart/recovery is demonstrated; dependency provenance is known; backup/restore is demonstrated; and the acceptance report has no unexplained UNKNOWN state.

## Then features begin
Only after the foundation gate: text/code -> DOCX -> XLSX/XLSM -> PPTX -> PDF -> images/OCR -> canonical corpus -> search -> dashboard/watcher -> Ollama RAG -> governed generation -> advanced semantic/media features.