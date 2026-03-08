---
name: mcaf-dotnet-code-analysis
description: "Use the free built-in .NET SDK analyzers and analysis levels. Use when a .NET repo needs first-party code analysis, `EnableNETAnalyzers`, `AnalysisLevel`, or warning policy wired into build and CI."
compatibility: "Requires a .NET SDK-based repository; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET Code Analysis

## Trigger On

- the repo wants first-party .NET analyzers
- CI should fail on analyzer warnings
- the team needs `AnalysisLevel` or `AnalysisMode` guidance

## Do Not Use For

- third-party analyzer selection by itself
- formatting-only work

## Inputs

- the nearest `AGENTS.md`
- project files or `Directory.Build.props`
- current analyzer severity policy

## Workflow

1. Start with SDK analyzers before adding third-party packages.
2. Enable or document:
   - `EnableNETAnalyzers`
   - `AnalysisLevel`
   - `AnalysisMode`
   - warning policy such as `TreatWarningsAsErrors`
3. Keep per-rule severity in the repo-root `.editorconfig`.
4. Use `dotnet build` as the analyzer execution gate in CI.
5. Add third-party analyzers only for real gaps that first-party rules do not cover.

## Deliver

- first-party analyzer policy that is explicit and reviewable
- build-time analyzer execution for CI

## Validate

- analyzer behavior is driven by repo config, not IDE defaults
- CI can reproduce the same warnings and errors locally

## Load References

- read `references/code-analysis.md` first

## Example Requests

- "Turn on built-in .NET analyzers."
- "Make analyzer warnings fail the build."
- "Set the right `AnalysisLevel` for this repo."
