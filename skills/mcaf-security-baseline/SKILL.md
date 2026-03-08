---
name: mcaf-security-baseline
description: "Apply baseline engineering security guidance: secrets handling, secure defaults, threat modelling references, and review checkpoints for auth, data flow, pipelines, and external integrations. Use when a change has security impact but does not require a full standalone AppSec engagement."
compatibility: "Requires repository access; may update security docs, ADRs, and verification steps."
---

# MCAF: Security Baseline

## Trigger On

- a change has security impact but does not need a full separate AppSec exercise
- the work touches auth, secrets, trust boundaries, data flow, or pipeline permissions
- the team needs secure-default guidance before implementing

## Do Not Use For

- a full standalone threat-modeling engagement
- generic code review with no security surface

## Inputs

- the changed boundary, data flow, or integration
- auth, secret, and permission model for the affected path
- current security docs, ADRs, or CI rules

## Workflow

1. Identify the security surface:
   - authn and authz
   - secrets
   - external inputs
   - storage and transport
   - pipeline permissions
2. Apply secure defaults and least privilege before adding behaviour.
3. If the change introduces a trust boundary, update or add an ADR and link the reasoning.
4. Pull the relevant security references, not the whole set.

## Deliver

- security-aware design or implementation guidance
- updated security checkpoints in docs, ADRs, or CI
- the right threat-model references for the impacted area

## Validate

- secrets are handled explicitly
- authn and authz assumptions are visible
- new trust boundaries are documented
- the change does not smuggle insecure defaults into the repo

## Load References

- read `references/security.md` first
- open `references/rules-of-engagement.md` or `references/threat-modelling.md` only when they match the task

## Example Requests

- "Review the security baseline for this new OAuth flow."
- "We are adding a webhook. What baseline security work is required?"
- "Tighten secrets and pipeline permissions for this repo."
