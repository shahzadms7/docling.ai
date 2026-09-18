#requires -Version 5.1
[CmdletBinding()]
param(
 [string]$RuntimeRoot='C:\Projects\docling.ai',
 [ValidateSet('Prototype','MVP','Pilot','Enterprise')][string]$Edition='Prototype'
)
$ErrorActionPreference='Stop'
if($RuntimeRoot.StartsWith('\\')){throw '[STOP] UNC runtime roots are blocked by default.'}
$drive=[System.IO.Path]::GetPathRoot($RuntimeRoot)
if(!$drive){throw '[STOP] Could not resolve runtime drive.'}
$dirs=@(
 'SOURCE','SOURCE\DOCUMENTS','SOURCE\CONVERSATIONS','SOURCE\CODE','SOURCE\IMAGES','SOURCE\AUDIO','SOURCE\VIDEO','SOURCE\RESEARCH',
 'CORPUS','OUTPUT',
 'SYSTEM','SYSTEM\config','SYSTEM\logs','SYSTEM\manifests','SYSTEM\state','SYSTEM\reports','SYSTEM\temp','SYSTEM\indexes','SYSTEM\models','SYSTEM\packages','SYSTEM\tests','SYSTEM\backups'
)
foreach($d in $dirs){
 $p=Join-Path $RuntimeRoot $d
 if(!(Test-Path -LiteralPath $p)){New-Item -ItemType Directory -Path $p -Force|Out-Null}
}
$state=[ordered]@{
 schema_version='1.0';created_or_verified=(Get-Date).ToString('o');edition=$Edition;runtime_root=$RuntimeRoot;
 source_immutable=$true;human_control_plane='PowerShell 5.1'
}
$state|ConvertTo-Json -Depth 6|Set-Content -LiteralPath (Join-Path $RuntimeRoot 'SYSTEM\state\deployment.json') -Encoding UTF8
Write-Host '[PASS] Managed runtime foundation created/verified.' -ForegroundColor Green
