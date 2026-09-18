#requires -Version 5.1
[CmdletBinding()]param()
$ErrorActionPreference='Stop'
$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host 'DOCLING AI - ZERO TO DEPLOYMENT' -ForegroundColor Cyan
Write-Host ('Package: '+$Here)
Write-Host '1. Auto-discover environment'
Write-Host '2. Choose Prototype / MVP / Pilot / Enterprise'
Write-Host '3. Build approved plan'
Write-Host '4. Deploy, test, repair, certify'
Write-Host 'Current release is FOUNDATION/WIP: it will not pretend unfinished modules are complete.' -ForegroundColor Yellow
& (Join-Path $Here '010-environment-discovery.ps1')
