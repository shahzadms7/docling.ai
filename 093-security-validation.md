# Security Validation

Security verification includes:
- SOURCE write protection by behavior and hash checks;
- no execution of macros/scripts/source code;
- parser handling of embedded objects;
- path traversal/reparse-point controls;
- localhost binding;
- no remote UI assets/telemetry;
- dependency integrity/provenance checks;
- prompt-injection regression;
- tool allow-list enforcement;
- secrets/credentials exclusion from logs;
- backup target approval;
- safe temp permissions/cleanup;
- explicit behavior when enterprise controls block execution.

Enterprise certification additionally requires organization-specific security review; local application tests cannot replace endpoint/network/platform policy.
