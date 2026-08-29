# ADR-XXXX: Title

> TEMPLATE ONLY — remove this note and replace all placeholder text before saving as a real ADR under `docs/ADR/`.

Status: Proposed | Accepted | Implemented | Rejected | Superseded  
Date: YYYY-MM-DD  
Related Features: `docs/Features/...` (required for feature-driven decisions)
Related Requirements: `REQ-...`, `AC-...` from `docs/Features/...`, or `N/A: cross-cutting obligation ...`
Supersedes: `docs/ADR/ADR-....md` (delete if none)  
Superseded by: `docs/ADR/ADR-....md` (delete if none)

Rules:

- This ADR is **self-contained** — avoid “as discussed”; include all critical context and links.
- At least **one Mermaid diagram is mandatory** (boundaries/modules/interactions for this decision).
- `MCAF-ARCH-001` remains mandatory: an ADR MUST NOT redefine a split repository, layer-first feature ownership, or inconsistent slice naming as compliant. It may document only a time-bounded migration deviation with an owner and removal date.
- `MCAF-REQ-001` remains mandatory: this ADR MUST map the decision and every implementation stage to stable feature `REQ-*` and `AC-*` IDs, or to an explicit cross-cutting operational obligation. `Implemented` is valid only after the implementation and verification evidence exist.
- Once accepted, save as `docs/ADR/ADR-XXXX-title-in-kebab-case.md` (English, kebab-case). Keep this reference file unchanged and copy its structure into the real ADR.

---

## Implementation plan (step-by-step)

> TEMPLATE ONLY — replace these checkboxes with real implementation steps for this ADR and keep them updated while implementing.

- [ ] Analyze current state (facts)
- [ ] Map the decision to feature `REQ-*` and `AC-*` IDs
- [ ] Plan the change (ordered stages, files/modules, dependencies, integration points, tests, docs)
- [ ] Define `MCAF-AI-001` lead/worker/reviewer roles, disjoint write scopes, completion evidence, and join gates
- [ ] Implement the change (smallest safe increments)
- [ ] Add/update automated tests (happy + negative + edge; protect invariants)
- [ ] Run verification commands (build/test/format/analyze/coverage) and record results
- [ ] Update docs (ADR/Features/Architecture overview) and close the checklist

---

## Context

- Current situation (what exists today).
- Constraints (tech/legal/time/org constraints that matter).
- Problem statement (what is failing / what you must enable).
- Goals (what success looks like).
- Non-goals (what this ADR is not trying to solve).

---

## Requirements and Decision Traceability (`MCAF-REQ-001`)

| Requirement | Acceptance criteria | Decision obligation | Why this ADR is required |
| --- | --- | --- | --- |
| `REQ-001` | `AC-001` | Boundary, contract, data, security, dependency, deployment, or standard decision | Concrete reason |

Every decision point and implementation stage MUST map back to a requirement or an explicit operational obligation.

---

## Stakeholders (who needs this to be clear)

| Role | What they need to know | Questions this ADR must answer |
| --- | --- | --- |
| Product / Owner | User/business impact, scope, rollout risk | What changes for users? What’s out of scope? |
| Engineering | Boundaries/modules, data/contract changes, edge cases | What do we change, where, and why? |
| DevOps / SRE | Deployability, config, monitoring, rollback | How do we ship safely and observe it? |
| QA | Test scenarios + environment assumptions | What must be proven by automated tests? |

---

## Decision

- One sentence decision statement.

Key points:

- Key point 1
- Key point 2

### Mandatory architecture guardrail (`MCAF-ARCH-001`)

- Canonical slice name(s):
- Backend path(s) in this repository:
- Frontend path(s) in this repository:
- Contract path(s) in this repository:
- Test path(s) in this repository:
- Documentation path(s) in this repository:
- Confirmation that this decision does not split solution-owned artifacts across repositories or introduce layer-first feature ownership:
- Existing migration deviation, owner, target layout, verification, and removal date (delete if none):

---

## Diagram

This section is mandatory.

> TEMPLATE ONLY — Mermaid often breaks with fancy syntax. Keep it simple and make sure it renders in the repo.

```mermaid
```

---

## Alternatives considered

### Option A

- Pros:  
- Cons:  
- Rejected because:

### Option B

- Pros:  
- Cons:  
- Rejected because:

---

## Consequences

### Positive

- Benefit

### Negative / risks

- Risk  
- Mitigation:

---

## Impact

### Code

- Affected modules / services:  
- New boundaries / responsibilities:  
- Feature flags / toggles (names, defaults, removal plan):

### Data / configuration

- Data model / schema changes:  
- Config changes (keys, defaults, secrets handling):  
- Backwards compatibility strategy:

### Documentation

- Feature docs to update:  
- Testing docs to update:  
- Architecture docs to update:  
- `docs/Architecture.md` updates (what must change):  
- Notes for `AGENTS.md` (new rules/patterns):

---

## Implementation Contract

This section is mandatory. An ADR without an actionable implementation contract remains `Proposed` or `Accepted`, never `Implemented`.

### Ordered stages

| Task ID | Requirement and AC IDs | Stage / deliverable | Canonical slice and exact ownership | Dependencies / start condition | Owner / model tier | Tests and pass condition | Join / completion evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `TASK-001` | `REQ-001`, `AC-001` | Smallest safe implementation stage | `<SliceName>` and exact paths | None / `TASK-... complete` | Lead / least expensive capable worker / reviewer | Test IDs and exact command | Changed artifacts, result, and evidence inspected |

### Contracts and migration

- Public/internal contracts to add, change, or preserve:
- Data/configuration migration order:
- Compatibility window and removal step:
- Rollout and rollback checkpoints:
- Documentation and architecture-map updates:

### Multi-agent integration (`MCAF-AI-001`)

- Planning and final integration owner:
- Read-only research/review workstreams:
- Disjoint write-capable workstreams:
- Shared files/contracts with a single integration owner:
- Native status/wait mechanism:
- Conditions that block dependent tasks:
- Final join condition before integrated verification:
- Escalation path for ambiguity, failed verification, scope expansion, or worker drift:

The lead MUST wait for every required dependency, inspect each task's explicit `complete`, `blocked`, `failed`, or `cancelled` state, and verify the combined repository state. A worker's plan, idle state, or unverified summary is not completion.

---

## Verification

This section is mandatory: describe how to prove the decision (tests + commands).

### Objectives

- What behaviour / qualities must be proven.
- Which invariants from this ADR must be encoded as tests (happy path + negative/forbidden + edge cases).
- Link each objective/scenario to the specific automated test(s) that prove it.

### Test environment

- Environment (local compose / staging / prod-like):  
- Data and reset strategy (seed data, migrations, rollback plan):  
- External dependencies (real / sandbox / test environment required):

### Testing methodology

- Core flows and invariants that MUST be proven:  
- Positive flows that MUST pass:  
- Negative / forbidden flows that MUST be rejected or fail safely:  
- Edge / boundary / unexpected flows that MUST be covered:  
- Required realism level (real dependencies, contracts, environments):  
- Coverage baseline requirement (must stay at least at the pre-change level or improve):  
- Pass criteria for considering the ADR implementation complete (all relevant tests green, new tests added, verification complete):

### Test commands

- build: (paste from `AGENTS.md`)
- test: (paste from `AGENTS.md`)
- format: (paste from `AGENTS.md`)
- coverage: (paste from `AGENTS.md`; delete if none)

### New or changed tests

| ID | Scenario | Level (Unit / Int / API / UI) | Expected result | Notes / Data |
| --- | --- | --- | --- | --- |
| TST-001 | Happy path / negative / edge | Integration | Observable outcome | Fixtures / seed data |

### Regression and analysis

- Regression suites to run (must stay green):  
- Static analysis (tools/configs that must pass):  
- Monitoring during rollout (logs/metrics/alerts to watch):
- Coverage comparison against baseline:

---

## Rollout and migration

- Migration steps:  
- Backwards compatibility:  
- Rollback:

---

## References

- Issues / tickets:  
- External docs / specs:  
- Related ADRs:

---

## Filing checklist

- [ ] `MCAF-ARCH-001` remains satisfied: one repository, one canonical name and convention per vertical slice, and no layer-first feature owner.
- [ ] `MCAF-REQ-001` remains satisfied: related `REQ-*` and `AC-*` IDs, ordered implementation tasks, tests, and evidence are traceable.
- [ ] The mandatory Implementation Contract defines exact ownership, dependencies, migration/rollout, verification, and join conditions.
- [ ] `MCAF-AI-001` is satisfied for non-trivial implementation: model tiers, disjoint write scopes, explicit completion states, waiting, lead review, and integrated verification are recorded.
- [ ] Status is `Implemented` only when every required implementation step and verification item is complete.
- [ ] File saved under `docs/ADR/ADR-XXXX-title-in-kebab-case.md` (not in `docs/templates/`).
- [ ] Status reflects real state (`Proposed`, `Accepted`, `Rejected`, `Superseded`).
- [ ] Links to related features, tests, and ADRs are filled in.
- [ ] Diagram section contains at least one Mermaid diagram.
- [ ] Testing methodology is filled in with positive, negative, and edge flows plus pass criteria.
- [ ] New or updated automated tests exist for the changed behaviour.
- [ ] All relevant tests are green and coverage did not fall below baseline.
- [ ] `docs/Architecture.md` updated if module boundaries or interactions changed.
