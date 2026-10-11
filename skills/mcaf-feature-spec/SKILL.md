---
name: mcaf-feature-spec
description: "Create or update an executable feature specification with stable requirements, acceptance criteria, real flows, ADR decisions, and test traceability. Use before non-trivial behavior changes or on an explicit spec request."
metadata:
  compatibility: "Requires repository write access; produces Markdown docs with Mermaid diagrams and executable verification steps."
---

# MCAF: Feature Spec

Read root/local `AGENTS.md`, the architecture map, current implementation and callers, contracts, tests, and the user's accepted outcome.

## Workflow

1. Define scope, actors, permissions, boundaries, assumptions, and every required success, failure, and edge variant. Separate open decisions from accepted requirements.
2. Apply `MCAF-ARCH-001`: select one canonical slice name and map backend, frontend, contracts, tests, infrastructure, and docs inside this repository. Record `N/A` with a reason for an inapplicable surface.
3. Apply `MCAF-REQ-001`: give requirements stable `REQ-*` IDs, type, priority, rationale, and measurable pass/fail conditions. Map each to `AC-*` and meaningful automated tests or explicit exceptions with manual evidence.
4. Link required ADRs or explain why existing architecture/contracts suffice. User approval is required before material architecture, serialization, contract, data, security, dependency, or deployment changes are implemented.
5. For non-trivial delegated work, define the `MCAF-AI-001` task graph with roles/model tiers, disjoint ownership, dependencies, artifacts, verification, explicit completion states, and join conditions.
6. Plan complete code, tests, wiring, and docs, followed by self-review, fixes, formatting, and one verification phase. Every check must prove a requirement or answer a specific risk.
7. Keep the requirement → acceptance → ADR → task → test → evidence matrix current. Do not mark `Verified` until every accepted variant and required gate is complete.

Deliver `docs/Features/<SliceName>.md` with at least one rendered Mermaid flow diagram. It must be implementable without hidden assumptions or rereading the conversation.

## References

- For the policy contract: [requirements and ADR traceability](references/requirements-adr-traceability.md).
- When scaffolding a spec: [feature template](references/feature-template.md).
