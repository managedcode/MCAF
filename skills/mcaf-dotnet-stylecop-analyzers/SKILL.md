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

## Load References

- read `references/stylecop-analyzers.md` first

## Example Requests

- "Add `StyleCop.Analyzers` to this solution."
- "Configure StyleCop without losing `.editorconfig` ownership."
