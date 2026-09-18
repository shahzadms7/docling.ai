#requires -Version 5.1
[CmdletBinding()]param([string]$RuntimeRoot='C:\Projects\docling.ai')
$ErrorActionPreference='Stop'
Write-Host 'Docling AI - Safe Repair' -ForegroundColor Cyan
if(!(Test-Path -LiteralPath $RuntimeRoot)){throw '[STOP] Runtime root does not exist. Run the orchestrator first.'}
$managed=@('CORPUS','OUTPUT','SYSTEM\logs','SYSTEM\manifests','SYSTEM\state','SYSTEM\reports','SYSTEM\temp','SYSTEM\indexes')
foreach($d in $managed){$p=Join-Path $RuntimeRoot $d;if(!(Test-Path -LiteralPath $p)){New-Item -ItemType Directory -Path $p -Force|Out-Null;Write-Host ('[REPAIRED] '+$d) -ForegroundColor Yellow}}
Write-Host '[PASS] Safe repair completed. SOURCE was not changed.' -ForegroundColor Green
