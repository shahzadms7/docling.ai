# Expected Image Extraction Result
Input: `104-sample-source-image.png`

Expected:
- binary hash and metadata retained
- image never overwritten
- OCR is local-only when enabled
- OCR confidence/location recorded when the OCR backend exposes it
- visual interpretation remains AI-generated interpretation, not source truth
- source image can be cited as an image-level evidence object
