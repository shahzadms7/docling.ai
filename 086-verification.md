# Verification Strategy

Verification proves that the implemented system actually satisfies the stated requirement and expected outcome.

## Verification chain
Requirement -> acceptance criterion -> implementation -> positive test -> negative test -> observable evidence -> independent reconciliation -> sign-off.

Examples:
- Requirement: every discovered file is accounted for.
  Verification: discovered count equals the sum of explicit terminal states plus active in-progress states; discrepancies are FAIL.
- Requirement: SOURCE is immutable.
  Verification: pre/post hashes of synthetic SOURCE fixtures remain identical after processing.
- Requirement: local-only Command Center.
  Verification: bind address is 127.0.0.1; HTML/CSS/JS contain no remote asset URLs; network calls are tested.
- Requirement: cited AI answer.
  Verification: every citation resolves to an existing source/chunk/coordinate and was part of the retrieval set.

Verification is evidence-based, not visual inspection alone.
