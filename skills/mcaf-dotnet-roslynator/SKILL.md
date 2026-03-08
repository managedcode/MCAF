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

## Value

- produce a concrete project delta: code, docs, config, tests, CI, or review artifact
- reduce ambiguity through explicit planning, verification, and final validation skills
- leave reusable project context so future tasks are faster and safer

## Do Not Use For

- repos that already have overlapping analyzer packs with no consolidation plan
- formatting-only work when the repo already standardized on `dotnet format` or `CSharpier`

## Inputs

- the nearest `AGENTS.md`
- current analyzer packages
- `.editorconfig`

## Quick Start

1. Read the nearest `AGENTS.md` and confirm scope and constraints.
2. Run this skill's `Workflow` through the `Ralph Loop` until outcomes are acceptable.
3. Return the `Required Result Format` with concrete artifacts and verification evidence.

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

## Ralph Loop

Use the Ralph Loop for every task, including docs, architecture, testing, and tooling work.

1. Plan first (mandatory):
   - analyze current state
   - define target outcome, constraints, and risks
   - write a detailed execution plan
   - list final validation skills to run at the end, with order and reason
2. Execute one planned step and produce a concrete delta.
3. Review the result and capture findings with actionable next fixes.
4. Apply fixes in small batches and rerun the relevant checks or review steps.
5. Update the plan after each iteration.
6. Repeat until outcomes are acceptable or only explicit exceptions remain.
7. If a dependency is missing, bootstrap it or return `status: not_applicable` with explicit reason and fallback path.

### Required Result Format

- `status`: `complete` | `clean` | `improved` | `configured` | `not_applicable` | `blocked`
- `plan`: concise plan and current iteration step
- `actions_taken`: concrete changes made
- `validation_skills`: final skills run, or skipped with reasons
- `verification`: commands, checks, or review evidence summary
- `remaining`: top unresolved items or `none`

For setup-only requests with no execution, return `status: configured` and exact next commands.

## Load References

- read `references/roslynator.md` first

## Example Requests

- "Add Roslynator analyzers."
- "Use Roslynator CLI in CI."
- "Find unused code with Roslynator."
- "Auto-fix Roslynator issues in this solution."
