#requires -Version 5.1
[CmdletBinding()]param([string]$RuntimeRoot='C:\Projects\docling.ai')
$ErrorActionPreference='Stop'
$Here=Split-Path -Parent $MyInvocation.MyCommand.Path
$fail=@()
$packageRequired=@(
 '001-start-here.ps1','002-project-overview.md','003-deployment-editions.md','004-ai-hardware-profiles.md',
 '005-command-center-specification.md','006-traceability-audit-specification.md','007-self-healing-recovery-specification.md',
 '008-ai-model-catalog.md','009-installation-entry-points.md','010-environment-discovery.ps1','011-ollama-discovery-benchmark.ps1',
 '012-distribution-parity.md','013-beginner-installation-guide.md','014-troubleshooting-guide.md',
 '015-foundation-smoke-test.ps1','016-command-prompt-launcher.cmd','017-shell-launcher.sh',
 '018-naming-versioning-standard.md','019-release-content-map.md','020-deployment-orchestrator.ps1',
 '021-runtime-bootstrap.ps1','022-system-diagnostics.ps1','023-safe-repair.ps1','024-synthetic-fixture-loader.ps1',
 '025-release-self-test.ps1','100-sample-source-document.docx','101-sample-source-workbook.xlsx',
 '102-sample-source-presentation.pptx','103-sample-source-pdf.pdf','104-sample-source-image.png','105-sample-source-code.py'
)
foreach($p in $packageRequired){if(!(Test-Path -LiteralPath (Join-Path $Here $p))){$fail+=('PACKAGE:'+ $p)}}
foreach($p in @('SOURCE','CORPUS','OUTPUT','SYSTEM\state','SYSTEM\logs','SYSTEM\reports')){if(!(Test-Path -LiteralPath (Join-Path $RuntimeRoot $p))){$fail+=('RUNTIME:'+ $p)}}
if($fail.Count){$fail|ForEach-Object{Write-Host ('[FAIL] '+$_) -ForegroundColor Red};throw ('Release self-test failed with '+$fail.Count+' issue(s).')}
Write-Host '[PASS] RELEASE FOUNDATION SELF-TEST' -ForegroundColor Green
