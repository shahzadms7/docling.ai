# Docling AI — Local Knowledge Workbench

> **Status: FOUNDATION / WORK IN PROGRESS.** Do not use real corpus data until the numbered certification gates say it is safe.

This public repository is deliberately flat and ordered. There are two supported learning paths:

1. **Online:** click each numbered file on GitHub, read it, copy/paste commands when instructed.
2. **Downloaded:** use GitHub **Code → Download ZIP**, extract to a local fixed disk, then start with **001-START-HERE.ps1**.

The goal is exact online/offline release parity. Binary DOCX/XLSX/PPTX/PDF/PNG samples are not yet published to GitHub, so the repository is **not yet release-parity complete**. We do not hide that gap.

## Start in this exact order

| Order | File | Purpose |
|---:|---|---|
| 001 | [001-START-HERE.ps1](001-START-HERE.ps1) | Single Windows PowerShell ISE 5.1 entry point |
| 002 | [002-README-FIRST.md](002-README-FIRST.md) | Product and safety contract |
| 003 | [003-DEPLOYMENT-TIERS.md](003-DEPLOYMENT-TIERS.md) | Prototype → MVP → Pilot → Enterprise |
| 004 | [004-AI-RAM-PROFILES.md](004-AI-RAM-PROFILES.md) | 8/16/24/32 GB CPU-first profiles |
| 005 | [005-COMMAND-CENTER-CONTRACT.md](005-COMMAND-CENTER-CONTRACT.md) | Upload/search/chat/create workspace |
| 006 | [006-TRACEABILITY-CONTRACT.md](006-TRACEABILITY-CONTRACT.md) | Every requirement/run/file/session trace |
| 007 | [007-AUTO-HEAL-CONTRACT.md](007-AUTO-HEAL-CONTRACT.md) | Auto-discovery/debug/heal boundaries |
| 008 | [008-AI-MODEL-CATALOG.md](008-AI-MODEL-CATALOG.md) | Model size/context/role + benchmark contract |
| 009 | [009-INSTALLATION-ENTRYPOINTS.md](009-INSTALLATION-ENTRYPOINTS.md) | PowerShell CLI, CMD/Bash/sh portability model |
| 010 | [010-ENVIRONMENT-DISCOVERY.ps1](010-ENVIRONMENT-DISCOVERY.ps1) | Detect environment; no silent changes |
| 011 | [011-OLLAMA-DISCOVERY-BENCHMARK.ps1](011-OLLAMA-DISCOVERY-BENCHMARK.ps1) | Inspect Ollama/models; benchmark foundation |
| 012 | [012-ONLINE-OFFLINE-PARITY.md](012-ONLINE-OFFLINE-PARITY.md) | GitHub/ZIP synchronization contract |
| 099 | [099-RELEASE-MANIFEST.md](099-RELEASE-MANIFEST.md) | Release completeness gate |

## Permanent architecture

Unzip anywhere on an approved **local fixed disk** → run 001 → discover → assess → choose tier → generate plan → approve → implement → verify → test → safely repair → retest → certify → launch Command Center.

The operator should not answer questions the machine can discover. The application asks only decisions such as deployment tier, approved install source, storage choice when alternatives exist, and approval for material changes.

## Non-negotiable evidence boundary

SOURCE is immutable. No silent upload. No macro/code execution during ingestion. No silent security bypass. Every discovered file is explicitly accounted for. Search indexes are rebuildable. AI output is not evidence. AI answers cite retrieved evidence. Corpus text is untrusted data.

## AI architecture

Huge documents/codebases use **hybrid retrieval**: metadata/exact search + SQLite FTS + semantic embeddings + filters/reranking → evidence chunks → local Ollama model → cited answer. Published model context is not a reason to inject an entire 600-page document into every prompt.

## Command Center destination

Add Documents → Intake → Queue → Processing → Exceptions → Library → Hybrid Search → AI Chat → Deep Analysis → Code/Architecture/Research → Create DOCX/XLSX/PPTX/PDF/Markdown/Code/Diagrams → Review → Outputs → Sessions/Audit → Health → Backup/Recovery → Models/Settings.

## Definition of DONE

A feature is DONE only when requirement, design, code, PowerShell entry point, positive test, failure test, expected result, recovery, rollback, evidence and acceptance state all exist.
