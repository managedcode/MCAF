---
name: mcaf-code-review
description: "Prepare for, perform, or tighten code review workflow: PR scope, review checklist, reviewer expectations, and merge hygiene. Use when shaping pull requests, defining review policy, or auditing whether a change is review-ready."
compatibility: "Requires repository access; may update PR templates, review docs, or contribution guidance."
---

# MCAF: Code Review

## Trigger On

- shaping PR review policy
- preparing a change for review
- auditing whether a change is actually review-ready
- tightening reviewer expectations or templates

## Do Not Use For

- implementing the code change itself
- generic team-process work with no PR or review component

## Inputs

- the diff or planned PR scope
- tests, docs, and architecture notes affected by the change
- current review template or review policy, if any

## Workflow

1. Confirm the change is small enough to review coherently. Split if needed.
2. Check that tests, docs, and architecture notes moved with the code.
3. Review in this order:
   - behavioural risk
   - design and maintainability
   - test quality
   - operational or security impact
4. If the repo needs review policy or a template, define it in-repo.
5. Keep reviewer guidance concrete. Avoid vague "review carefully" language.

## Deliver

- review-ready pull requests
- review guidance that is specific and enforceable
- findings tied to behaviour, design, testing, and risk

## Validate

- the review guidance tells reviewers what to check, not just that they should check
- PR scope is understandable without opening the whole repo
- tests and docs are part of review readiness, not afterthoughts

## Load References

- read `references/code-reviews.md` and `references/pull-requests.md` first
- open `references/pull-request-template.md`, `references/inclusion-in-code-review.md`, or `references/faq.md` only when needed

## Example Requests

- "Make our PR template less useless."
- "Is this change actually ready for code review?"
- "Define stricter review expectations for this repo."
