---
name: mcaf-dotnet-roslynator
description: "Use the open-source free `Roslynator` analyzer packages and optional CLI for .NET. Use when a repo wants broad C# static analysis, auto-fix flows, dead-code detection, optional CLI checks, or extra rules beyond the SDK analyzers."
compatibility: "Requires a .NET SDK-based repository; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET Roslynator

## Trigger On

- the repo uses or wants `Roslynator.Analyzers`
- the team wants Roslynator CLI or extra Roslyn-based rules
- the user asks about C# linting, static analysis, code cleanup, or unused code

## Do Not Use For

- repos that already have overlapping analyzer packs with no consolidation plan
- formatting-only work when the repo already standardized on `dotnet format` or `CSharpier`

## Inputs

- the nearest `AGENTS.md`
- current analyzer packages
- `.editorconfig`

## Workflow

1. Prefer the NuGet analyzer packages for build-enforced checks.
2. Use the CLI when the repo needs one of these flows explicitly:
   - `analyze`
   - `fix`
   - `find-unused`
   - `format`
3. Build first when Roslynator needs compiled context.
4. Configure rule severity and Roslynator behavior in `.editorconfig`.
5. Avoid duplicating the same rules across multiple analyzer packs without a severity plan.
6. Treat CLI auto-fix as a controlled change:
   - run it on a bounded target first
   - rebuild
   - rerun tests

## Deliver

- Roslynator package or CLI setup that fits the repo
- explicit ownership of rule severity
- repeatable commands for analyze, fix, or unused-code workflows when the repo adopts them

## Validate

- Roslynator adds value beyond the current analyzer baseline
- CI commands remain reviewable and reproducible
- the repo is not confusing Roslynator CLI with the analyzer package itself

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

- read `references/roslynator.md` first

## Example Requests

- "Add Roslynator analyzers."
- "Use Roslynator CLI in CI."
- "Find unused code with Roslynator."
- "Auto-fix Roslynator issues in this solution."
