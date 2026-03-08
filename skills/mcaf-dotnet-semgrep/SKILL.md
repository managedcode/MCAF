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

## Load References

- read `references/semgrep.md` first

## Example Requests

- "Add Semgrep CLI scanning for this .NET repo."
- "Use Semgrep without a hosted platform dependency."
