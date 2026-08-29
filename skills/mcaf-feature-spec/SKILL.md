---
name: mcaf-feature-spec
description: "Create or update a feature spec under `docs/Features/` with business rules, user flows, system behaviour, verification, and Definition of Done. Use when the user asks for a feature spec, executable requirements, acceptance criteria, behaviour documentation, or a pre-implementation plan for non-trivial behaviour changes."
metadata:
  compatibility: "Requires repository write access; produces Markdown docs with Mermaid diagrams and executable verification steps."
---

# MCAF: Feature Spec

## Trigger On

- add or change non-trivial behaviour
- behaviour is under-specified and engineers are guessing
- tests need a stable behavioural source of truth

## Value

- produce a concrete project delta: code, docs, config, tests, CI, or review artifact
- reduce ambiguity through explicit planning, verification, and final validation skills
- leave reusable project context so future tasks are faster and safer

## Do Not Use For

- architecture decisions that need alternatives and trade-offs
- tiny typo or cosmetic-only changes with no behavioural impact

## Inputs

- `docs/Architecture.md`
- the nearest `AGENTS.md`
- current user flows, business rules, and acceptance expectations
- the `MCAF-ARCH-001` canonical slice name and in-repository backend/frontend/contracts/tests/docs paths
- the `MCAF-REQ-001` requirement, acceptance, ADR, task, test, and evidence traceability contract

## Quick Start

1. Read the nearest `AGENTS.md` and confirm scope and constraints.
2. Run this skill's `Workflow` through the `Ralph Loop` until outcomes are acceptable.
3. Return the `Required Result Format` with concrete artifacts and verification evidence.

## Workflow

1. Define scope first: in scope, out of scope, boundaries touched.
2. Confirm `MCAF-ARCH-001`: choose one canonical slice name and map every applicable backend, frontend, contract, test, infrastructure, and documentation path inside this repository. Mark a non-applicable surface `N/A` with a reason.
3. Read `references/requirements-adr-traceability.md` and apply `MCAF-REQ-001` before implementation.
4. If the feature doc is missing, scaffold from `references/feature-template.md`.
5. Keep the spec executable:
   - stable `REQ-*` requirements with type, priority, rationale, pass, and fail conditions
   - stable `AC-*` acceptance criteria mapped to requirements
   - an explicit ADR link or `N/A` with a concrete reason
   - main flow
   - edge and failure flows
   - system behaviour
   - verification steps
   - Definition of Done
6. For non-trivial implementation, define the `MCAF-AI-001` task graph: role/model tier, exact read/write ownership, requirements, dependencies, artifacts, verification, completion state, and join condition.
7. Maintain the traceability matrix from every `REQ-*` through `AC-*`, ADR, `TASK-*`, automated test, and evidence.
8. Make the spec concrete enough that tests and worker instruction packets can be written without guessing.
9. Create or update an ADR before implementation when boundaries, public contracts, data, dependencies, security, deployment, or cross-cutting standards change.

## Deliver

- `docs/Features/feature-name.md`
- a feature spec that engineers and agents can implement directly

## Validate

- rules are testable, not aspirational
- edge cases are captured where they matter
- verification steps match the intended behaviour
- the doc can drive implementation without hidden tribal knowledge
- the feature stays within one repository-wide slice and uses the same canonical name and structure across all applicable surfaces
- every requirement is traceable to acceptance criteria, ADR decision, implementation task, test, and evidence
- every required ADR contains an implementation contract and its status matches reality
- non-trivial multi-agent work records model tiers, disjoint ownership, dependencies, completion states, waiting, and final lead review

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

- read `references/requirements-adr-traceability.md` first for every non-trivial feature
- use `references/feature-template.md` for scaffolding

## Example Requests

- "Write a feature spec for the new checkout retry flow."
- "Document the behaviour before coding this API change."
- "Turn this loose requirement into an executable feature doc."
