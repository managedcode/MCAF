---
name: mcaf-dotnet-stryker
description: "Use the open-source free `Stryker.NET` mutation testing tool for .NET. Use when a repo needs to measure whether tests actually catch faults, especially in critical libraries or domains."
compatibility: "Requires a .NET test project or solution; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET Stryker.NET

## Trigger On

- the repo uses or wants `Stryker.NET`
- mutation testing is needed for high-risk code

## Do Not Use For

- every PR path by default in a large repo
- simple coverage collection

## Inputs

- the nearest `AGENTS.md`
- target projects and critical paths
- time budget for mutation runs

## Workflow

1. Run mutation testing on critical projects, not blindly on the whole mono-repo.
2. Keep it out of the fastest PR path unless the repo explicitly accepts the runtime cost.
3. Stabilize tests first; mutation testing amplifies flaky or slow suites.

## Deliver

- explicit mutation-test scope
- reproducible Stryker commands

## Validate

- the selected scope is affordable in CI
- mutation score is interpreted with test quality, not as a vanity number

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

- read `references/stryker.md` first

## Example Requests

- "Add Stryker for this library."
- "Use mutation testing on our critical domain layer."
