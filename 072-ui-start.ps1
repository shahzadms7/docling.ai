#requires -Version 5.1
[CmdletBinding()]
param(
 [string]$RuntimeRoot='C:\Projects\docling.ai',
 [int]$Port=8765,
 [string]$Model=''
)
$ErrorActionPreference='Stop'
$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
$py=Get-Command python -ErrorAction SilentlyContinue
if(!$py){throw '[STOP] Python not found. Use the approved dependency path; do not silently install it.'}
$server=Join-Path $Here '500-command-center.py'
if(!(Test-Path -LiteralPath $server)){throw '[STOP] Command Center server file is missing.'}
$args=@($server,'--root',$RuntimeRoot,'--port',$Port)
if($Model){$args+=@('--model',$Model)}
Write-Host ('[INFO] Starting local Command Center on http://127.0.0.1:'+$Port) -ForegroundColor Cyan
Write-Host '[INFO] No browser data is sent to an external service by this server.' -ForegroundColor Green
Start-Process ('http://127.0.0.1:'+$Port)
& $py.Source @args
if($LASTEXITCODE -ne 0){throw ('Command Center exited with code '+$LASTEXITCODE)}
