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

## Value

- produce a concrete project delta: code, docs, config, tests, CI, or review artifact
- reduce ambiguity through explicit planning, verification, and final validation skills
- leave reusable project context so future tasks are faster and safer

## Do Not Use For

- coverage report rendering by itself
- repos that intentionally use a different coverage engine

## Inputs

- the nearest `AGENTS.md`
- active runner model: VSTest or Microsoft.Testing.Platform
- target test projects

## Quick Start

1. Read the nearest `AGENTS.md` and confirm scope and constraints.
2. Run this skill's `Workflow` through the `Ralph Loop` until outcomes are acceptable.
3. Return the `Required Result Format` with concrete artifacts and verification evidence.

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

- read `references/coverlet.md` first

## Example Requests

- "Add Coverlet to this .NET solution."
- "Choose the right Coverlet driver for CI."
