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

## Load References

- read `references/coverlet.md` first

## Example Requests

- "Add Coverlet to this .NET solution."
- "Choose the right Coverlet driver for CI."
