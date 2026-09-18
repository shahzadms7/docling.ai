#requires -Version 5.1
[CmdletBinding()]param([string]$RuntimeRoot='C:\Projects\docling.ai')
$ErrorActionPreference='Stop'
$os=Get-CimInstance Win32_OperatingSystem
$cs=Get-CimInstance Win32_ComputerSystem
$cpu=Get-CimInstance Win32_Processor|Select-Object -First 1
$root=[System.IO.Path]::GetPathRoot($RuntimeRoot)
$disk=Get-CimInstance Win32_LogicalDisk -Filter ("DeviceID='"+$root.TrimEnd('\')+"'") -ErrorAction SilentlyContinue
$identity=[Security.Principal.WindowsIdentity]::GetCurrent()
$principal=New-Object Security.Principal.WindowsPrincipal($identity)
$isAdmin=$principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
$py=Get-Command python -ErrorAction SilentlyContinue
$oll=Get-Command ollama -ErrorAction SilentlyContinue
$diag=[ordered]@{
 timestamp=(Get-Date).ToString('o');windows=$os.Caption;build=$os.BuildNumber;powershell=$PSVersionTable.PSVersion.ToString();
 architecture=$env:PROCESSOR_ARCHITECTURE;ram_gb=[math]::Round($cs.TotalPhysicalMemory/1GB,1);cpu=$cpu.Name;
 logical_processors=$cpu.NumberOfLogicalProcessors;elevated=$isAdmin;runtime_root=$RuntimeRoot;
 drive=$root;free_disk_gb=if($disk){[math]::Round($disk.FreeSpace/1GB,1)}else{$null};
 filesystem=if($disk){$disk.FileSystem}else{$null};python=if($py){$py.Source}else{'NOT FOUND'};
 ollama=if($oll){$oll.Source}else{'NOT FOUND'};execution_policy=(Get-ExecutionPolicy -Scope CurrentUser)
}
$out=Join-Path $RuntimeRoot 'SYSTEM\reports\system-diagnostics.json'
$diag|ConvertTo-Json -Depth 8|Set-Content -LiteralPath $out -Encoding UTF8
$diag.GetEnumerator()|ForEach-Object{Write-Host ('{0,-22} {1}' -f $_.Key,$_.Value)}
Write-Host ('[PASS] Diagnostics written: '+$out) -ForegroundColor Green
