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

## Load References

- read `references/dotnet-format.md` first

## Example Requests

- "Add `dotnet format` to this repo."
- "Make formatting fail CI if files drift."
- "Explain when to use `dotnet format` versus `CSharpier`."
