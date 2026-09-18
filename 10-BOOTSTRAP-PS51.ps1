#requires -Version 5.1
[CmdletBinding()] param([string]$Root='C:\\Projects\\docling.ai',[switch]$Repair)
$ErrorActionPreference='Stop'
function Step($s){Write-Host ('==> '+$s) -ForegroundColor Cyan}
function Ok($s){Write-Host ('[PASS] '+$s) -ForegroundColor Green}
Step 'Docling AI standard-user preflight'
if($Root.StartsWith('\\\\')){throw 'UNC path blocked; use local fixed disk.'}
$dirs=@('SOURCE','SOURCE\\DOCUMENTS','SOURCE\\CONVERSATIONS','SOURCE\\CODE','SOURCE\\IMAGES','SOURCE\\RESEARCH','CORPUS','OUTPUT','SYSTEM','SYSTEM\\config','SYSTEM\\logs','SYSTEM\\manifests','SYSTEM\\state','SYSTEM\\reports','SYSTEM\\temp','SYSTEM\\indexes','SYSTEM\\models','SYSTEM\\packages','SYSTEM\\tests')
foreach($d in $dirs){$p=Join-Path $Root $d;if(!(Test-Path -LiteralPath $p)){New-Item -ItemType Directory -Path $p -Force|Out-Null}}
Ok 'Project folders created/verified'
$py=$null;foreach($c in @('py','python','python3')){if(Get-Command $c -ErrorAction SilentlyContinue){$py=$c;break}}
if($py){Ok ('Python command discovered: '+$py);$v=Join-Path $Root '.venv';if(!(Test-Path $v)){try{if($py -eq 'py'){& py -3 -m venv $v}else{& $py -m venv $v};if($LASTEXITCODE){throw 'venv failed'};Ok 'Virtual environment created'}catch{Write-Warning $_.Exception.Message}}}else{Write-Warning 'Python not found; Python labs are blocked until approved Python is available.'}
$oll=Get-Command ollama -ErrorAction SilentlyContinue;if($oll){Ok 'Ollama discovered'}else{Write-Warning 'Ollama not found on PATH; AI lab can wait.'}
$state=[ordered]@{timestamp=(Get-Date).ToString('o');root=$Root;user=$env:USERNAME;powershell=$PSVersionTable.PSVersion.ToString();python=$py;ollama=[bool]$oll}
$state|ConvertTo-Json|Set-Content -LiteralPath (Join-Path $Root 'SYSTEM\\state\\preflight.json') -Encoding UTF8
Ok 'LAB 01 BOOTSTRAP COMPLETE'
Write-Host 'NEXT: open SYSTEM\\state\\preflight.json, then run tests\\01-smoke.ps1' -ForegroundColor Yellow