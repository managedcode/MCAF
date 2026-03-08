---
name: mcaf-dotnet-complexity
description: "Use free built-in .NET maintainability analyzers and code metrics configuration to find overly complex methods and coupled code. Use when a repo needs cyclomatic complexity checks, maintainability thresholds, or complexity-driven refactoring gates."
compatibility: "Requires a .NET SDK-based repository; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET Complexity

## Trigger On

- the team wants to find overly complex methods
- cyclomatic complexity thresholds are needed in CI
- maintainability metrics or coupling thresholds need to be configured

## Do Not Use For

- formatting-only work
- generic analyzer setup with no complexity policy change

## Inputs

- the nearest `AGENTS.md`
- current analyzer settings
- current maintainability limits

## Workflow

1. Start with the built-in maintainability analyzers before reaching for non-standard tooling.
2. Use these rules deliberately:
   - `CA1502` for excessive cyclomatic complexity in methods
   - `CA1505` for low maintainability index
   - `CA1506` for excessive class coupling
   - `CA1501` when inheritance depth is also part of the design problem
3. Keep rule severity in the root `.editorconfig`.
4. Keep metric thresholds in a checked-in `CodeMetricsConfig.txt` added as `AdditionalFiles`.
5. Pair analyzer findings with MCAF maintainability limits in `AGENTS.md`.

## Deliver

- explicit complexity and maintainability policy
- checked-in metric thresholds
- CI commands that surface complex methods early

## Validate

- method-complexity checks are enabled where the repo wants them
- thresholds are versioned in repo, not held in IDE memory
- complexity findings map to real refactoring decisions

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

- read `references/complexity.md` first

## Example Requests

- "Which analyzer finds complex methods in .NET?"
- "Add a complexity gate for our C# code."
- "Configure cyclomatic complexity thresholds."
