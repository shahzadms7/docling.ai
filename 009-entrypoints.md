# Installation Entry Points

## Canonical Windows path
Open **001-start-here.ps1** in Windows PowerShell ISE 5.1 and press F5. This is the authoritative human control plane for the current Windows implementation.

## PowerShell CLI
```powershell
Set-Location '<where-you-extracted-the-package>'
.\001-start-here.ps1
```

## Command Prompt
Run **016-command-prompt-launcher.cmd**. It is a thin launcher for the same PowerShell orchestrator.

## Bash / sh
Run **017-shell-launcher.sh** only where a compatible local PowerShell executable is available. It is a thin launcher; it does not duplicate deployment business logic.

## Engineering rule
**One orchestration/state model, multiple thin entry points.** Platform launchers may differ, but discovery, planning, implementation, checkpoints, tests, repair boundaries and evidence contracts must not fork into separate products.
