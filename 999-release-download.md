# Download the Complete Project

## Option A — Read everything online
Use the repository root and follow the numbered files from 001 upward.

## Option B — Download the complete GitHub project as ZIP
Use GitHub **Code -> Download ZIP**. GitHub packages the current branch payload into one archive.

Direct GitHub source archive:
`https://github.com/shahzadms7/docling.ai/archive/refs/heads/main.zip`

After extraction, start with:
`001-start-here.ps1`

## Option C — Build a version-labelled ZIP from a checked-out/downloaded copy
Run:
`998-build-release-package.ps1`

The script packages the payload and writes `release-sha256.json` inside the ZIP.

## Parity rule
The public repository is canonical. A packaged release must contain the same payload, except that an archive does not recursively include itself. Verify hashes before certification.
