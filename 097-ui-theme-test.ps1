#requires -Version 5.1
[CmdletBinding()]param([string]$Root=(Split-Path -Parent $MyInvocation.MyCommand.Path))
$ErrorActionPreference='Stop'
$html=Get-Content -LiteralPath (Join-Path $Root '073-ui.html') -Raw
$css=Get-Content -LiteralPath (Join-Path $Root '074-ui.css') -Raw
$js=Get-Content -LiteralPath (Join-Path $Root '075-ui.js') -Raw
$required=@('white','black','microsoft','google')
foreach($t in $required){
 if($html -notmatch ('value="'+[regex]::Escape($t)+'"')){throw "[FAIL] Missing theme option: $t"}
 if($t -ne 'white' -and $css -notmatch ('data-theme="'+[regex]::Escape($t)+'"')){throw "[FAIL] Missing CSS theme: $t"}
}
if($html -notmatch '/074-ui.css'){throw '[FAIL] HTML CSS reference mismatch.'}
if($html -notmatch '/075-ui.js'){throw '[FAIL] HTML JS reference mismatch.'}
if($css -match 'https?://'){throw '[FAIL] Remote CSS asset reference detected.'}
if($html -match 'https?://'){throw '[FAIL] Remote HTML asset reference detected.'}
if($js -notmatch 'localStorage'){throw '[FAIL] Theme persistence missing.'}
Write-Host '[PASS] Four-theme UI standard verified.' -ForegroundColor Green
