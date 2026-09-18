#requires -Version 5.1
[CmdletBinding()]
param(
 [string]$Version='v0.3.0-foundation',
 [string]$PackageRoot=(Split-Path -Parent $MyInvocation.MyCommand.Path)
)
$ErrorActionPreference='Stop'
$PackageRoot=(Resolve-Path -LiteralPath $PackageRoot).Path
$out=Join-Path $PackageRoot ("docling-ai-release-"+$Version+".zip")
if(Test-Path -LiteralPath $out){Remove-Item -LiteralPath $out -Force}
$staging=Join-Path $env:TEMP ("docling-ai-release-"+[guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $staging -Force|Out-Null
try{
  $exclude=@((Split-Path -Leaf $out),'.git')
  Get-ChildItem -LiteralPath $PackageRoot -Force | Where-Object {
    $_.Name -notin $exclude -and $_.Name -ne '.git'
  } | ForEach-Object {
    Copy-Item -LiteralPath $_.FullName -Destination $staging -Recurse -Force
  }
  $hashes=Get-ChildItem -LiteralPath $staging -File -Recurse | Sort-Object FullName | ForEach-Object {
    [pscustomobject]@{path=$_.FullName.Substring($staging.Length+1);bytes=$_.Length;sha256=(Get-FileHash -Algorithm SHA256 -LiteralPath $_.FullName).Hash.ToLowerInvariant()}
  }
  $hashes|ConvertTo-Json -Depth 4|Set-Content -LiteralPath (Join-Path $staging 'release-sha256.json') -Encoding UTF8
  Compress-Archive -Path (Join-Path $staging '*') -DestinationPath $out -CompressionLevel Optimal
  Write-Host ('[PASS] Release ZIP: '+$out) -ForegroundColor Green
  Write-Host ('SHA256: '+(Get-FileHash -Algorithm SHA256 -LiteralPath $out).Hash.ToLowerInvariant())
}finally{
  if(Test-Path -LiteralPath $staging){Remove-Item -LiteralPath $staging -Recurse -Force}
}
