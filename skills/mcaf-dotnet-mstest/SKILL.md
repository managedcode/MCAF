---
name: mcaf-dotnet-mstest
description: "Write, run, or repair .NET tests that use MSTest. Use when a repo uses `MSTest.Sdk`, `MSTest`, `[TestClass]`, `[TestMethod]`, `DataRow`, or Microsoft.Testing.Platform-based MSTest execution."
compatibility: "Requires a .NET solution or project with MSTest packages; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET MSTest

## Trigger On

- the repo uses MSTest
- you need to add, run, debug, or repair MSTest tests
- the repo is moving between VSTest and Microsoft.Testing.Platform

## Do Not Use For

- xUnit projects
- TUnit projects
- generic test strategy with no MSTest-specific mechanics

## Inputs

- the nearest `AGENTS.md`
- the test project file and package references
- the active MSTest runner model

## Workflow

1. Detect the MSTest project style first:
   - `MSTest.Sdk` project SDK
   - `MSTest` meta-package
   - legacy package set with explicit `Microsoft.NET.Test.Sdk`
2. Read the repo's real `test` command from `AGENTS.md`. If the repo has no explicit command yet, start with `dotnet test <project-or-solution>`.
3. Keep the runner model consistent:
   - `MSTest.Sdk` defaults to the MSTest runner on Microsoft.Testing.Platform
   - VSTest is opt-in with `<UseVSTest>true</UseVSTest>` or legacy package choices
   - do not pass VSTest-only switches or assume legacy `.runsettings` behavior on Microsoft.Testing.Platform jobs
4. Prefer `[DataRow]` or `DynamicData` for stable data-driven coverage. Keep test lifecycle hooks minimal and deterministic.
5. Keep MSTest analyzers enabled and fix findings instead of muting them casually.
6. Align coverage/reporting packages with the active runner.

## Deliver

- MSTest tests that match the repo's runner model
- commands that work in local and CI runs
- explicit guidance for VSTest versus Microsoft.Testing.Platform usage

## Validate

- the runner model is documented and consistent
- test commands match that runner
- data-driven tests stay deterministic
- analyzer, coverage, and reporting packages align with the chosen runner

## Load References

- read `references/mstest.md` first

## Example Requests

- "Fix our MSTest runner setup."
- "Add an MSTest regression test."
- "Move this MSTest project to Microsoft.Testing.Platform safely."
