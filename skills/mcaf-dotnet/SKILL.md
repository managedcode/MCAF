---
name: mcaf-dotnet
description: "Primary entry skill for C# and .NET tasks. Detect the repo's language version, test runner, quality stack, and architecture rules; route to the right .NET subskills; and run the repo-defined post-change quality pass after any code change."
compatibility: "Requires a .NET solution or project; respects root and local `AGENTS.md` first."
---

# MCAF: .NET

## Trigger On

- writing, reviewing, debugging, or refactoring C# or .NET code
- deciding which .NET skill should be used for a task
- modernizing a .NET codebase while keeping language and runtime compatibility
- verifying .NET changes with analyzers, formatting, tests, and coverage

## Do Not Use For

- non-.NET repositories
- a single-tool task where one exact .NET tool skill already covers the whole request

## Inputs

- the nearest `AGENTS.md`
- solution and project files
- `Directory.Build.*` files
- the repo-root `.editorconfig` and any nested `.editorconfig` files that apply
- target `TFM`, `LangVersion`, SDK version, test packages, and analyzer packages

## Workflow

1. Detect the real stack before changing code or commands:
   - `TFM` or `TFMs`
   - explicit `LangVersion` or the default implied by the SDK and target framework
   - test framework: xUnit, TUnit, or MSTest
   - runner model: `VSTest` or `Microsoft.Testing.Platform`
   - installed analyzers, formatters, coverage tools, and architecture-test libraries
2. Route framework mechanics through exactly one matching test skill:
   - `mcaf-dotnet-xunit`
   - `mcaf-dotnet-tunit`
   - `mcaf-dotnet-mstest`
3. Route quality and policy through the matching skill:
   - `mcaf-dotnet-quality-ci`
   - `mcaf-dotnet-analyzer-config`
   - `mcaf-dotnet-complexity`
   - tool-specific skills such as `mcaf-dotnet-format`, `mcaf-dotnet-roslynator`, `mcaf-dotnet-stylecop-analyzers`, `mcaf-dotnet-meziantou-analyzer`, `mcaf-dotnet-coverlet`, `mcaf-dotnet-reportgenerator`, `mcaf-dotnet-netarchtest`, `mcaf-dotnet-archunitnet`, `mcaf-dotnet-semgrep`, `mcaf-dotnet-codeql`, `mcaf-dotnet-csharpier`, and `mcaf-dotnet-stryker`
4. Route design and structure through:
   - `mcaf-solid-maintainability` for SOLID, SRP, cohesion, and maintainability limits
   - `mcaf-architecture-overview` when system or module boundaries, contracts, or architecture docs need work
   - `mcaf-dotnet-features` when modern C# feature selection or language-version compatibility matters
5. Write or review code using the newest stable C# features the repo actually supports.
6. After any .NET code change, run the repo-defined post-change quality pass from narrow to broad:
   - `format`
   - `build`
   - `analyze`
   - focused `test`
   - broader `test`
   - `coverage` and report generation when configured
   - extra configured gates such as Roslynator, StyleCop, Meziantou, NetArchTest, ArchUnitNET, Semgrep, CodeQL, CSharpier, or Stryker
7. If the repo does not define these commands clearly, tighten `AGENTS.md` before continuing so later agents stop guessing.
8. Do not introduce preview language features unless the repo explicitly opts into preview in project or MSBuild settings.

## Deliver

- .NET changes that use the right framework and tool skills
- version-compatible modern C# code
- a completed post-change verification pass, not only green tests

## Validate

- only the skills relevant to the current .NET task were opened
- `VSTest` and `Microsoft.Testing.Platform` assumptions were not mixed
- the language features used are supported by the repo's real `TFM` and `LangVersion`
- format, analyzers, tests, and any configured extra gates were all considered before completion

## Load References

- read `references/skill-routing.md` first
- read `references/task-flow.md` when the task includes implementation, refactoring, or review

## Example Requests

- "Work on this .NET feature and use the right skills."
- "Which .NET skills should open for this repo?"
- "Refactor this C# code and run the full quality pass after."
