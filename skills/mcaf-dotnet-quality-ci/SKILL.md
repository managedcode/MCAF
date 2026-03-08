---
name: mcaf-dotnet-quality-ci
description: "Set up or refine open-source .NET code-quality gates for CI: formatting, `.editorconfig`, SDK analyzers, third-party analyzers, coverage, mutation testing, architecture tests, and security scanning. Use when a .NET repo needs an explicit quality stack in `AGENTS.md`, docs, or pipeline YAML."
compatibility: "Requires a .NET solution or project; may update `AGENTS.md`, CI workflows, a repo-root `.editorconfig`, `Directory.Build.props`, or analyzer package references."
---

# MCAF: .NET Quality CI

## Trigger On

- adding or tightening .NET code-quality gates in CI
- choosing analyzers, coverage, mutation, or architecture-test tooling for a .NET repo
- standardizing `.editorconfig`, `dotnet format`, and warning policy

## Do Not Use For

- non-.NET repositories
- generic CI/CD guidance with no .NET quality stack decisions
- framework-specific test authoring with no quality-gate change

## Inputs

- the nearest `AGENTS.md`
- the current repo-root `.editorconfig` and MSBuild props
- the current CI workflow and package references
- the active test runner model: VSTest or Microsoft.Testing.Platform

## Workflow

1. Start with the repo-native baseline:
   - repo-root `.editorconfig`
   - `dotnet format --verify-no-changes`
   - SDK analyzers with explicit `EnableNETAnalyzers`, `AnalysisLevel`, and warning policy
2. Add third-party analyzers only where they close a real gap:
   - `StyleCopAnalyzers`
   - `Roslynator`
   - `Meziantou.Analyzer`
   - framework analyzers such as xUnit, MSTest, or TUnit analyzers
3. Separate quality gates by purpose:
   - formatting and style
   - correctness and static analysis
   - coverage and reports
   - architecture rules
   - security scanning
   - mutation testing
4. For complexity, use a composite approach:
   - CA1502 thresholding
   - maintainability limits in `AGENTS.md`
   - architecture tests
   - coverage and mutation where risk justifies it
5. Make ownership explicit in `AGENTS.md` and CI:
   - which command formats
   - which command analyzes
   - which command measures coverage
   - which runner model the tests use
6. After any .NET code change, the repo's quality pass must be runnable by agents:
   - format
   - build
   - analyze
   - focused tests
   - broader tests
   - coverage and report generation when configured
   - extra configured gates only when the repo actually enabled them
7. Route tool-specific setup through dedicated skills where possible:
   - `mcaf-dotnet-format`
   - `mcaf-dotnet-code-analysis`
   - `mcaf-dotnet-analyzer-config`
   - analyzer-pack skills such as `mcaf-dotnet-stylecop-analyzers`, `mcaf-dotnet-roslynator`, and `mcaf-dotnet-meziantou-analyzer`
   - coverage/reporting skills such as `mcaf-dotnet-coverlet` and `mcaf-dotnet-reportgenerator`
   - architecture/security skills such as `mcaf-dotnet-netarchtest`, `mcaf-dotnet-archunitnet`, `mcaf-dotnet-codeql`, and `mcaf-dotnet-semgrep`
8. Avoid overlapping tools with conflicting ownership. If you add an opinionated formatter, define whether it replaces or complements `dotnet format`.

## Deliver

- a documented .NET quality baseline
- CI commands that are explicit and reproducible
- analyzer and coverage choices that match the repo's runner model
- a documented post-change quality pass for agents and CI
- tool selection that stays open-source and free by default, with caveats called out explicitly

## Validate

- repo-root `.editorconfig` is the default source of truth for per-rule severity
- formatting, analyzer, and coverage commands are runner-compatible
- added tools cover distinct gaps instead of duplicating each other
- complexity and architecture policy are explicit, not implied
- .NET code changes are expected to pass more than tests alone when quality gates are configured
- any licensing or hosting caveat is documented before the tool becomes a default gate

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

- read `references/editorconfig-and-ci.md` first
- open `references/quality-toolchain.md` for the curated OSS tool list
- use the dedicated tool skill when you are installing, configuring, or debugging one specific tool

## Example Requests

- "Define the best OSS CI stack for this .NET repo."
- "Add .NET analyzers, coverage, and mutation testing guidance."
- "Make `.editorconfig` and CI agree in our .NET solution."
