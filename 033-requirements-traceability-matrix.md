# Requirements Traceability Matrix

| ID | Requirement | Design | Implementation | Test/Evidence | Status |
|---|---|---|---|---|---|
| REQ-001 | Single beginner entry point | Orchestrator | 001, 020 | 025 | IMPLEMENTED-FOUNDATION |
| REQ-002 | Auto-discover environment | Discovery | 010, 022 | diagnostics JSON | PARTIAL |
| REQ-003 | Prototype/MVP/Pilot/Enterprise | Editions | 003, 020 | deployment plan | PARTIAL |
| REQ-004 | Immutable SOURCE | Trust boundary | 021, 029 | smoke/self-test | PARTIAL |
| REQ-005 | Safe self-heal | Recovery policy | 007, 023 | manual review | FOUNDATION |
| REQ-006 | Synthetic Office/PDF/Image/Code fixtures | Test corpus | 100-105 | 110-115 | IMPLEMENTED |
| REQ-007 | CPU RAM-aware Ollama profiles | AI policy | 004, 008, 026 | 027 benchmark | PARTIAL |
| REQ-008 | Hybrid retrieval | Retrieval design | 300-series planned | regression planned | NOT-YET-CERTIFIED |
| REQ-009 | Local AI chat | AI design | 400-series planned | AI tests planned | NOT-YET-CERTIFIED |
| REQ-010 | Command Center | UI/UX design | 500-series | local UI test | FOUNDATION-PROTOTYPE |
| REQ-011 | Add Documents from UI | Intake transaction | 500-series | upload fixture test | FOUNDATION-PROTOTYPE |
| REQ-012 | Generate DOCX/XLSX/PPTX/PDF/MD/diagrams | Output governance | 150-series examples; 600-series planned | artifact checks | PARTIAL |
| REQ-013 | Online/offline parity | Distribution contract | 012, 900, 999 | manifest/hash | PARTIAL |
| REQ-014 | Full trace/session/audit | Observability | 031; engine work planned | ledger tests | PARTIAL |
| REQ-015 | Backup/restore certification | DR | 032; 800-series planned | restore rehearsal | NOT-YET-CERTIFIED |

Status is evidence-based. No row may be marked complete because documentation merely describes it.
