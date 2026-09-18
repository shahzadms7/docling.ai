# A-to-Z Actionable Labs - Windows PowerShell 5.1 ISE

THIS is the human execution path. Default root: C:\Projects\docling.ai. Run as a normal user, not Administrator.

## Lab 00 - Gate
Use Windows PowerShell ISE 5.x. SOURCE is immutable. No silent downloads. No UNC/mapped root. 100% means every discovered file receives an explicit status.

## Lab 01 - Bootstrap
Open scripts/01-bootstrap.ps1 in ISE and press F5.
Expected: [PASS] LAB 01 BOOTSTRAP COMPLETE.
Then run: Get-Content 'C:\Projects\docling.ai\SYSTEM\state\preflight.json'
Repair: run the same script with -Repair. Repair may recreate managed folders; it must never delete SOURCE.

## Lab 02 - Smoke
Open tests/01-smoke.ps1 in ISE and press F5. Expected: [PASS] FOUNDATION SMOKE TEST.

## Lab 03 - SQLite init
From ISE run: & '<REPO>\scripts\02-corpusctl.ps1' -Action init
Expected: INIT PASS. If Python is missing, STOP and use the approved enterprise software process; do not silently download it.

## Lab 04 - Synthetic fixtures
Run in ISE:
'alpha' | Set-Content 'C:\Projects\docling.ai\SOURCE\DOCUMENTS\alpha.txt'
Copy-Item 'C:\Projects\docling.ai\SOURCE\DOCUMENTS\alpha.txt' 'C:\Projects\docling.ai\SOURCE\DOCUMENTS\alpha-copy.txt'
'beta' | Set-Content 'C:\Projects\docling.ai\SOURCE\CODE\beta.txt'

## Lab 05 - Dry run
& '<REPO>\scripts\02-corpusctl.ps1' -Action dryrun
Expected discovered=3.

## Lab 06 - Commit synthetic inventory
& '<REPO>\scripts\02-corpusctl.ps1' -Action scan
& '<REPO>\scripts\02-corpusctl.ps1' -Action status
Expected: all paths accounted for; identical alpha content detected as duplicate.

## Lab 07 - Rename/delete lifecycle
Rename one synthetic file and delete another, then scan. Previously known missing paths remain as MISSING; history is not erased.

## Lab 08 - Edge cases
Test zero-byte, Unicode name, locked file, long path within policy, unsupported extension, duplicate, rename, deletion and partial-copy behavior. Do not manufacture malicious files.

## Lab 09 - Real-data gate
Do not add real corpus until Labs 00-08 pass, logs are readable, duplicate and MISSING accounting work, and capacity is acceptable.

## Labs 10-24 build order
10 text/code extraction; 11 DOCX; 12 XLSX/XLSM; 13 PPTX; 14 PDF; 15 images/OCR; 16 atomic canonical writers; 17 validation/reconciliation; 18 retry/idempotence; 19 live localhost dashboard; 20 watcher/singleton/lifecycle; 21 FTS/search; 22 Ollama RAG/citations; 23 governed output generation; 24 backup/restore/upgrade/performance/regression.

Every lab must contain purpose, prerequisite, exact ISE command, expected output, validation, error cases, repair, rollback, STOP condition and next lab.

## Auto-healing boundary
Allowed: recreate managed folders, bounded retry for transient locks, stale-temp cleanup after validation, rebuild indexes from durable manifests, idempotent resume, safe stale-lock detection.
Forbidden: modify originals, hide corruption, bypass security, disable endpoint controls, install arbitrary software, execute macros, or convert FAILED into SUCCESS by guessing.

## No-admin truth
A standard-user application can contain no network/upload code and bind UI to 127.0.0.1, but cannot guarantee OS-wide zero egress. Firewall/endpoint enforcement and a true persistent Windows service require IT/platform controls when policy requires them. User-session watcher or permitted per-user scheduled task is the no-admin alternative.

## Legacy and hostile-content truth
Legacy .doc/.xls/.ppt require an approved local parser/conversion route. Modern Python Office libraries are not a complete legacy-binary solution. Macros and embedded executables are inventoried, never executed. Corpus text is untrusted data; document instructions never become AI/tool instructions.