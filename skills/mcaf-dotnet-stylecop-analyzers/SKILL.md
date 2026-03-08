---
name: mcaf-dotnet-stylecop-analyzers
description: "Use the open-source free `StyleCop.Analyzers` package for naming, layout, documentation, and style rules in .NET projects. Use when a repo wants stricter style conventions than the SDK analyzers alone provide."
compatibility: "Requires a .NET SDK-based repository; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET StyleCopAnalyzers

## Trigger On

- the repo wants `StyleCop.Analyzers`
- naming, layout, or documentation style needs stronger enforcement
- the team needs `stylecop.json` guidance

## Do Not Use For

- repos that intentionally rely only on SDK analyzers
- repos where `StyleCop` overlaps too heavily with an existing style package and no consolidation is planned

## Inputs

- the nearest `AGENTS.md`
- current `.editorconfig`
- any existing `stylecop.json`

## Workflow

1. Add `StyleCop.Analyzers` only if the repo wants its opinionated style rules.
2. Keep severity in the root `.editorconfig`.
3. Use `stylecop.json` only for StyleCop-specific behavioral options.
4. Prefer one checked-in `stylecop.json` per repo unless a project genuinely needs its own behavior.
5. Avoid rule duplication with SDK analyzers or other analyzer packs when possible.

## Deliver

- explicit StyleCop package setup
- repo-owned StyleCop rule configuration
- clear split between root `.editorconfig` and `stylecop.json`

## Validate

- StyleCop severity is versioned in repo config
- `stylecop.json` is used only where it adds value

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

- read `references/stylecop-analyzers.md` first

## Example Requests

- "Add `StyleCop.Analyzers` to this solution."
- "Configure StyleCop without losing `.editorconfig` ownership."
