# Expected PPTX Extraction Result
Input: `102-sample-source-presentation.pptx`

Expected:
- all slides accounted
- slide text/shapes/tables/notes/media inventoried where supported
- hidden-slide state retained
- unsupported SmartArt/diagram/embedded-object structures explicitly flagged
- citations use slide and object/shape coordinates where available

Example:
`[SOURCE synthetic-pptx-001 | slide=2 | object=body]`
