---
name: mcaf-dotnet-semgrep
description: "Use the open-source free Semgrep CLI for .NET and broader codebase security scanning. Use when a repo needs OSS-friendly CLI scanning, custom rules, or CI security checks without a private-repo platform lock-in."
compatibility: "Requires the Semgrep CLI in local or CI environments; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET Semgrep

## Trigger On

- the repo uses or wants Semgrep for .NET security scanning
- the team wants an OSS-friendly CLI scanner for local and CI runs

## Do Not Use For

- formatting or style checks

## Inputs

- the nearest `AGENTS.md`
- desired rule source: auto, local rules, or org rules
- CI environment

## Workflow

1. Use `semgrep scan` for local and offline-friendly CLI scanning.
2. Use `semgrep ci` only when the repo intentionally depends on Semgrep AppSec Platform.
3. Keep custom rules versioned in the repo if the team writes them.

## Deliver

- explicit Semgrep install and run commands
- CI-ready security scanning without hidden platform dependence

## Validate

- the chosen Semgrep mode matches the team's account and platform expectations
- rule sources are explicit

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

- read `references/semgrep.md` first

## Example Requests

- "Add Semgrep CLI scanning for this .NET repo."
- "Use Semgrep without a hosted platform dependency."
