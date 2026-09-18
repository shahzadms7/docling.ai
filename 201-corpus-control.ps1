#requires -Version 5.1
[CmdletBinding()]
param([ValidateSet('init','scan','status')][string]$Action='status',[string]$RuntimeRoot='C:\Projects\docling.ai')
$ErrorActionPreference='Stop'
$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
$py=Get-Command python -ErrorAction SilentlyContinue
if(!$py){throw '[STOP] Python not found. Use the approved dependency path.'}
& $py.Source (Join-Path $Here '200-corpus-engine.py') $Action --root $RuntimeRoot
if($LASTEXITCODE -ne 0){throw ('Corpus engine exited '+$LASTEXITCODE)}
