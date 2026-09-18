#requires -Version 5.1
[CmdletBinding()]param([string]$Root='C:\Projects\docling.ai')
$ErrorActionPreference='Stop'
$required=@('SOURCE','CORPUS','OUTPUT','SYSTEM','SYSTEM\state','SYSTEM\logs')
$missing=@()
foreach($item in $required){if(!(Test-Path -LiteralPath (Join-Path $Root $item))){$missing+=$item}}
if($missing.Count -gt 0){throw ('[FAIL] Missing managed paths: '+($missing -join ', '))}
Write-Host '[PASS] FOUNDATION SMOKE TEST' -ForegroundColor Green
Write-Host ('Root: '+$Root)
