# Security Regression Plan

Test that the product:
- binds local UI/API to 127.0.0.1 by default;
- contains no CDN/remote asset dependency in the Command Center;
- rejects/halts unsafe network roots according to policy;
- does not execute corpus code/macros;
- preserves SOURCE hashes across processing;
- treats document instructions as untrusted data;
- blocks autonomous SOURCE modification;
- records model/tool actions;
- exposes explicit encrypted/unsupported/corrupt states;
- fails closed when required approval/dependency/security conditions are unmet.

Security tests must verify behavior, not only documentation.
