---
name: mcaf-documentation
description: "Update durable engineering docs, navigation, and canonical source placement when they are stale, duplicated, or missing. Use for general docs work; feature specs and ADRs have dedicated skills."
metadata:
  compatibility: "Requires repository write access; updates docs and documentation structure."
---

# MCAF: Documentation

Read root/local `AGENTS.md` and the source, policy, or workflow the requested documentation describes.

## Workflow

1. Choose one canonical home per durable fact and link to it. Keep architecture maps navigational; put behavior in feature docs and decisions in ADRs.
2. Apply `MCAF-ARCH-001`: keep solution docs in this repository and use the same feature slice names as code, contracts, and tests.
3. Apply `MCAF-REQ-001` to non-trivial feature/ADR docs: stable requirements and acceptance, explicit ADR decisions, implementation contracts, and task/test/evidence links.
4. Update all affected documentation together without inventing future behavior or changing policy implicitly. Preserve customized `AGENTS.md` rules during governance updates.
5. Review the complete content and links before the planned docs checks. Do not run application suites for prose alone unless repository policy or an affected executable contract requires them.
6. Report the requested docs and their verification. Keep implementation, CI, publication, deployment, and production claims aligned with actual evidence.

## References

- For structure and source ownership: [documentation guidance](references/documentation.md).
