# Supply Chain and Dependencies

Target installation uses an approved offline wheelhouse/package source where required.

Controls:
- version-pinned lockfiles
- cryptographic hashes
- package provenance
- license inventory
- SBOM generation
- vulnerability review
- no surprise runtime downloads
- no cloud plugins in the deterministic core
- approved upgrade/change window
- rollback package retained

Python libraries, Ollama, models, OCR, FFmpeg, LibreOffice/Office automation and optional parsers are dependencies with separate approval/state records. Missing optional dependencies must degrade visibly, never silently.
