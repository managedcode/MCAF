---
name: mcaf-dotnet-archunitnet
description: "Use the open-source free `ArchUnitNET` library for architecture rules in .NET tests. Use when a repo needs richer architecture assertions than lightweight fluent rule libraries usually provide."
compatibility: "Requires a .NET test project; supports dedicated integrations for xUnit, xUnit v3, MSTest, TUnit, and others where available."
---

# MCAF: .NET ArchUnitNET

## Trigger On

- the repo uses or wants `ArchUnitNET`
- architecture testing needs richer modeling than simple dependency checks

## Do Not Use For

- the lightest possible architecture rule checks

## Inputs

- the nearest `AGENTS.md`
- target assemblies
- architecture boundaries and naming conventions

## Workflow

1. Load the architecture once per test assembly where possible.
2. Encode a small number of durable, high-value architecture rules first.
3. Use the test-framework-specific integration package that matches the repo.

## Deliver

- architecture tests with richer domain and type modeling

## Validate

- architecture load cost is reasonable for the suite
- rules are stable and tied to real boundaries

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

- read `references/archunitnet.md` first

## Example Requests

- "Use ArchUnitNET for layered architecture tests."
- "Set up ArchUnitNET with xUnit or MSTest."
