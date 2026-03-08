---
name: mcaf-dotnet-codeql
description: "Use the open-source CodeQL ecosystem for .NET security analysis. Use when a repo needs CodeQL query packs, CLI-based analysis on open source codebases, or GitHub Action setup with explicit licensing caveats for private repositories."
compatibility: "Requires a GitHub-based or CLI-based CodeQL workflow; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET CodeQL

## Trigger On

- the repo uses or wants CodeQL for .NET security analysis
- GitHub code scanning is part of the CI plan

## Do Not Use For

- teams that need a tool with no private-repo licensing caveat

## Inputs

- the nearest `AGENTS.md`
- hosting model: open-source repo, private repo, or manual CLI workflow
- current GitHub Actions workflow

## Workflow

1. Treat CodeQL as a security-analysis tool, not as a style checker.
2. Make the licensing and hosting model explicit before proposing it as the default gate.
3. Prefer manual build mode for compiled .NET projects when precision matters.

## Deliver

- explicit CodeQL setup or an explicit rejection with caveat documented

## Validate

- the chosen CodeQL path is allowed for the repo type
- build mode is documented and reproducible

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

- read `references/codeql.md` first

## Example Requests

- "Set up CodeQL for this public .NET repo."
- "Explain the CodeQL caveat for private repos."
