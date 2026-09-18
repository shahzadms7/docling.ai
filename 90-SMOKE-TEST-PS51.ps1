#requires -Version 5.1
$ErrorActionPreference='Stop';$Root='C:\\Projects\\docling.ai';$bad=@()
foreach($x in @('SOURCE','CORPUS','OUTPUT','SYSTEM\\state','SYSTEM\\logs')){if(!(Test-Path (Join-Path $Root $x))){$bad+=$x}}
if($bad.Count){throw ('FAIL missing: '+($bad -join ', '))};Write-Host '[PASS] FOUNDATION SMOKE TEST' -ForegroundColor Green