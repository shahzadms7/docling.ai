# Evidence Bundle Standard

Every certification run produces an evidence bundle containing:
- release/version;
- Git commit;
- machine/environment inventory;
- dependency/model inventory;
- configuration hash;
- schema/parser versions;
- run IDs;
- test plan;
- test results;
- reconciliation report;
- open exceptions;
- performance baseline;
- backup/restore evidence when applicable;
- generated-artifact validation results;
- security regression results;
- operator/sign-off record where required.

Evidence is immutable once a release is certified. Corrections create a new evidence version.
