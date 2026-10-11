---
name: mcaf-adr-writing
description: "Write or update an architecture decision record with alternatives, consequences, approval, and an executable implementation contract. Use for material design decisions or an explicit ADR request."
metadata:
  compatibility: "Requires repository write access; produces Markdown ADRs with Mermaid diagrams."
---

# MCAF: ADR Writing

Read root/local `AGENTS.md`, the affected architecture, feature requirements, contracts, and existing ADR conventions.

## Workflow

1. Define the concrete decision, current constraints, alternatives, trade-offs, and affected `REQ-*`/`AC-*` or cross-cutting operational obligation.
2. Obtain user approval before implementing a material architecture, serializer/serialization, contract, data, security, dependency, or deployment change. Prior approval for that exact decision remains valid; a proposed ADR is not approval.
3. Apply `MCAF-ARCH-001`: keep solution artifacts in one repository and preserve canonical slices. Existing deviations need a migration owner, target, verification, and removal date.
4. Apply `MCAF-REQ-001`: define ordered implementation stages, exact file/slice ownership, dependencies, preserved/changed contracts, migration/rollout/rollback, tests, pass conditions, and evidence.
5. For delegated implementation, record `MCAF-AI-001` roles, disjoint writes, native status/wait, explicit completion states, escalation, and join gates.
6. Link related feature docs and the architecture map. Include a rendered Mermaid diagram for the decision's boundaries or interactions.
7. Use `Proposed` until approved, `Accepted` while implementation is pending, and `Implemented` only when required code, migrations, tests, docs, and verification evidence exist.

Deliver `docs/ADR/ADR-XXXX-short-title.md` using the repo's numbering and naming convention. Review the whole record for real values, traceability, and status accuracy.

## References

- For scaffolding: [ADR template](references/adr-template.md).
- When adapting a compact or options-matrix format: [format guidance](references/ADR-FORMATS.md).
- For feature/decision obligations: [requirements traceability](../mcaf-feature-spec/references/requirements-adr-traceability.md).
