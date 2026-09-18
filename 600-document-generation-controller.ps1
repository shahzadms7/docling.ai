#requires -Version 5.1
[CmdletBinding()]
param(
 [ValidateSet('DOCX','XLSX','PPTX','PDF','MARKDOWN','TEXT','CODE','DIAGRAM')][string]$Type,
 [string]$RuntimeRoot='C:\Projects\docling.ai'
)
$ErrorActionPreference='Stop'
Write-Host 'Docling AI - Governed Generation Controller' -ForegroundColor Cyan
Write-Host ('Requested type: '+$Type)
Write-Host '[GATE] Full artifact-generation backends are edition/dependency controlled.' -ForegroundColor Yellow
Write-Host '[RULE] Generated output must carry artifact_id, evidence manifest, review state and validation result.'
Write-Host '[RULE] SOURCE is never overwritten.'
