#requires -Version 5.1
[CmdletBinding()]param([string]$Root=(Split-Path -Parent $MyInvocation.MyCommand.Path))
$ErrorActionPreference='Stop'
$tests=@('015-smoke.ps1','025-selftest.ps1','078-ui-smoke.ps1','094-release-parity-test.ps1')
$results=@()
foreach($t in $tests){
 $p=Join-Path $Root $t
 if(!(Test-Path -LiteralPath $p)){$results+=[pscustomobject]@{test=$t;status='FAIL';detail='missing'};continue}
 try{& $p;$results+=[pscustomobject]@{test=$t;status='PASS';detail='completed'}}
 catch{$results+=[pscustomobject]@{test=$t;status='FAIL';detail=$_.Exception.Message}}
}
$results|Format-Table -AutoSize
if($results.status -contains 'FAIL'){throw '[FAIL] Validation suite has failures.'}
Write-Host '[PASS] Validation suite completed.' -ForegroundColor Green
