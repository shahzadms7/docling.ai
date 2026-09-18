# Backup, Recovery and Disaster Recovery

## Backup scope
Back up configuration, manifests, canonical corpus, SQLite state, generated outputs, approved corrections and release provenance. SOURCE backup policy is organization-specific because SOURCE may already be governed elsewhere.

## Rules
- Backups are local/approved targets only by default.
- Backups are versioned and hashed.
- Restore runs to staging first, validates schema/content and requires explicit approval before cutover.
- Search indexes may be rebuilt rather than backed up.
- Recovery drills are mandatory before Pilot/Enterprise certification.

## Recovery objectives
Prototype/MVP may use manual recovery. Pilot requires documented restore runbooks. Enterprise requires tested RPO/RTO targets defined by the operating organization; this project must not invent business RPO/RTO values.
