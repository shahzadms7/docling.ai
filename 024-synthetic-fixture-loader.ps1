#requires -Version 5.1
[CmdletBinding()]param([string]$RuntimeRoot='C:\Projects\docling.ai')
$ErrorActionPreference='Stop'
$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
$map=@{
 '100-sample-source-document.docx'='SOURCE\DOCUMENTS';
 '101-sample-source-workbook.xlsx'='SOURCE\DOCUMENTS';
 '102-sample-source-presentation.pptx'='SOURCE\DOCUMENTS';
 '103-sample-source-pdf.pdf'='SOURCE\DOCUMENTS';
 '104-sample-source-image.png'='SOURCE\IMAGES';
 '105-sample-source-code.py'='SOURCE\CODE'
}
foreach($name in $map.Keys){
 $src=Join-Path $Here $name
 if(!(Test-Path -LiteralPath $src)){throw ('[STOP] Package fixture missing: '+$name)}
 $destDir=Join-Path $RuntimeRoot $map[$name]
 if(!(Test-Path -LiteralPath $destDir)){New-Item -ItemType Directory -Path $destDir -Force|Out-Null}
 $dest=Join-Path $destDir $name
 if(!(Test-Path -LiteralPath $dest)){Copy-Item -LiteralPath $src -Destination $dest;Write-Host ('[COPIED] '+$name)}
 else{Write-Host ('[SKIP] Existing fixture: '+$name)}
}
Write-Host '[PASS] Synthetic fixtures loaded. These are training files only.' -ForegroundColor Green
