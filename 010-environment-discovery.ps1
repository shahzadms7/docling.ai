#requires -Version 5.1
$ErrorActionPreference='Stop'
$os=Get-CimInstance Win32_OperatingSystem
$cs=Get-CimInstance Win32_ComputerSystem
$cpu=Get-CimInstance Win32_Processor | Select-Object -First 1
$py=Get-Command python -ErrorAction SilentlyContinue
$oll=Get-Command ollama -ErrorAction SilentlyContinue
$info=[ordered]@{
 Timestamp=(Get-Date).ToString('o'); Windows=$os.Caption; Build=$os.BuildNumber
 PowerShell=$PSVersionTable.PSVersion.ToString(); RAM_GB=[math]::Round($cs.TotalPhysicalMemory/1GB,1)
 CPU=$cpu.Name; LogicalProcessors=$cpu.NumberOfLogicalProcessors
 Python=if($py){$py.Source}else{'NOT FOUND'}; Ollama=if($oll){$oll.Source}else{'NOT FOUND'}
}
$info.GetEnumerator()|ForEach-Object{Write-Host ('{0,-20} {1}' -f $_.Key,$_.Value)}
Write-Host 'Discovery complete. No settings were bypassed or silently installed.' -ForegroundColor Green
