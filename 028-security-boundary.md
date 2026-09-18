# Security Boundary

## Default trust boundary
Docling AI is local-first. SOURCE content, extracted corpus, embeddings, prompts, generated artifacts, logs and AI sessions remain on the workstation unless an explicitly approved export is performed.

## Mandatory controls
- Bind local web services to 127.0.0.1 by default.
- Do not load remote JavaScript, fonts, analytics or CDNs in the Command Center.
- Do not execute macros, scripts or embedded executables during ingestion.
- Treat document text as untrusted data; it can contain prompt-injection instructions.
- Never disable Defender, endpoint protection, AppLocker, WDAC, Controlled Folder Access or corporate controls.
- Detect and stop on UNC/network roots by default; mapped-drive detection is required before enterprise certification.
- Record encryption/unsupported/corrupt states explicitly.
- Keep SOURCE immutable; corrections are separate controlled records.
- No autonomous deletion of source evidence.

## Approval boundaries
Safe local read-only discovery may run automatically. Package/model install, schema migration, restore, mass reprocessing, network research and destructive maintenance require explicit policy/approval gates.

## Isolation limitation
An application that does not intentionally make outbound requests is not equivalent to OS-enforced zero egress. Absolute network isolation requires platform/IT controls.
