#requires -Version 5.1
$ErrorActionPreference='Stop'
$ram=[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB,1)
if($ram -lt 12){$class='LIGHT';$chat='0.6B-2B';$mode='FAST'}
elseif($ram -lt 20){$class='STANDARD';$chat='1.7B-4B';$mode='FAST/BALANCED'}
elseif($ram -lt 28){$class='ENHANCED';$chat='4B-8B';$mode='BALANCED'}
else{$class='ADVANCED-CPU';$chat='4B-8B default; larger only after benchmark';$mode='FAST/BALANCED/DEEP'}
Write-Host ('RAM GB:        '+$ram)
Write-Host ('Profile:       '+$class)
Write-Host ('Chat class:    '+$chat)
Write-Host ('Default modes: '+$mode)
Write-Host 'This is a starting policy only. Local benchmark results override assumptions.' -ForegroundColor Yellow
