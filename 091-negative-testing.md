# Negative and Adversarial Testing

The project must prove safe behavior when inputs or dependencies are wrong.

Minimum cases:
- corrupt Office/PDF;
- encrypted files;
- renamed extension / mismatched magic type;
- zero-byte file;
- changing file during intake;
- locked file;
- duplicate content;
- symlink/junction/reparse path;
- mapped/UNC location;
- Unicode/long path;
- missing dependency/model;
- Ollama unavailable;
- malformed AI response;
- prompt-injection text inside corpus;
- HTML/script content in source;
- oversized/expansion-limited archive when archive support is added;
- low disk;
- interrupted schema migration;
- stale lock;
- damaged search index;
- invalid backup.

Success criterion is not merely 'no crash'; it is correct explicit state, preserved evidence, bounded recovery and actionable operator guidance.
