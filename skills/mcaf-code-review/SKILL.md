---
name: mcaf-code-review
description: "Review a diff for correctness, requirement coverage, test quality, and operational risk, or refine PR review policy and templates. Use for concrete findings and review readiness."
metadata:
  compatibility: "Requires repository access; may update PR templates, review docs, or contribution guidance."
---

# MCAF: Code Review

Follow root and applicable local `AGENTS.md`. A review request authorizes inspection; implementation or external review actions remain within the user's requested scope.

## Workflow

1. Read the complete diff plus affected implementations, callers, contracts, tests, and docs. Identify the accepted requirements and specific risks before judging the change.
2. Check behavior, authorization, state ownership, failure handling, migration, and end-to-end wiring where relevant. Report concrete defects or missing requirements with their trigger, impact, and exact path; do not invent findings to fill a checklist.
3. Review tests before execution: real flows, meaningful outcomes, required negative/edge paths, isolation, and the ability to detect the regression. Passing weak tests is insufficient proof.
4. Apply `MCAF-ARCH-001`: all solution artifacts remain in one repository and affected surfaces use their canonical slice names.
5. Apply `MCAF-REQ-001`: requirements trace through acceptance, required ADR implementation contracts, tasks, tests, and evidence. Reject premature `Verified`/`Implemented` status.
6. For delegated work, apply `MCAF-AI-001`: the lead inspects every diff, ownership and contract compliance, explicit completion states, required joins, and combined verification.
7. Check that material architecture, serialization, contract, data, security, dependency, or deployment decisions have user approval. Existing authorization covers its exact scope.
8. Finish self-review and fixes before planned verification. Repeat a review or check only to resolve a new change, concrete failure, or unanswered risk.

Return actionable findings ordered by impact, then any verification limits. If none exist, say so. For policy work, deliver the requested repo guidance or PR template without imposing an unrelated process.

## References

- For review expectations: [code reviews](references/code-reviews.md) and [PR readiness](references/pull-requests.md).
- When creating a template: [PR scaffold](references/pull-request-template.md).
- When addressing review communication or process friction: [communication](references/inclusion-in-code-review.md) or [review FAQ](references/faq.md).
