---
name: mcaf-devex
description: "Fix local setup, run, debug, test, or onboarding friction using reproducible repository commands. Use when contributor workflows are missing, inconsistent, or slow."
metadata:
  compatibility: "Requires repository access; may update docs, task runners, devcontainer guidance, or local setup conventions."
---

# MCAF: Developer Experience

Read root/local `AGENTS.md`, current onboarding, scripts, service wiring, and the concrete setup failure.

## Workflow

1. Trace prerequisites through first build, real service startup, debug, tests, and cleanup. Identify the fragile step before adding tooling.
2. Prefer the existing supported command path and real services, containers, or sandboxes. Use cross-platform or containerized setup only where it solves the observed problem.
3. Teach `MCAF-ARCH-001` with the repository map and one real canonical slice across all applicable surfaces.
4. Teach `MCAF-REQ-001` by linking that slice's requirements, acceptance, ADR decision, tasks, tests, and evidence.
5. Complete the requested script/config/doc changes, self-review the entire path, then verify the affected setup or command in one planned phase.
6. Explain required credentials and common failures without embedding secrets. Get approval before changing architecture, dependencies, or production topology.

Deliver a reproducible workflow and concise onboarding instructions grounded in actual commands and observed results.

## References

- For setup friction and command ownership: [developer experience](references/developer-experience.md).
- When writing onboarding: [guide scaffold](references/onboarding-guide-template.md).
