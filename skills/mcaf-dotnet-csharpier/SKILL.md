---
name: mcaf-dotnet-csharpier
description: "Use the open-source free `CSharpier` formatter for C# and XML. Use when a .NET repo intentionally wants one opinionated formatter instead of a highly configurable `dotnet format`-driven style model."
compatibility: "Requires a .NET SDK-based repository; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET CSharpier

## Trigger On

- the repo uses or wants `CSharpier`
- the team prefers an opinionated formatter over many configurable style knobs

## Do Not Use For

- repos that already standardized on `dotnet format` as the only formatter

## Inputs

- the nearest `AGENTS.md`
- current formatting ownership model
- any `.csharpierignore` or `.editorconfig`

## Workflow

1. Decide whether CSharpier is the primary formatter or only complements other tools.
2. Use `check` mode in CI.
3. Keep ignore files and config explicit in repo.
4. Do not let `CSharpier` and `dotnet format` both own the same formatting space without documentation.

## Deliver

- explicit CSharpier ownership and commands
- CI-safe formatter checks

## Validate

- formatter ownership is not ambiguous
- the repo is comfortable with opinionated formatting decisions

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

- read `references/csharpier.md` first

## Example Requests

- "Set up CSharpier for this repo."
- "Compare CSharpier and dotnet format."
