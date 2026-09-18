# Sample Operations Runbook

## Daily start
1. Launch 001-start-here.ps1 or the certified Command Center launcher.
2. Confirm System Health has no STOP state.
3. Review open exceptions.
4. Add documents through controlled intake.
5. Confirm reconciliation before relying on search/AI.

## Failure
Do not edit SOURCE. Record the failing stage and error. Use bounded retry or 023-safe-repair.ps1 only for allowed managed-state repair.

## Recovery
Validate backup/restore evidence before cutover. Rebuild disposable indexes from canonical corpus when appropriate.
