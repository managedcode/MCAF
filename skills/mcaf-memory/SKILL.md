---
name: mcaf-memory
description: Maintain a persistent project memory file (`skills/mcaf-memory/references/memory.md`) with stable facts, constraints, preferences, and glossary so agents don’t re-learn the same context every chat. Use when the user says “remember”, gives repeating feedback, or when important project constraints are discovered.
compatibility: Requires repository write access; stores memory in Markdown.
---

# MCAF: Memory

## Output

- `skills/mcaf-memory/references/memory.md` (create/update)

## When to use (triggers)

- The user says “remember / keep in mind / from now on”.
- Repeated feedback about agent behaviour or workflow.
- You discover stable project constraints (stack versions, environments, forbidden changes).
- You need a shared glossary (“what does X mean in this project?”).

## Workflow

1. Open `skills/mcaf-memory/references/memory.md`.
2. Keep the “7 Questions (profile)” up to date:
   - fill the answers as short bullets
   - these answers must reflect the real workflow (TDD, docs, release discipline)
3. Add/update only **stable** information:
   - code taste & standards (readability, naming, patterns, “never do this”)
   - testing taste & standards (TDD policy, levels, assertions, flakiness policy)
   - documentation taste & standards (ADR/feature docs expectations, diagrams)
   - architecture principles/constraints (boundaries, dependency rules)
   - glossary (project-specific terms)
4. Keep it short and useful:
   - bullets, not essays
   - remove outdated entries when superseded
   - don’t duplicate the same rule in multiple places
5. Decide the right home for information:
   - **Rules/commands for agents** → `AGENTS.md`
   - **Architecture decisions** → `docs/ADR/*`
   - **Behaviour/flows** → `docs/Features/*`
   - **Long-lived context & preferences** → `skills/mcaf-memory/references/memory.md`
6. Never store secrets or personal data.

## Guardrails

- If it changes often or is controversial → it probably belongs in a Feature doc or ADR, not memory.
- Memory is not a dumping ground. If it grows, refactor into real docs and keep memory as an index.
