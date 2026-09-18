#requires -Version 5.1
[CmdletBinding()]param([Parameter(Mandatory=$true)][string]$Model,[Parameter(Mandatory=$true)][string]$Prompt)
$ErrorActionPreference='Stop';$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
$py=Get-Command python -ErrorAction SilentlyContinue;if(!$py){throw '[STOP] Python not found.'}
& $py.Source (Join-Path $Here '400-local-ai-client.py') --model $Model --prompt $Prompt
