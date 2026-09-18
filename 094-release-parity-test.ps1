#requires -Version 5.1
[CmdletBinding()]param([string]$Root=(Split-Path -Parent $MyInvocation.MyCommand.Path))
$ErrorActionPreference='Stop'
$files=Get-ChildItem -LiteralPath $Root -File | Where-Object {$_.Name -notlike '*.zip'} | Sort-Object Name
$dupes=$files | Where-Object {$_.Name -match '^(\d{3})-'} | Group-Object {([regex]::Match($_.Name,'^(\d{3})-')).Groups[1].Value} | Where-Object Count -gt 1
if($dupes){throw ('[FAIL] Duplicate sequence numbers: '+(($dupes.Name)-join ', '))}
$bad=$files|Where-Object {$_.Name -ne 'README.md' -and $_.Name -notmatch '^\d{3}-[a-z0-9][a-z0-9.-]*\.[a-z0-9]+$'}
if($bad){throw ('[FAIL] Naming violations: '+(($bad.Name)-join ', '))}
Write-Host ('[PASS] Naming/parity surface validated. Files: '+$files.Count) -ForegroundColor Green
