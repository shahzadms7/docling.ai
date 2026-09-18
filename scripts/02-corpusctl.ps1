#requires -Version 5.1
param([ValidateSet('init','dryrun','scan','status')][string]$Action='status',[string]$Root='C:\\Projects\\docling.ai')
$ErrorActionPreference='Stop';$Repo=Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path);$Py=Join-Path $Root '.venv\\Scripts\\python.exe';$Cli=Join-Path $Repo 'src\\docling_ai\\corpusctl.py'
if(!(Test-Path $Py)){throw 'Project Python missing. Run Lab 01 and resolve approved Python first.'}
if($Action -eq 'init'){& $Py $Cli --root $Root init};if($Action -eq 'dryrun'){& $Py $Cli --root $Root scan --dry-run};if($Action -eq 'scan'){& $Py $Cli --root $Root scan};if($Action -eq 'status'){& $Py $Cli --root $Root status}
if($LASTEXITCODE){throw ('corpusctl failed: '+$LASTEXITCODE)}