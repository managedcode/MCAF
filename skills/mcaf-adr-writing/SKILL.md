---
name: mcaf-adr-writing
description: "Create or update an ADR under `docs/ADR/` for architectural decisions, dependency changes, data-model changes, or cross-cutting policy shifts. Use when the user asks to write, update, or document an ADR, record a design decision, capture architecture trade-offs, or justify a repo-wide technical policy."
metadata:
  compatibility: "Requires repository write access; produces Markdown ADRs with Mermaid diagrams."
---

# MCAF: ADR Writing

## Trigger On

- a dependency, boundary, platform, contract, or data model is changing
- a design decision has meaningful trade-offs that should be recorded
- a repo-wide engineering policy needs a durable rationale

## Value

- produce a concrete project delta: code, docs, config, tests, CI, or review artifact
- reduce ambiguity through explicit planning, verification, and final validation skills
- leave reusable project context so future tasks are faster and safer

## Do Not Use For

- feature-level behaviour details without an architecture decision
- generic architecture overview content

## Inputs

- `docs/Architecture.md`
- related feature docs
- the nearest `AGENTS.md`
- current constraints, options, and risks
- the mandatory `MCAF-ARCH-001` repository boundary and canonical vertical-slice convention
- stable feature `REQ-*` and `AC-*` IDs governed by `MCAF-REQ-001`, or an explicit cross-cutting operational obligation

## Quick Start

1. Read the nearest `AGENTS.md` and confirm scope and constraints.
2. Run this skill's `Workflow` through the `Ralph Loop` until outcomes are acceptable.
3. Return the `Required Result Format` with concrete artifacts and verification evidence.

## Workflow

1. Start from the concrete decision that must be made now.
2. Read `../mcaf-feature-spec/references/requirements-adr-traceability.md` and apply `MCAF-REQ-001`.
3. If the ADR is missing, scaffold it from `references/adr-template.md`.
4. Record:
   - context and problem
   - chosen decision
   - alternatives considered
   - trade-offs and consequences
   - related `REQ-*` and `AC-*` IDs
   - an ordered implementation contract with exact ownership, dependencies, migration/rollout, verification, and completion evidence
   - `MCAF-AI-001` lead/worker/reviewer roles, disjoint write scopes, native wait/status mechanism, and join gates
5. Add diagrams only when they remove ambiguity.
6. Verify the decision preserves `MCAF-ARCH-001`. Do not approve a split repository, layer-first feature owner, or inconsistent slice naming as a valid target architecture; document an existing deviation only as a time-bounded migration with owner and removal date.
7. Link the ADR to affected feature docs and `docs/Architecture.md`.
8. Use `Implemented` only after the planned artifacts, migrations, tests, docs, and verification evidence exist.

## Deliver

- `docs/ADR/ADR-XXXX-short-title.md`
- linked updates to architecture docs when the decision changes boundaries

## Validate

- the decision and rejected alternatives are explicit
- trade-offs are concrete, not hand-wavy
- implementation impact is clear
- a future engineer can understand why this path was chosen
- the decision preserves one repository and the same canonical slice name and convention across all applicable surfaces
- related requirements, implementation tasks, tests, and evidence are traceable
- the implementation contract is executable without rereading the conversation
- the ADR status matches the actual implementation and verification state

## Ralph Loop

Use the Ralph Loop for every task, including docs, architecture, testing, and tooling work.

1. Brainstorm first (mandatory):
   - analyze current state
   - define the problem, target outcome, constraints, and risks
   - generate options and think through trade-offs before committing
   - capture the recommended direction and open questions
2. Plan second (mandatory):
   - write a detailed execution plan from the chosen direction
   - list final validation skills to run at the end, with order and reason
3. Execute one planned step and produce a concrete delta.
4. Review the result and capture findings with actionable next fixes.
5. Apply fixes in small batches and rerun the relevant checks or review steps.
6. Update the plan after each iteration.
7. Repeat until outcomes are acceptable or only explicit exceptions remain.
8. If a dependency is missing, bootstrap it or return `status: not_applicable` with explicit reason and fallback path.

### Required Result Format

- `status`: `complete` | `clean` | `improved` | `configured` | `not_applicable` | `blocked`
- `plan`: concise plan and current iteration step
- `actions_taken`: concrete changes made
- `validation_skills`: final skills run, or skipped with reasons
- `verification`: commands, checks, or review evidence summary
- `remaining`: top unresolved items or `none`

For setup-only requests with no execution, return `status: configured` and exact next commands.

## Load References

- read `../mcaf-feature-spec/references/requirements-adr-traceability.md` first
- start with `references/adr-template.md`
- use `references/ADR-FORMATS.md` only for numbering or formatting conventions

## Example Requests

- "Write an ADR for moving to event-driven notifications."
- "Document why we are adding PostgreSQL instead of keeping SQLite."
- "Capture the policy decision behind local project AGENTS files."
