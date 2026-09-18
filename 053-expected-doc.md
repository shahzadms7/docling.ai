# Expected DOCX Extraction Result
Input: `100-sample-source-document.docx`

Expected accountable outcome:
- processing_status: SUCCESS
- paragraphs: captured
- tables: captured
- images: inventoried
- source coordinates: section/paragraph/table where available
- unsupported structures: explicitly reported, never silently omitted

Expected evidence snippet:
`[SOURCE synthetic-docx-001 | section=Section 1 - Intake | paragraph=1]`
