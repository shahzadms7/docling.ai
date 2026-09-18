# Validation Strategy

Validation proves that an artifact or process conforms to its defined rules before it is trusted downstream.

## Validation layers
1. Package validation — required files, naming, manifest membership, hash evidence.
2. Environment validation — OS, PowerShell, CPU/RAM, disk, filesystem, path type, permissions, Python/Ollama state.
3. Source validation — file stability, size, hash, actual type, encryption/corruption indicators, supported/unsupported structures.
4. Extraction validation — structural counts, parser warnings, empty/partial outputs, coordinate preservation.
5. Corpus validation — source_id/content_id relationships, canonical duplicate rules, schema validity, no silent drops.
6. Search validation — index cardinality, FTS query checks, semantic index cardinality, rebuildability.
7. AI validation — model reachable, prompt/retrieval configuration known, citations resolve to retrieved evidence.
8. Generated artifact validation — file opens, expected sections/sheets/slides/pages exist, source manifest present, review state present.
9. Backup validation — hashes, completeness, schema compatibility, restore rehearsal.
10. Migration validation — pre/post counts, schema version, rollback path, regression suite.

Every validation produces PASS/WARN/FAIL/STOP plus evidence and run_id. A WARN must never be silently promoted to PASS.
