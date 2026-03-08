---
name: mcaf-dotnet-tunit
description: "Write, run, or repair .NET tests that use TUnit. Use when a repo uses `TUnit`, `[Test]`, `[Arguments]`, source-generated test projects, or Microsoft.Testing.Platform-based execution."
compatibility: "Requires a .NET solution or project with TUnit packages; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET TUnit

## Trigger On

- the repo uses TUnit
- you need to add, run, debug, or repair TUnit tests
- the repo uses Microsoft.Testing.Platform-based test execution

## Do Not Use For

- xUnit projects
- MSTest projects
- generic test strategy with no TUnit-specific mechanics

## Inputs

- the nearest `AGENTS.md`
- the test project file and package references
- the repo's current TUnit execution command

## Workflow

1. Confirm the project really uses TUnit and not a different MTP-based framework.
2. Read the repo's real `test` command from `AGENTS.md`. If the repo has no explicit command yet, start with `dotnet test <project-or-solution>`.
3. Keep the TUnit execution model intact:
   - tests are source-generated at build time
   - tests run in parallel by default
   - built-in analyzers should remain enabled
4. Fix isolation bugs instead of globally serializing the suite unless the repo already documented a justified exception.
5. Run the narrowest useful scope first. If the repo hasn't documented filter switches for TUnit yet, prefer project-level focused runs over guessed runner arguments.
6. Use `[Test]`, `[Arguments]`, hooks, and dependencies only when they make the scenario clearer, not because the framework allows it.

## Deliver

- TUnit tests that respect source generation and parallel execution
- commands that work in local and CI runs
- framework-specific verification guidance for the repo

## Validate

- the command matches the repo's TUnit runner style
- shared state is isolated or explicitly controlled
- built-in TUnit analyzers remain active
- coverage tooling matches Microsoft.Testing.Platform if coverage is enabled

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

- read `references/tunit.md` first

## Example Requests

- "Run this TUnit project correctly."
- "Fix our TUnit CI command."
- "Add a regression test in TUnit without breaking parallelism."
