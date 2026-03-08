---
name: mcaf-dotnet-coverlet
description: "Use the open-source free `coverlet` toolchain for .NET code coverage. Use when a repo needs line and branch coverage, collector versus MSBuild driver selection, or CI-safe coverage commands."
compatibility: "Requires a .NET test project or solution; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET Coverlet

## Trigger On

- the repo uses or wants `coverlet`
- CI needs line or branch coverage for .NET tests
- the team needs to choose between `coverlet.collector`, `coverlet.msbuild`, or `coverlet.console`

## Do Not Use For

- coverage report rendering by itself
- repos that intentionally use a different coverage engine

## Inputs

- the nearest `AGENTS.md`
- active runner model: VSTest or Microsoft.Testing.Platform
- target test projects

## Workflow

1. Choose the driver deliberately:
   - `coverlet.collector` for VSTest `dotnet test --collect`
   - `coverlet.msbuild` for MSBuild property-driven runs
   - `coverlet.console` for standalone scenarios
2. Add coverage packages only to test projects.
3. Do not mix `coverlet.collector` and `coverlet.msbuild` in the same test project.
4. Pair raw coverage collection with `ReportGenerator` only when humans need rendered reports.

## Deliver

- explicit coverage driver selection
- reproducible coverage commands for local and CI runs

## Validate

- coverage driver matches the runner model
- coverage files are stable and consumable by downstream reporting

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

- read `references/coverlet.md` first

## Example Requests

- "Add Coverlet to this .NET solution."
- "Choose the right Coverlet driver for CI."
