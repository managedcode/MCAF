---
name: mcaf-adr-writing
description: "Create or update an ADR under `docs/ADR/` for architectural decisions, dependency changes, data-model changes, or cross-cutting policy shifts. Use `references/adr-template.md` for scaffolding and keep the ADR self-contained, diagrammed, and testable."
compatibility: "Requires repository write access; produces Markdown ADRs with Mermaid diagrams."
---

# MCAF: ADR Writing

## Trigger On

- a dependency, boundary, platform, contract, or data model is changing
- a design decision has meaningful trade-offs that should be recorded
- a repo-wide engineering policy needs a durable rationale

## Do Not Use For

- feature-level behaviour details without an architecture decision
- generic architecture overview content

## Inputs

- `docs/Architecture/Overview.md`
- related feature docs
- the nearest `AGENTS.md`
- current constraints, options, and risks

## Workflow

1. Start from the concrete decision that must be made now.
2. If the ADR is missing, scaffold it from `references/adr-template.md`.
3. Record:
   - context and problem
   - chosen decision
   - alternatives considered
   - trade-offs and consequences
   - implementation plan
4. Add diagrams only when they remove ambiguity.
5. Link the ADR to affected feature docs and `docs/Architecture/Overview.md`.

## Deliver

- `docs/ADR/ADR-XXXX-<short-title>.md`
- linked updates to architecture docs when the decision changes boundaries

## Validate

- the decision and rejected alternatives are explicit
- trade-offs are concrete, not hand-wavy
- implementation impact is clear
- a future engineer can understand why this path was chosen

## Load References

- start with `references/adr-template.md`
- use `references/ADR-FORMATS.md` only for numbering or formatting conventions

## Example Requests

- "Write an ADR for moving to event-driven notifications."
- "Document why we are adding PostgreSQL instead of keeping SQLite."
- "Capture the policy decision behind local project AGENTS files."
