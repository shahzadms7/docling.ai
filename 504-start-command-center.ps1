#requires -Version 5.1
[CmdletBinding()]param([int]$Port=8765)
$ErrorActionPreference='Stop';$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
$py=Get-Command python -ErrorAction SilentlyContinue;if(!$py){throw '[STOP] Python not found.'}
Write-Host ('Opening local Command Center at http://127.0.0.1:'+$Port) -ForegroundColor Cyan
Start-Process ('http://127.0.0.1:'+$Port+'/501-command-center.html')
& $py.Source (Join-Path $Here '500-command-center-server.py') --port $Port
