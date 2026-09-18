# Failure Mode Register

Minimum scenarios before Pilot/Enterprise promotion:
- power loss/process crash mid-run
- locked file
- partial copy/file still changing
- zero-byte file
- corrupt OOXML/PDF
- encrypted PDF/Office file
- unsupported legacy Office format
- duplicate content at different paths
- rename/move/delete
- Unicode names
- long paths
- reparse point/junction/symlink
- mapped/UNC path
- FAT/NTFS/ReFS differences
- low disk/temp exhaustion
- antivirus/endpoint lock
- execution-policy/AppLocker/WDAC/CFA block
- missing Python/Ollama/model
- Ollama service/API unavailable
- malformed model response
- schema migration interruption
- index corruption
- backup/restore mismatch
- prompt injection inside corpus
- generated artifact failure
- browser/port conflict
- stale lock/singleton collision

Each scenario needs detection, status, operator message, safe retry/repair, rollback/recovery and regression evidence.
