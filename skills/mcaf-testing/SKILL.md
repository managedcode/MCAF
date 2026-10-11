---
name: mcaf-testing
description: "Design or update regression tests for features, defects, and refactors using repository verification commands. Use for meaningful user or system flow coverage and test strategy."
metadata:
  compatibility: "Requires the repository’s build and test tooling; uses commands from root or local `AGENTS.md`."
---

# MCAF: Testing

Follow root and applicable local `AGENTS.md` for scope, test commands, runner, coverage policy, and required gates.

## Workflow

1. Inspect the implementation, callers, contracts, existing tests, fixtures, and accepted behavior before designing tests. Under `MCAF-REQ-001`, map non-trivial feature tests to `REQ-*`/`AC-*` and update their evidence matrix.
2. Keep tests in the owning canonical slice under `MCAF-ARCH-001`. Choose the level that proves the real flow: isolated logic, integration, API, or rendered UI.
3. Design regressions from requirements before implementation. They must detect the original defect and assert meaningful caller-visible results, required rejection paths, side effects, state transitions, and edge cases.
4. Implement the complete approved code and test scope, then review both before execution. Check fixtures, isolation, cleanup, assertion strength, and whether incorrect behavior would actually fail the test.
5. Use real dependencies, containers, test instances, or sandboxes as required by repository policy. Do not substitute doubles or lower expectations to hide broken behavior.
6. After self-review, fixes, and formatting, execute one planned verification phase with focused tests and required broader gates. A separate red-phase or baseline run needs a concrete purpose or explicit requirement. Fix the complete cause of failures before rerunning affected checks.
7. Report commands and observed results, coverage gaps, and exact blockers. Passing focused tests does not imply a broader suite or deployment passed.

For .NET, identify `VSTest` versus `Microsoft.Testing.Platform` from the actual repo configuration. Use its installed matching framework skill and exact commands; do not copy arguments from another runner.

## References

- When designing a scenario matrix or unclear strategy: [test planning](references/test-planning.md).
- For test levels, realism, and coverage expectations: [automated testing](references/automated-testing.md).
- For .NET tooling not installed here: [Managed Code Skills catalog](https://skills.managed-code.com/).
