---
name: mcaf-feature-spec
description: "Create or update a feature spec under `docs/Features/` with business rules, user flows, system behaviour, verification, and Definition of Done. Use before implementing non-trivial behaviour changes; use `references/feature-template.md` for scaffolding."
compatibility: "Requires repository write access; produces Markdown docs with Mermaid diagrams and executable verification steps."
---

# MCAF: Feature Spec

## Trigger On

- add or change non-trivial behaviour
- behaviour is under-specified and engineers are guessing
- tests need a stable behavioural source of truth

## Do Not Use For

- architecture decisions that need alternatives and trade-offs
- tiny typo or cosmetic-only changes with no behavioural impact

## Inputs

- `docs/Architecture/Overview.md`
- the nearest `AGENTS.md`
- current user flows, business rules, and acceptance expectations

## Workflow

1. Define scope first: in scope, out of scope, boundaries touched.
2. If the feature doc is missing, scaffold from `references/feature-template.md`.
3. Keep the spec executable:
   - numbered rules
   - main flow
   - edge and failure flows
   - system behaviour
   - verification steps
   - Definition of Done
4. Make the spec concrete enough that tests can be written without guessing.
5. If the feature creates a new dependency, boundary, or major policy shift, update an ADR too.

## Deliver

- `docs/Features/<feature>.md`
- a feature spec that engineers and agents can implement directly

## Validate

- rules are testable, not aspirational
- edge cases are captured where they matter
- verification steps match the intended behaviour
- the doc can drive implementation without hidden tribal knowledge

## Load References

- use `references/feature-template.md` only for scaffolding

## Example Requests

- "Write a feature spec for the new checkout retry flow."
- "Document the behaviour before coding this API change."
- "Turn this loose requirement into an executable feature doc."
