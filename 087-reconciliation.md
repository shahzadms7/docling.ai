# Reconciliation Standard

Reconciliation is the accounting control between independent counts and representations.

Required reconciliations:
- discovered files = accounted files;
- PRESENT + MISSING lifecycle totals align with history;
- canonical + duplicate content counts align with unique SHA-256 values;
- source rows = manifest rows where applicable;
- extracted document units reconcile to parser-reported pages/sheets/slides/sections where available;
- index document/chunk counts reconcile to canonical corpus;
- generated artifact source manifest references resolve;
- backup manifest counts/hashes reconcile before restore;
- release manifest files reconcile to package files excluding the package itself.

Discrepancy policy: no silent normalization. Record exception, affected IDs, expected/actual values and operator action.
