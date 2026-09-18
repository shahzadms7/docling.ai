# Beginner Installation Guide

This guide assumes no Python knowledge and no software-development experience.

## Online path
1. Open the public repository.
2. Read README.md.
3. Open 001-start-here.ps1.
4. Copy the entire file into Windows PowerShell ISE 5.1.
5. Press F5.
6. Read PASS/WARN/STOP output. Do not bypass STOP conditions.

## Downloaded path
1. Click GitHub Code -> Download ZIP, or use the versioned project ZIP when published.
2. Extract to an approved local fixed disk.
3. Open 001-start-here.ps1 in Windows PowerShell ISE 5.1.
4. Press F5.
5. The controller discovers machine facts first. It asks only decisions that cannot be discovered safely.
6. Follow the generated plan and evidence gates.

## Expected first-run behavior
Discovery must report Windows/build, PowerShell, RAM, CPU/logical processors, Python state, Ollama state and existing deployment state without silently installing or bypassing enterprise controls.

## STOP means STOP
If policy, permissions, network-drive placement, dependency approval, or security controls block a step, record it and use the approved remediation route. Do not disable protections.
