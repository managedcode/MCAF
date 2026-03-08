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

## Load References

- read `references/codeql.md` first

## Example Requests

- "Set up CodeQL for this public .NET repo."
- "Explain the CodeQL caveat for private repos."
