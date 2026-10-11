---
name: mcaf-nfr
description: "Turn relevant quality goals into measurable requirements and verification for performance, reliability, accessibility, data integrity, or other system attributes."
metadata:
  compatibility: "Requires repository access when NFRs are documented in feature docs, ADRs, or architecture docs."
---

# MCAF: Non-Functional Requirements

Read root/local `AGENTS.md`, the affected flow, workload, and accepted quality expectations. Do not treat every quality attribute as mandatory for every task.

## Workflow

1. Select the attributes that materially affect the requested change.
2. For each, record the metric/invariant, threshold, workload/environment, failure/degraded behavior, owner, and evidence needed for pass/fail.
3. Link design-driving constraints to feature requirements, ADRs, tests, and operational evidence. Obtain approval before changing architecture or material contracts to meet them.
4. Use product-specific targets; illustrative thresholds or technology examples are not requirements.
5. Review the criteria for measurability and meaningful failure detection before executing the planned checks.

Deliver the relevant requirements and their verification mapping in the existing canonical feature/ADR docs.

## References

Read only the active attribute's reference:

- [Performance](references/performance.md), [capacity](references/capacity.md), [scalability](references/scalability.md).
- [Reliability](references/reliability.md), [availability](references/availability.md), [disaster recovery](references/disaster-recovery.md).
- [Data integrity](references/data-integrity.md), [interoperability](references/interoperability.md), [portability](references/portability.md).
- [Accessibility](references/accessibility.md), [usability](references/usability.md), [internationalization](references/internationalization.md).
- [Maintainability](references/maintainability.md), [compliance](references/compliance.md).
