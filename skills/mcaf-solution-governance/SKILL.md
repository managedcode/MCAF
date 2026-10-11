---
name: mcaf-solution-governance
description: "Create or update root and project-local AGENTS.md, repository boundaries, rule precedence, skill routing, and agent workflow policy. Use for MCAF bootstrap or governance changes."
metadata:
  compatibility: "Requires repository write access; updates root or local `AGENTS.md` files and related governance docs."
---

# MCAF: Solution Governance

Read every existing root and local `AGENTS.md` completely before editing governance. Preserve the user's accepted scope and prior authorization.

## Workflow

1. Apply `MCAF-GOV-001`: merge additions; never replace, truncate, omit, summarize away, or weaken existing customized rules. Keep the stricter overlap and report real conflicts. Template placeholders may be customized; changing a real rule needs rule-specific owner direction.
2. Map the complete solution repository and canonical slice paths under `MCAF-ARCH-001`. Split repositories, layer-first feature ownership, and inconsistent slice names are migration debt with an owner, target, verification, and removal date.
3. Keep root governance global: shared commands, workflow, approval boundaries, skills, numeric maintainability limits, and policy gates. Keep local files specific: purpose, entry points, owned slices, boundaries, commands, applicable skills, risks, and stricter constraints.
4. Record `MCAF-AI-001` model roles, bounded worker ownership, instruction packets, dependencies, completion evidence, native waiting, join conditions, escalation, and lead review. Use role-based capability rules rather than transient model names.
5. Record `MCAF-REQ-001`: stable feature requirements/acceptance IDs, ADR triggers and implementation contracts, and traceability through tasks, tests, and evidence.
6. Require complete affected-flow inspection, implementation of every approved variant, code/test self-review, fixes, and formatting before planned verification. Preserve repository gates; repeat checks only for a new change, failure, or unresolved question.
7. Require approval for architecture, serializers/serialization contracts, and other material contract, data, security, dependency, or deployment decisions. Routine work inside an approved design proceeds without renewed approval.
8. Compare the complete governance diff with existing rules and confirm that paths, commands, policy strength, and root/local responsibilities remain correct.

Deliver the requested governance files, explain the policy changes and conflicts, and report the checks performed. Install only skills the repository actually uses.

## References

- For every governance update: [update safety](references/agents-update-safety.md) and [precedence](references/rule-precedence.md).
- When mapping or changing solution topology: [repository and slices](references/monorepo-vertical-slices.md).
- When configuring delegation: [model-tier orchestration](references/model-tier-orchestration.md).
- When configuring feature/ADR gates: [requirements traceability](../mcaf-feature-spec/references/requirements-adr-traceability.md).
- When creating a local file: [project AGENTS scaffold](references/project-agents-template.md).
- For a .NET toolchain: [.NET command ownership](references/dotnet-agents-pattern.md).
