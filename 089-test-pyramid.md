# Test Pyramid and Coverage

Test layers:
- unit tests for pure functions and schema rules;
- component tests for parsers, hashing, indexing, Ollama client, generation;
- integration tests across SOURCE -> CORPUS -> SEARCH -> AI;
- end-to-end tests through PowerShell and Command Center;
- failure-injection tests for locks, corruption, low disk, interrupted runs and unavailable dependencies;
- security tests for prompt injection, remote asset leakage, unsafe path traversal and macro/code execution;
- performance tests for throughput, latency, RAM, disk and long-document scale;
- recovery/game-day tests for restart, restore, migration rollback and index rebuild;
- release-parity tests for GitHub/package equality.

Coverage is requirement-based as well as code-based. A test suite can have high code coverage and still fail to verify business requirements.
