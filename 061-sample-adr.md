# Sample Architecture Decision Record

**ADR:** Local-first hybrid retrieval  
**Status:** DRAFT

## Context
Very large document collections cannot be reliably or efficiently inserted into every model prompt.

## Decision
Use deterministic extraction and identity, SQLite-backed metadata/FTS, local embeddings, hybrid ranking and evidence-first prompting to a localhost Ollama model.

## Consequences
Benefits: lower context pressure, stronger traceability, rebuildable indexes and better citation control. Costs: ingestion/indexing complexity, embedding storage and retrieval tuning.

## Review
Human architecture approval required before production adoption.
