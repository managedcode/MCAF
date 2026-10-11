---
name: mcaf-solid-maintainability
description: "Refactor coupled or oversized code by responsibility, apply repository maintainability limits, and document justified exceptions. Use for design quality changes or maintainability policy."
metadata:
  compatibility: "Requires repository write access; uses maintainability limits from root or local `AGENTS.md`."
---

# MCAF: SOLID Maintainability

Read root/local `AGENTS.md`, the complete affected behavior, callers, contracts, and tests. Preserve accepted architecture and observable behavior during a local refactor; seek approval for material boundary changes.

## Workflow

1. Read the active `file_max_loc`, `type_max_loc`, `function_max_loc`, `max_nesting_depth`, and `exception_policy` from governance. Numeric limits belong there, never in skill metadata.
2. Split by responsibility and cohesion, with explicit dependencies and composition where appropriate. Line count identifies a smell; moving lines alone does not fix it.
3. Apply the repo's literal/configuration rules. Give behavior-defining values a named owner rather than scattering duplicated literals.
4. Complete every affected call site, integration, and regression test. Review behavior preservation, failure paths, and test quality before formatting and planned verification.
5. When a temporary limit breach is justified, document its reason, exact scope, owner, and removal plan where `exception_policy` requires. A debt record does not complete unfinished in-scope work.

Deliver a cohesive implementation or the requested policy update, with evidence that behavior and required gates remain sound.

## References

- For policy keys and temporary breaches: [limits and exceptions](references/limits-and-exceptions.md).
- For design signals: [maintainability](references/maintainability.md).
- For runtime failures and API error handling: [exception handling](references/exception-handling.md).
