# Backup, Restore and Disaster Recovery Standard

SOURCE, durable manifests/configuration, schema state, and approved outputs are protected according to the deployment edition. Derived indexes/caches should be rebuildable.

## Backup principles
- local/approved destination only by default
- never overwrite the only good backup
- manifest + hash verification
- backup metadata includes release/schema/config versions
- periodic restore test, not just backup creation

## Recovery order
1. Stop writers.
2. Capture diagnostics.
3. Protect SOURCE and durable manifests.
4. Validate backup.
5. Restore into staging.
6. Integrity-check.
7. Reconcile source/inventory/manifests.
8. Rebuild disposable indexes.
9. Run synthetic and regression tests.
10. Human approval before returning to service.

## Enterprise gate
A backup is not considered reliable until a restore rehearsal has passed.
