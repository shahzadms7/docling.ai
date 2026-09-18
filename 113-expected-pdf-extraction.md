# Expected PDF Extraction Result
Input: `103-sample-source-pdf.pdf`

Expected:
- every page accounted
- encryption state checked
- text extraction is page-aware
- image inventory recorded
- image-only pages routed to approved local OCR when available
- citations preserve page/block coordinates where available

Expected evidence:
`[SOURCE sample-pdf-001 | page=1 | block=evidence-sentence]`
