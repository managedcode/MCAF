---
name: mcaf-dotnet-analyzer-config
description: "Use a repo-root `.editorconfig` to configure free .NET analyzer and style rules. Use when a .NET repo needs rule severity, code-style options, section layout, or analyzer ownership made explicit. Nested `.editorconfig` files are allowed when they serve a clear subtree-specific purpose."
compatibility: "Requires a .NET SDK-based repository; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET Analyzer Config

## Trigger On

- the repo needs a root `.editorconfig`
- analyzer severity and style ownership are unclear
- the team wants one source of truth for rule configuration

## Do Not Use For

- choosing analyzers with no config change
- formatting-only execution with no config ownership question

## Inputs

- the nearest `AGENTS.md`
- current `.editorconfig`
- any `Directory.Build.props` overrides

## Workflow

1. Prefer one repo-root `.editorconfig` with `root = true`.
2. Add nested `.editorconfig` files when a subtree has a clear scoped purpose, such as stricter rules, different generated-code handling, or a different policy for tests or legacy code.
3. Keep severity in `.editorconfig`, not scattered through IDE settings.
4. Write the file as real EditorConfig, not as a made-up `.NET` variant:
   - lowercase filename `.editorconfig`
   - `root = true` in the preamble
   - no inline comments
   - forward slashes in globs
5. Keep bulk switches such as `EnableNETAnalyzers` in MSBuild files, not in `.editorconfig`.
6. Treat `.globalconfig` as an exceptional case, not the normal repo setup.

## Deliver

- one explicit analyzer configuration ownership model
- a root `.editorconfig` layout that agents can extend safely

## Validate

- rule severity is reproducible in local and CI builds
- IDE-only settings do not silently override repo policy
- the default path is a root `.editorconfig`, not a surprise alternative

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

- read `references/analyzer-config.md` first

## Example Requests

- "Make `.editorconfig` the source of truth."
- "Write a proper root `.editorconfig` for this repo."
- "Fix conflicting analyzer severities in this .NET repo."
