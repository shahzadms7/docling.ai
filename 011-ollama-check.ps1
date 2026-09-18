#requires -Version 5.1
$ErrorActionPreference='Stop'
$oll=Get-Command ollama -ErrorAction SilentlyContinue
if(!$oll){Write-Host '[STOP] Ollama not found. Use approved installation process.' -ForegroundColor Red; return}
Write-Host ('[PASS] Ollama: '+$oll.Source) -ForegroundColor Green
& ollama --version
Write-Host 'Installed models:' -ForegroundColor Cyan
& ollama list
Write-Host ''
Write-Host 'No model is automatically pulled by this foundation script.' -ForegroundColor Yellow
Write-Host 'Model download changes local storage and may use the network; deployment plan requires explicit approval.'
