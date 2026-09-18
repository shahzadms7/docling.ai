#requires -Version 5.1
[CmdletBinding()]param([Parameter(Mandatory=$true)][string]$Query,[string]$RuntimeRoot='C:\Projects\docling.ai',[int]$Limit=10)
$ErrorActionPreference='Stop';$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
$py=Get-Command python -ErrorAction SilentlyContinue;if(!$py){throw '[STOP] Python not found.'}
& $py.Source (Join-Path $Here '300-search-engine.py') $Query --root $RuntimeRoot --limit $Limit
