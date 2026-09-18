# Operations Runbook

## Start of day
1. Launch the certified entry point.
2. Check System Health and open exceptions.
3. Confirm disk headroom and runtime/model state.
4. Review incomplete prior runs before new ingestion.

## Intake
Use controlled Add Documents/intake. Never manually edit managed corpus/state files.

## Incident
Capture run_id, source_id, stage, error, versions and evidence. Prefer bounded retry. Use safe repair only for managed/rebuildable state. Do not modify SOURCE or bypass enterprise controls.

## Maintenance
Back up governed state before migration/upgrade. Validate migration in staging. Retain rollback package. Rebuild disposable indexes as needed.

## Shutdown
Complete/checkpoint active runs, confirm logs flushed, and preserve unresolved exceptions for the next session.
