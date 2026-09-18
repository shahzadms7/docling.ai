# Expected Code Extraction Result
Input: `105-sample-source-code.py`

Expected:
- read-only ingestion; code is never executed during extraction
- encoding and binary/text detection recorded
- line ranges retained for citations
- symbols/imports/relationships may be added by later approved analyzers
- source hash and path identity retained
- extracted code remains untrusted data for the AI/tool layer

Example citation:
`[SOURCE synthetic-code-001 | file=105-sample-source-code.py | lines=1-5]`
