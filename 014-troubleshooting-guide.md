# Troubleshooting and Recovery Guide

## Script does not start
Confirm Windows PowerShell ISE 5.1 and copy the complete script. Read the exact error. Do not disable AppLocker, WDAC, endpoint protection or execution controls.

## Python not found
This is a controlled dependency gate. The deployment plan must show approved installation options; it must not silently download Python.

## Ollama not found
Continue deterministic foundation work. AI features remain blocked until approved Ollama installation is complete.

## Low disk
Stop new ingestion before derivatives exhaust free space. Originals remain untouched. Reconcile after capacity remediation.

## One document fails
Other files continue when safe. The file receives an explicit state such as FAILED, PARTIAL, ENCRYPTED, UNSUPPORTED or PENDING_REVIEW plus stage/error/retry evidence.

## Interrupted deployment
Rerun 001-start-here.ps1. The target design resumes from durable checkpoints after validating prior state rather than blindly repeating destructive steps.
