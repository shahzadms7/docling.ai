# Docling AI — Local Knowledge Workbench

> **Release stage: Foundation / Prototype.** This repository now contains the ordered deployment surface, synthetic sample corpus, expected extraction references, baseline corpus/search/local-AI controls, and a local Command Center UI prototype. It is not yet certified for real enterprise production data.

Docling AI is designed as a **local-first, evidence-first, self-deploying knowledge workbench** for large document collections and codebases. The operator should be able to read the project online on GitHub or download the matching package, extract it, start at **001**, and proceed in order.

## Start here

**Windows PowerShell ISE 5.1:** open `001-start-here.ps1` and press **F5**.

**Command Prompt:** run `016-command-prompt-launcher.cmd`.

**Bash/sh:** `017-shell-launcher.sh` is a thin launcher only where a compatible local PowerShell runtime is available. Business logic remains centralized.

## Professional naming standard

All ordered project artifacts use a **three-digit prefix + lowercase kebab-case descriptive name**. `README.md` is the only intentional unnumbered exception because GitHub renders it automatically.

| Range | Purpose |
|---:|---|
| 001–019 | orientation, architecture, installation and standards |
| 020–099 | deployment, diagnostics, repair and runtime control |
| 100–149 | synthetic source fixtures and expected extraction results |
| 150–199 | generated-output examples |
| 200–299 | deterministic corpus/extraction |
| 300–399 | search, embeddings and retrieval |
| 400–499 | local AI/chat/agent |
| 500–599 | Command Center UI/runtime |
| 600–699 | governed document generation |
| 700–799 | tests/regression/certification |
| 800–899 | backup/migration/operations |
| 900–998 | release evidence/manifests/provenance |
| 999 | versioned distribution ZIP |

See `018-naming-versioning-standard.md`.

## Operator journey

`001-start-here.ps1` → environment discovery → deployment edition selection → plan → explicit approval → managed runtime foundation → diagnostics → release self-test.

Deployment editions are **Prototype, MVP, Pilot, Enterprise**. Promotion is evidence-based; a higher edition never weakens SOURCE immutability, traceability, recovery or validation.

## Core architecture

```text
ADD DOCUMENTS
    ↓
STAGE / STABILITY / HASH / TYPE
    ↓
IMMUTABLE SOURCE
    ↓
EXTRACT → VALIDATE → NORMALIZE → CHUNK
    ↓
CANONICAL CORPUS
    ↓
EXACT + METADATA + SQLITE FTS + EMBEDDINGS
    ↓
HYBRID RANKING / RETRIEVAL
    ↓
LOCAL OLLAMA
    ↓
CITED CHAT / ANALYSIS / CODE / RESEARCH
    ↓
GOVERNED DOCX / XLSX / PPTX / PDF / CODE / DIAGRAM OUTPUTS
    ↓
HUMAN REVIEW → APPROVED VERSION → AUDIT
```

## Command Center

The local prototype is implemented in:

- `500-command-center-server.py`
- `501-command-center.html`
- `502-command-center.css`
- `503-command-center.js`
- `504-start-command-center.ps1`

It binds to **127.0.0.1** and uses **no CDN, remote JavaScript, remote fonts or telemetry**. The palette includes enterprise Microsoft-style semantic tokens and Google-style blue/green/yellow/red tokens while remaining an independent project with no affiliation claim.

Target navigation: Home, Add Documents, Queue, Processing, Exceptions, Library, Hybrid Search, AI Chat, Deep Analysis, Code, Research, Architecture, Create, Review, Outputs, Sessions, Audit, Health, Backup/Recovery, Models/Settings.

## Local AI profiles

`004-ai-hardware-profiles.md`, `008-ai-model-catalog.md`, `026-ollama-profile-selector.ps1` and `027-ollama-local-benchmark.ps1` define CPU-first profiles for **8 GB / 16 GB / 24 GB / 32 GB RAM**, plus FAST / BALANCED / DEEP modes.

The project measures local prompt-evaluation and generation rates instead of promising universal tokens-per-second. Large documents use retrieval first; published model context is not treated as a reason to inject a 600-page document into every prompt.

## Synthetic test corpus

The repository includes sample input files:

- `100-sample-source-document.docx`
- `101-sample-source-workbook.xlsx`
- `102-sample-source-presentation.pptx`
- `103-sample-source-pdf.pdf`
- `104-sample-source-image.png`
- `105-sample-source-code.py`

Expected extraction references are `110`–`115`. Generated-output examples are `150`–`154`.

## Security and evidence rules

SOURCE is immutable. No silent cloud upload. No macro execution during ingestion. No security-control bypass. Corpus text is untrusted data. Every discovered file receives an explicit accountable state. Presence and processing state are separate. AI output is not source truth. Evidence-based answers carry citations.

Processing states:

`SUCCESS | PARTIAL | FAILED | ENCRYPTED | UNSUPPORTED | DUPLICATE | INTENTIONALLY_EXCLUDED | PENDING_REVIEW`

## 360-degree engineering coverage

The numbered standards now include security boundary, data lifecycle/schema, failure modes, observability, backup/DR, supply chain, testing/certification, UX/accessibility, AI-agent governance, document generation, research/citations, performance/capacity and maturity gates.

No engineering project can truthfully guarantee that every unforeseeable future condition is already known. The design therefore treats new blind spots as first-class requirements: add them to the risk/failure register, implement detection/recovery, add regression coverage, and preserve evidence.

## Online and downloaded parity

The intended rule is simple:

**GitHub main payload = versioned ZIP payload**, excluding only the ZIP from being recursively embedded inside itself.

The release manifest and package self-test are the gates. Do not call a release certified unless parity, integrity and edition-specific tests pass.

## Definition of DONE

A capability is DONE only when it has requirement → design → implementation → entry point → positive test → failure test → observable evidence → recovery → rollback → acceptance state.

Not affiliated with the Docling open-source project or its maintainers.
