#requires -Version 5.1
[CmdletBinding()]
param(
  [ValidateSet('Interactive','Prototype','MVP','Pilot','Enterprise')]
  [string]$Edition='Interactive',
  [string]$RuntimeRoot='C:\Projects\docling.ai'
)
$ErrorActionPreference='Stop'
$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
function Step([string]$m){Write-Host ('==> '+$m) -ForegroundColor Cyan}
function Pass([string]$m){Write-Host ('[PASS] '+$m) -ForegroundColor Green}
function StopMsg([string]$m){Write-Host ('[STOP] '+$m) -ForegroundColor Red}

Step 'Docling AI deployment orchestration'
& (Join-Path $Here '010-environment-discovery.ps1')

if($Edition -eq 'Interactive'){
  Write-Host ''
  Write-Host 'Choose deployment edition:'
  Write-Host '[1] Prototype - synthetic learning/certification'
  Write-Host '[2] MVP       - controlled real local corpus'
  Write-Host '[3] Pilot     - monitored controlled business use'
  Write-Host '[4] Enterprise- governed architecture target'
  $choice=Read-Host 'Selection'
  $Edition=@{'1'='Prototype';'2'='MVP';'3'='Pilot';'4'='Enterprise'}[$choice]
  if(!$Edition){throw 'Invalid deployment edition selection.'}
}

$plan=[ordered]@{
  schema_version='1.0'
  generated_at=(Get-Date).ToString('o')
  edition=$Edition
  package_root=$Here
  runtime_root=$RuntimeRoot
  human_control_plane='Windows PowerShell 5.1'
  source_policy='IMMUTABLE'
  network_policy='No corpus upload; localhost AI/UI only unless explicitly approved'
  status='PLANNED'
}
$planPath=Join-Path $Here 'deployment-plan.preview.json'
$plan|ConvertTo-Json -Depth 8|Set-Content -LiteralPath $planPath -Encoding UTF8
Pass ('Deployment plan written: '+$planPath)

Write-Host ''
Write-Host 'Plan summary:' -ForegroundColor Yellow
$plan.GetEnumerator()|ForEach-Object{Write-Host ('{0,-22} {1}' -f $_.Key,$_.Value)}

$approval=Read-Host 'Type APPROVE to create/verify the managed runtime foundation; anything else stops'
if($approval -cne 'APPROVE'){StopMsg 'No changes made beyond the preview plan.'; return}

& (Join-Path $Here '021-runtime-bootstrap.ps1') -RuntimeRoot $RuntimeRoot -Edition $Edition
& (Join-Path $Here '022-system-diagnostics.ps1') -RuntimeRoot $RuntimeRoot
& (Join-Path $Here '025-release-self-test.ps1') -RuntimeRoot $RuntimeRoot
Pass 'Foundation orchestration complete. Read generated reports before real-data use.'
