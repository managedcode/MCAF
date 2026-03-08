---
name: mcaf-dotnet-meziantou-analyzer
description: "Use the open-source free `Meziantou.Analyzer` package for design, usage, security, performance, and style rules in .NET. Use when a repo wants broader analyzer coverage with a single NuGet package."
compatibility: "Requires a .NET SDK-based repository; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET Meziantou.Analyzer

## Trigger On

- the repo uses or wants `Meziantou.Analyzer`
- the team wants one analyzer pack that covers design, usage, security, performance, and style

## Do Not Use For

- repos that already enforce an overlapping analyzer baseline and do not want extra diagnostics
- formatting-only work

## Inputs

- the nearest `AGENTS.md`
- current analyzer packages
- `.editorconfig`

## Workflow

1. Add `Meziantou.Analyzer` when the repo wants broader rules than the SDK baseline.
2. Keep rule severity in the repo-root `.editorconfig`.
3. Review overlaps with SDK analyzers and Roslynator before mass-enabling everything as errors.

## Deliver

- explicit Meziantou package setup
- repo-owned severity and warning policy

## Validate

- the added rules are understood by the team
- CI runs stay actionable instead of noisy

## Load References

- read `references/meziantou-analyzer.md` first

## Example Requests

- "Add Meziantou analyzers to the repo."
- "Use Meziantou for extra quality and security checks."
