# Naming and Versioning Standard

## Repository naming
All ordered project files use a three-digit numeric prefix plus lowercase kebab-case descriptive name.

Examples:
- `001-start-here.ps1`
- `020-deployment-orchestrator.ps1`
- `100-sample-source-document.docx`
- `900-release-manifest.md`
- `999-docling-ai-release-v0.3.0.zip`

`README.md` is the only intentional unnumbered exception because GitHub renders it automatically.

## Number ranges
- 001-019: orientation, policy, architecture and operator guidance
- 020-099: deployment, diagnostics, recovery and runtime control
- 100-149: synthetic source fixtures and expected extraction results
- 150-199: generated-output examples
- 200-299: corpus/extraction implementation
- 300-399: search, embeddings and retrieval
- 400-499: AI/chat/agent implementation
- 500-599: Command Center implementation
- 600-699: document-generation implementation
- 700-799: tests, regression and certification
- 800-899: migration, backup, restore and operations
- 900-998: manifests, release evidence, SBOM/provenance
- 999: versioned distribution ZIP

## Versioning
Use Semantic Versioning where practical: MAJOR.MINOR.PATCH.
- MAJOR: incompatible contract change requiring controlled migration.
- MINOR: backward-compatible capability addition.
- PATCH: backward-compatible fix/documentation/test correction.

A release is not certified merely because it has a version number.
