#requires -Version 5.1
[CmdletBinding()]param([string]$PackageRoot=(Split-Path -Parent $MyInvocation.MyCommand.Path))
$ErrorActionPreference='Stop'
$required=@('500-command-center.py','501-start-command-center.ps1','510-command-center.html','511-command-center.css','512-command-center.js')
$fail=@()
foreach($f in $required){$p=Join-Path $PackageRoot $f;if(!(Test-Path -LiteralPath $p)){$fail+=$f}}
if($fail.Count){throw ('[FAIL] Command Center files missing: '+($fail -join ', '))}
$html=Get-Content -LiteralPath (Join-Path $PackageRoot '510-command-center.html') -Raw
foreach($needle in @('Add Documents','Hybrid Search','AI Chat','System Health')){if($html -notmatch [regex]::Escape($needle)){$fail+=('UI:'+ $needle)}}
if($fail.Count){throw ('[FAIL] UI smoke test: '+($fail -join ', '))}
Write-Host '[PASS] COMMAND CENTER STATIC SMOKE TEST' -ForegroundColor Green
