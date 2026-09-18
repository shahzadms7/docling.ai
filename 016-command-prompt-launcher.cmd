@echo off
setlocal
set "ROOT=%~dp0"
echo Docling AI - Command Prompt launcher
powershell.exe -NoProfile -File "%ROOT%001-start-here.ps1"
set "RC=%ERRORLEVEL%"
exit /b %RC%
