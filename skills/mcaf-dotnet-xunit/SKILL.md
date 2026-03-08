---
name: mcaf-dotnet-xunit
description: "Write, run, or repair .NET tests that use xUnit. Use when a repo uses `xunit`, `xunit.v3`, `[Fact]`, `[Theory]`, or `xunit.runner.visualstudio`, and you need the right CLI, package, and runner guidance for xUnit on VSTest or Microsoft.Testing.Platform."
compatibility: "Requires a .NET solution or project with xUnit packages; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET xUnit

## Trigger On

- the repo uses xUnit v2 or xUnit v3
- you need to add, run, debug, or repair xUnit tests
- the team is unsure whether a project is using VSTest or Microsoft.Testing.Platform

## Do Not Use For

- TUnit projects
- MSTest projects
- generic test strategy with no xUnit-specific mechanics

## Inputs

- the nearest `AGENTS.md`
- the test project file and package references
- the active runner model for the test project

## Workflow

1. Detect the active xUnit model before changing commands:
   - `xunit` usually means v2
   - `xunit.v3` means v3
   - `xunit.runner.visualstudio` plus `Microsoft.NET.Test.Sdk` usually means VSTest compatibility is enabled
   - `TestingPlatformDotnetTestSupport` or `UseMicrosoftTestingPlatformRunner` means Microsoft.Testing.Platform is in play
2. Read the repo's real `test` command from `AGENTS.md`. If the repo has no explicit command yet, start with `dotnet test <project-or-solution>`.
3. Keep the runner model consistent:
   - xUnit v2 usually runs through VSTest
   - xUnit v3 can run as a standalone executable with `dotnet run`
   - xUnit v3 can also integrate with Microsoft.Testing.Platform
   - do not mix VSTest-only switches into Microsoft.Testing.Platform runs
4. Run the narrowest useful scope first:
   - one project
   - one class
   - one trait
   - one method
5. Prefer `[Theory]` for stable data-driven coverage and `[Fact]` for single-path invariant checks.
6. Keep `xunit.analyzers` enabled when present. Fix analyzer findings instead of muting them casually.

## Deliver

- xUnit tests that match the repo's active xUnit version and runner
- commands that work in local and CI runs
- focused verification before broader suite execution

## Validate

- the chosen CLI matches the active runner model
- test filters or focused runs are valid for that runner
- tests use deterministic inputs and assertions
- xUnit-specific analyzers remain active unless the repo documents an exception

## Findings Loop

When this skill is used to run a checker, analyzer, test gate, or verification command:

1. Run the command in read-only or report mode first and collect findings.
2. Return a concise findings list with only actionable items:
   - rule or check id
   - `file:line`
   - one-line fix intent
3. Fix findings in small batches without hiding rules unless the repo already documents an exception.
4. Re-run the same command after each fix batch.
5. Repeat until the gate passes or only explicitly accepted exceptions remain.
6. Keep output trimmed: include counts and the top remaining items only, not raw full logs.

For setup-only requests that do not execute checks, return `status: configured` and the exact commands that should be run later.

## Load References

- read `references/xunit.md` first

## Example Requests

- "Run this xUnit suite correctly."
- "Fix our xUnit v3 test command."
- "Add an xUnit regression test and keep CI compatible."
