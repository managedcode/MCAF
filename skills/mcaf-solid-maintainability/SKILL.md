---
name: mcaf-solid-maintainability
description: "Apply SOLID, SRP, cohesion, composition-over-inheritance, and small-file discipline to code changes. Use when refactoring large files or classes, setting maintainability limits in `AGENTS.md`, documenting justified exceptions, or reviewing design quality."
compatibility: "Requires repository write access; uses maintainability limits from root or local `AGENTS.md`."
---

# MCAF: SOLID Maintainability

## Trigger On

- files, classes, or functions are too large or too coupled
- maintainability limits in `AGENTS.md` need to be added or tightened
- a change needs a justified temporary exception

## Do Not Use For

- writing architecture docs without touching code structure or policy
- cosmetic formatting-only edits

## Inputs

- the nearest `AGENTS.md`
- the code under change
- current testing seams and dependency boundaries

## Workflow

1. Read the active values for:
   - `file_max_loc`
   - `type_max_loc`
   - `function_max_loc`
   - `max_nesting_depth`
   - `exception_policy`
2. Evaluate the change through SOLID:
   - single responsibility
   - explicit dependencies
   - composition before inheritance
   - boundaries that are easy to test
3. Remove hardcoded values and inline string literals from implementation code by moving them into named constants, enums, configuration, or dedicated types.
4. Split by responsibility, not by arbitrary line count alone.
5. If a limit must be exceeded temporarily, document the exception exactly where `exception_policy` requires it.

## Deliver

- smaller, more cohesive code
- updated maintainability policy when repo rules changed
- explicit exception records when a temporary breach is justified

## Validate

- size limits are respected or explicitly waived
- responsibilities are clearer after the change
- the refactor improves testability instead of only moving lines around
- literals that matter are named once and reused instead of repeated inline
- no numeric limit was moved into framework prose or skill metadata

## Load References

- read `references/limits-and-exceptions.md` first
- open `references/maintainability.md` for broader design guidance
- open `references/exception-handling.md` when documenting a temporary breach

## Example Requests

- "Split this 700-line service into cohesive parts."
- "Add maintainability limits to AGENTS."
- "Refactor this class to follow SOLID and document the one exception."

## Guardrails

- numeric limits belong in `AGENTS.md`, not in the framework guide or skill metadata
- a justified exception is a debt record, not a permanent escape hatch
