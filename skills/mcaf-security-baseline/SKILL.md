---
name: mcaf-security-baseline
description: "Review or implement scoped security controls for authentication, authorization, secrets, external inputs, data handling, and pipeline permissions. Use for a concrete security impact or baseline request."
metadata:
  compatibility: "Requires repository access; may update security docs, ADRs, and verification steps."
---

# MCAF: Security Baseline

Read root/local `AGENTS.md`, the affected trust/data flow, permission model, and existing security controls. Do not expand ordinary work into an unrelated security engagement.

## Workflow

1. Identify relevant actors, assets, external inputs, trust boundaries, secrets, storage/transport, and CI permissions.
2. Inspect authentication, authorization, validation, tenant/owner isolation, and failure handling through actual entry points and state changes.
3. Preserve secure defaults and least privilege. Material identity, trust, dependency, or weakened-control changes require user approval and the applicable ADR.
4. Implement the complete approved security behavior and meaningful rejection tests. Review code and tests before planned verification with real authorized test environments.
5. Report concrete findings, controls, proof, and unresolved risks. Baseline review does not establish certification or authorize live scanning.

## References

- For review areas and escalation: [security baseline](references/security.md).
- When mapping a new trust boundary: [threat modelling](references/threat-modelling.md).
- Before active security testing: [rules of engagement](references/rules-of-engagement.md).
