# .NET Governance and Command Ownership

Use this reference when recording a real .NET toolchain in root/local `AGENTS.md`. The skills themselves live in the [Managed Code Skills catalog](https://skills.managed-code.com/).

## Repository Policy

- `MCAF-ARCH-001`: keep all solution-owned projects, tests, infrastructure, and docs in one repository with canonical `Features/<SliceName>/` names.
- `MCAF-REQ-001`: map non-trivial behavior through `REQ-*`, `AC-*`, required ADR implementation contracts, tasks, tests, and evidence.
- Record the SDK/TFM, actual build/test/format/analyze/coverage commands, configured extra gates, and exact local differences.
- The repo-root lowercase `.editorconfig` owns formatting, naming, and rule severities; nested files refine genuine subtree policy. Comments use separate lines.
- `Directory.Build.props` or projects own bulk analyzer/runner switches. Specify `LangVersion` only when intentionally diverging from the SDK default.

## Runner and Coverage

Inspect `global.json`, SDK/project/package configuration, CI, and the existing test harness before writing commands.

Record the framework, `VSTest` versus `Microsoft.Testing.Platform`, active `dotnet test` mode, filtering/progress switches, and coverage extension/collector. Do not copy VSTest collector or runsettings arguments into MTP mode, or assume every MTP project enables the same coverage extension.

Verify mechanics against the repository's SDK and [official dotnet test guidance](https://learn.microsoft.com/en-us/dotnet/core/testing/unit-testing-with-dotnet-test). A generic command sample is not a substitute for the actual repo command.

## Skills and Verification

List only installed/used skills: `mcaf-dotnet`, `mcaf-testing`, the matching framework skill, and the quality/complexity/tool skills required by the repository. Follow the repo's single-framework policy where applicable.

Complete implementation, tests, wiring, code/test self-review, fixes, and formatting before the planned verification phase. Run the exact required build, analysis, focused/broader tests, coverage, and configured extra gates; preserve explicit instructions to run or defer them. Reuse valid baseline evidence and rerun only for a new change, failure, or unresolved question.

Local project governance adds purpose, entry points, owned slices, risks, applicable skills, and command/runner/coverage differences without duplicating or weakening root rules.
