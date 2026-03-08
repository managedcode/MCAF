---
name: mcaf-dotnet-format
description: "Use the free first-party `dotnet format` CLI for .NET formatting and analyzer fixes. Use when a .NET repo needs formatting commands, `--verify-no-changes` CI checks, or `.editorconfig`-driven code style enforcement."
compatibility: "Requires a .NET SDK-based repository; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET dotnet format

## Trigger On

- the repo uses `dotnet format`
- you need a CI-safe formatting check for .NET
- the repo wants `.editorconfig`-driven style enforcement

## Do Not Use For

- repositories that intentionally use `CSharpier` as the only formatter
- analyzer strategy with no formatting command change

## Inputs

- the nearest `AGENTS.md`
- the solution or project path
- the current `.editorconfig`

## Workflow

1. Prefer the SDK-provided `dotnet format` command instead of inventing custom format scripts.
2. Start with verify mode in CI: `dotnet format <target> --verify-no-changes`.
3. Use narrower subcommands only when the repo needs them:
   - `whitespace`
   - `style`
   - `analyzers`
4. Keep `.editorconfig` as the source of truth for style preferences.
5. If the repo also uses `CSharpier`, document which tool owns which file types or rules.

## Deliver

- explicit `dotnet format` commands for local and CI runs
- formatting that follows `.editorconfig`

## Validate

- formatting is reproducible on CI
- no overlapping formatter ownership is left ambiguous

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

- read `references/dotnet-format.md` first

## Example Requests

- "Add `dotnet format` to this repo."
- "Make formatting fail CI if files drift."
- "Explain when to use `dotnet format` versus `CSharpier`."
