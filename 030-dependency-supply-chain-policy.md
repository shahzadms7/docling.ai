# Dependency and Supply-Chain Policy

The foundation uses Python standard library wherever practical. Optional document/OCR/AI packages are introduced only through an approved dependency plan.

## Required controls
- pinned version or approved range
- source/provenance recorded
- SHA-256 hashes for offline wheels/packages where feasible
- license inventory
- SBOM/provenance report for Pilot/Enterprise
- vulnerability review/change record according to the operator's environment
- no silent pip install from the internet
- approved offline wheelhouse under `SYSTEM\packages` when enterprise policy requires it

## Installation behavior
Discovery reports missing capabilities. The deployment plan explains why a dependency is needed. Human/IT approval occurs before material installation. Scripts do not bypass AppLocker, WDAC, endpoint security, execution policy, or package policy.

## Reproducibility
Record Python executable/version/architecture, package versions, parser versions, model tags/digests, schema/config versions, and release manifest for every certified run.
