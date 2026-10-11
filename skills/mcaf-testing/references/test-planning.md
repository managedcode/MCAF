# Test Planning

Design the tests from accepted requirements and the real affected flow before implementation. For non-trivial features, maintain the `MCAF-REQ-001` requirement/acceptance/test/evidence mapping in the feature spec or task acceptance file.

## Scenario Matrix

For each applicable `AC-*`, record:

| Acceptance | Scenario and preconditions | Entry point / action | Observable result | Test level / fixture | Command / evidence |
| --- | --- | --- | --- | --- | --- |
| `AC-001` | Real actor and starting state | Public user/system action | Result, state, and side effects | Integration/API/UI or isolated logic | Repo command and result |

Cover required success, rejection, boundary, dependency failure, and recovery paths. Include authorization, ownership, retries, cancellation, and concurrency only when the affected behavior makes them relevant. Explain any criterion without automated coverage and the required manual evidence.

## Design Review Before Execution

- Confirm expected behavior from the accepted contract, not the implementation.
- Exercise the actual entry point and dependencies with realistic, small fixtures.
- Assert meaningful output, persisted state, and required or forbidden side effects.
- Check that the original defect or a plausible incorrect implementation would fail.
- Verify isolation, cleanup, deterministic timing, and that a negative scenario reaches the intended boundary.
- For UI, assert the visible interaction and result; inspect rendered layout at relevant viewports.

## Verification Plan

Choose checks for concrete requirements or unanswered risks. Focused tests, related regressions, required broad suites, static analysis, and coverage serve different purposes; preserve the repository's gates without running redundant overlapping checks.

Finish complete approved implementation, code/test self-review, fixes, and formatting before one planned verification phase. A separate red-phase or baseline run needs an explicit requirement or concrete question. Use existing baseline evidence where available.

Diagnose a failure through source and evidence, inspect related paths, fix the complete in-scope cause, and rerun affected checks. Record unrelated failures as blockers rather than expanding the repair scope silently. A passed check is repeated only after a new change, concrete failure, or unresolved question.

## Evidence

Report the exact command, scope, result, and any limitation. Keep local checks, CI, publication, deployment, and production observations distinct.
