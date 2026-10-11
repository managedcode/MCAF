---
name: mcaf-human-review-planning
description: "Prioritize human review of a large generated code area by tracing real flows and ranking risky files. Use when a reviewer cannot inspect every line and needs a practical review sequence."
metadata:
  compatibility: "Requires repository read access; may write a `HUMAN_REVIEW_PLAN.md` file under docs, or to an exact docs path the user specifies, when the user asks for a saved review plan."
---

# MCAF: Human Review Planning

Read root/local `AGENTS.md` and the requested area. Keep this pass read-only unless the user requests a saved plan or implementation.

## Workflow

1. Trace the actual user or system lifecycle from entry points through validation, permissions, persistence, integrations, side effects, and completion. Include immediate callers and contracts needed to understand it.
2. Compare new behavior with established architecture, analogous entities, and existing invariants. Prioritize state corruption, authorization bypass, irreversible effects, retry/idempotency mistakes, and integration drift.
3. Produce two separate lists: the ordered review flow, and priority files/modules. For each item, name the concrete risk and what the reviewer should verify.
4. Distinguish inspected evidence from assumptions and unexamined paths. A priority plan is not proof that the code has no defects.
5. Present both lists in chat. Save only when requested, at the user's exact path or the nearest relevant `docs/` area.

Do not invent a universal signup/create/update sequence; follow the actual system. Do not replace human prioritization with a generic checklist or claim completed verification.

## References

- For output fields and save location: [review plan format](references/review-plan-format.md).
- When ranking boundaries: [risk signals](references/risk-signals.md).
