---
name: mcaf-ci-cd
description: "Create or revise CI/CD workflows, required quality gates, versioned artifacts, release promotion, and rollback. Use for pipeline or delivery automation changes."
metadata:
  compatibility: "Requires repository access; may update CI workflows, pipeline docs, and release guidance."
---

# MCAF: CI/CD

Read root/local `AGENTS.md`, existing workflows, called scripts, artifact consumers, environment permissions, and the actual release mechanism.

## Workflow

1. Trace PR validation, trusted artifact production, staging, and release/promotion as applicable. Give each stage an explicit purpose, input, failure signal, and completion condition.
2. Preserve exact repo build, test, format, analysis, and coverage gates. For .NET, derive runner and coverage switches from the configured toolchain.
3. Review triggers, dependencies, concurrency, shell quoting, secret handling, least-privilege permissions, and rollback before executing verification.
4. Keep reusable logic in checked-in scripts when it improves reliability. Validate the complete workflow and affected scripts after self-review and fixes.
5. Obtain approval for material deployment topology, dependency, permission, or weakened gate changes. A pipeline edit does not itself authorize production promotion.
6. Report local validation, CI completion, artifact publication, deployment, and live health as separate observed states. A queued job or green build is not publication or production proof.

Deliver the requested workflow and relevant release/runbook updates, with exact verification evidence and remaining blockers.

## References

- For stage and rollback criteria: [CI/CD guidance](references/ci-cd.md).
- For .NET tools not bundled here: [Managed Code Skills catalog](https://skills.managed-code.com/).
