---
name: mcaf-testing
description: "Add or update automated tests for a change using the repository’s verification rules in `AGENTS.md`. Use when implementing a feature, bugfix, refactor, or regression test; prefer stable integration/API/UI coverage and pull deeper test strategy from the bundled references."
compatibility: "Requires the repository’s build and test tooling; uses commands from root or local `AGENTS.md`."
---

# MCAF: Testing

## Trigger On

- implementing a feature or bugfix
- adding a regression test for a failure
- protecting a refactor with automated verification

## Do Not Use For

- repo-wide delivery policy with no test change
- documentation-only changes unless they alter executable verification

## Inputs

- the nearest `AGENTS.md`
- the changed behaviour and touched boundaries
- existing tests near the impacted code path

## Workflow

1. Read the repo’s real verification commands from `AGENTS.md`.
2. Start with a failing test first when the change adds behaviour or fixes a bug.
3. Start with the smallest meaningful test scope:
   - new or changed tests
   - related suite
   - broader regressions
4. When the stack is .NET, use `mcaf-dotnet` as the orchestration skill when the task spans code, tests, and verification, and route framework mechanics through exactly one matching skill:
   - `mcaf-dotnet-xunit`
   - `mcaf-dotnet-tunit`
   - `mcaf-dotnet-mstest`
5. Prefer integration, API, or UI coverage when behaviour crosses boundaries.
6. Prove the user flow or caller-visible system flow, not just internal details.
7. Add a regression test for every bug that can be captured reliably.
8. If the stack is .NET and production code changed, do not stop at tests only. Finish with the repo-defined format and analyzer pass as well.
9. Use deeper testing references only when the repo’s current strategy is unclear.

## Deliver

- automated tests close to the changed behaviour
- verification results that match the repo’s real commands

## Validate

- the new behaviour is covered at the right level
- the main user flow or caller-visible system flow is proven
- tests assert meaningful outcomes, not implementation trivia
- coverage expectations from `AGENTS.md` are met, or the exception is documented
- the verification sequence matches `AGENTS.md`
- for .NET changes, tests were not treated as a substitute for formatting or analyzer gates
- broader suites are run after there is something real to verify

## Load References

- read `references/test-planning.md` first
- open `references/automated-testing.md` for deeper strategy and trade-offs
- for broader .NET implementation flow, use `mcaf-dotnet`
- for .NET framework-specific mechanics, use exactly one of `mcaf-dotnet-xunit`, `mcaf-dotnet-tunit`, or `mcaf-dotnet-mstest`

## Example Requests

- "Add tests for this bugfix."
- "Protect this refactor with regression coverage."
- "Choose the right test level for this API change."
