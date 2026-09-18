# Installation Entry Points

## Primary supported path — Windows
Open **001-START-HERE.ps1** in Windows PowerShell ISE 5.1 and press F5. This is the authoritative human control plane for the current project.

## PowerShell CLI
From an existing PowerShell 5.1 console:
```powershell
Set-Location '<where-you-extracted-the-package>'
.\001-START-HERE.ps1
```

## CMD launcher
A future numbered `.cmd` wrapper may launch the same PowerShell orchestrator. CMD is a launcher, not a second implementation.

## Bash / sh
Bash/sh are portability targets only after the Windows implementation is certified. They must call the same declarative deployment plan/state model rather than fork business logic.

## Principle
One engine, one configuration schema, one state machine, multiple thin launchers. Never maintain four unrelated installers.
