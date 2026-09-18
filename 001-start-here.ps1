#requires -Version 5.1
[CmdletBinding()]
param()
$ErrorActionPreference='Stop'
$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host 'DOCLING AI - READY-MADE LOCAL KNOWLEDGE WORKBENCH' -ForegroundColor Cyan
Write-Host ('Package root: '+$Here)
Write-Host ''
Write-Host 'This single entry point performs discovery first, asks only business decisions,'
Write-Host 'builds a deployment plan, requests explicit approval, creates the managed foundation,'
Write-Host 'runs diagnostics and executes the release self-test.'
Write-Host ''
& (Join-Path $Here '020-deployment-orchestrator.ps1')
