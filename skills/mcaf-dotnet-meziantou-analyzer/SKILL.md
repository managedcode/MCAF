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

- read `references/meziantou-analyzer.md` first

## Example Requests

- "Add Meziantou analyzers to the repo."
- "Use Meziantou for extra quality and security checks."
