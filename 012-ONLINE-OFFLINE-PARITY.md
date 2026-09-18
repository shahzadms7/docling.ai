# Online / Downloaded Package Parity

Two supported learning paths must describe the same release.

**ONLINE:** open numbered files on GitHub, read/copy commands, execute locally.
**OFFLINE:** download the repository ZIP (GitHub Code → Download ZIP) or a versioned release package when binary release publishing is enabled; extract; start at 001.

## Parity gate
A release manifest records every required path, SHA-256, size and role. CI/release tooling must fail packaging when the downloadable package and release manifest disagree.

## Binary samples
DOCX/XLSX/PPTX/PDF/PNG samples belong to the release package and must also be published through the repository/release binary path. Until binary publishing is completed, they are NOT marked synchronized.
