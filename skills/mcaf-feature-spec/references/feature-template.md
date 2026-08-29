# Feature: FeatureName

> TEMPLATE ONLY — remove this note and replace all placeholder text before saving as a real feature doc under `docs/Features/`.

Status: Draft | Approved | Implementing | Verified
Owner: `...`
Links:  
Architecture: `docs/Architecture.md`  
Modules:  
ADRs: `docs/ADR/...` or `N/A: existing architecture and contracts are sufficient because ...`

---

## Vertical Slice Placement (`MCAF-ARCH-001`)

This feature MUST remain inside the solution repository and use one canonical slice name across every applicable surface. Use `N/A` with a reason where a surface does not apply.

- Canonical slice name: `<SliceName>`
- Backend: `.../Features/<SliceName>/` or `N/A` because `...`
- Frontend: `.../Features/<SliceName>/` or `N/A` because `...`
- Contracts: `.../Features/<SliceName>/` or `N/A` because `...`
- Tests: `.../Features/<SliceName>/` or `N/A` because `...`
- Documentation: `docs/Features/<SliceName>.md`
- Infrastructure / deployment assets owned by this slice: `...` or `N/A` because `...`

All paths MUST be in this repository, all applicable roots MUST reuse `<SliceName>`, and feature behaviour MUST NOT be owned by repository-level technical-layer folders.

---

## Implementation plan (step-by-step)

> TEMPLATE ONLY — replace these checkboxes with real implementation steps for this feature and keep them updated while implementing.

- [ ] Analyze current behaviour (facts)
- [ ] Confirm the repository boundary, canonical slice name, and all applicable backend/frontend/contracts/tests/docs paths
- [ ] Finalize `REQ-*`, `AC-*`, rules, flows, diagram, ADR decision, and traceability
- [ ] Create or update every required ADR and approve its implementation contract
- [ ] Define the `MCAF-AI-001` task graph, model tiers, ownership, dependencies, completion evidence, and join gates
- [ ] Implement the feature (smallest safe increments)
- [ ] Add/update automated tests for each scenario (happy + negative + edge)
- [ ] Run verification commands (build/test/format/analyze/coverage) and record results
- [ ] Update docs (Feature/ADRs/Architecture overview) and close the checklist

---

## Purpose

Short description of the business problem and value.

---

## Stakeholders (who needs this to be clear)

| Role | What they need from this spec |
| --- | --- |
| Product / Owner | Scope, acceptance criteria, user-visible behaviour |
| Engineering | Modules, contracts, data, error handling, edge cases |
| DevOps / SRE | Config, rollout plan, monitoring/alerts, rollback |
| QA | Executable test flows (positive/negative/edge) + environment |

---

## Scope

### In scope

- Item

### Out of scope

- Item

---

## Business Rules

- Rule 1
- Rule 2
- Rule 3

---

## Requirements (`MCAF-REQ-001`)

Every real requirement needs a stable ID, observable pass/fail conditions, and acceptance mapping. Do not put placeholders or implementation guesses here.

| ID | Type | Requirement | Priority | Source / rationale | Pass condition | Fail condition | Acceptance IDs |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `REQ-001` | Functional | Observable outcome or invariant | Must | User / business / contract reason | Measurable success | Measurable rejection or failure | `AC-001` |

### Architecture decision

- ADR required: Yes / No
- ADR links: `docs/ADR/ADR-....md`
- If no ADR is required, explain why no boundary, public contract, data, dependency, security, deployment, or cross-cutting standard changes:

---

## Acceptance Criteria

| ID | Requirement IDs | Given | When | Then | Automated proof |
| --- | --- | --- | --- | --- | --- |
| `AC-001` | `REQ-001` | Preconditions | Action | Observable result | `TST-001` |

Every `REQ-*` MUST map to at least one `AC-*`. Every `AC-*` MUST map to an automated test or a documented exception with required manual evidence.

---

## User Flows

### Primary flows

1. Flow name  
   - Actor: User / Service  
   - Trigger:  
   - Steps:  
   - Result:  

### Edge cases

- Edge case → Expected behaviour

---

## System Behaviour

- Entry points: API endpoints / UI / events / scheduled jobs  
- Reads from: DB / service / cache  
- Writes to: DB / service / queue  
- Side effects / emitted events:  
- Idempotency: Yes/No + conditions  
- Error handling: rules + user-facing messages  
- Security / permissions: AuthZ rules  
- Feature flags / toggles: names + defaults  
- Performance / SLAs:  
- Observability: logs/metrics/traces that must exist  

---

## Multi-Agent Execution Contract (`MCAF-AI-001`)

This section is mandatory for non-trivial implementation. Use `N/A` with a concrete reason only when the feature is simple enough that orchestration overhead exceeds the work.

- Planning / integration owner and model tier:
- Final independent review owner and model tier:
- Reason multi-agent execution is applicable, or `N/A` reason:

| Task ID | Role | Model tier / effort | Requirement and AC IDs | Read/write ownership | Dependencies / start condition | Expected artifacts and verification | Join condition |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `TASK-001` | Explorer / worker / reviewer | Highest-capability planning / least expensive capable worker | `REQ-001`, `AC-001` | Read-only or exact paths | None / `TASK-... complete` | Files, tests, exact command and pass condition | Explicit result and evidence received |

Rules:

- write-capable tasks MUST have disjoint ownership
- research may start before approval only in read-only mode
- implementation tasks remain blocked until requirements, required ADRs, and their prerequisites are approved
- the lead MUST monitor native task status, wait for every required result, inspect failures/blockers, and join only verified outputs
- `idle`, partial output, or a worker claim without artifacts and evidence is not complete

---

## Diagrams

At least one Mermaid diagram is mandatory in every real feature doc.

> TEMPLATE ONLY — Mermaid often breaks with fancy syntax. Keep it simple and make sure it renders in the repo.

```mermaid
```

---

## Verification

This section is mandatory: describe how to test (scenarios + commands).

### Test environment

- Environment / stack (local compose / staging / cloud env):  
- Data and reset strategy (seed data, fixtures, migration steps):  
- External dependencies (real / sandbox / test environment required):  

### Testing methodology

- Main flows that MUST be proven end-to-end:  
- Positive flows that MUST pass:  
- Negative flows that MUST fail safely and predictably:  
- Edge / boundary / unexpected flows that MUST be covered:  
- Test realism requirements (real dependencies, contracts, environments):  
- Coverage baseline requirement (must stay at least at the pre-change level or improve):  
- Pass criteria for considering the task done (all relevant tests green, new tests added, verification complete):  

### Test commands

- build: (paste from `AGENTS.md`)
- test: (paste from `AGENTS.md`)
- format: (paste from `AGENTS.md`)
- coverage: (paste from `AGENTS.md`; delete if none)

### Test flows

**Positive scenarios**

| ID | Description | Level (Unit / Int / API / UI) | Expected result | Data / Notes |
| --- | --- | --- | --- | --- |
| POS-001 | Happy path | Integration | Outcome observed via public interface | Data / fixtures |

**Negative scenarios**

| ID | Description | Level (Unit / Int / API / UI) | Expected result | Data / Notes |
| --- | --- | --- | --- | --- |
| NEG-001 | Validation failure | API | Error response / code | Invalid input example |

**Edge cases**

| ID | Description | Level (Unit / Int / API / UI) | Expected result | Data / Notes |
| --- | --- | --- | --- | --- |
| EDGE-001 | Boundary condition | Integration | Expected behaviour at boundary | Data / timing notes |

### Test mapping

- Integration tests:  
- API tests:  
- UI / E2E tests:  
- Unit tests:  
- Static analysis:  
- Coverage comparison against baseline:  

### Non-functional checks

Include this section only if it applies to this feature; otherwise remove it.

- Performance / load (tool, threshold, command):  
- Security / privacy (threats to verify):  
- Observability (log/metric assertions):  

---

## Requirements-to-Implementation Traceability (`MCAF-REQ-001`)

| Requirement | Acceptance criteria | ADR | Implementation task | Automated test | Verification evidence |
| --- | --- | --- | --- | --- | --- |
| `REQ-001` | `AC-001` | `ADR-0001` or `N/A: reason` | `TASK-001` | `TST-001` | command/result/link |

Every requirement, decision, task, test, and final result MUST be traceable here before the feature status becomes `Verified`.

---

## Definition of Done

- `MCAF-ARCH-001` is satisfied: all solution-owned artifacts remain in one repository and all applicable surfaces use the same canonical slice name and convention.
- `MCAF-REQ-001` is satisfied: every `REQ-*` maps through `AC-*`, ADR decision, implementation task, automated test or explicit exception, and verification evidence.
- Every required ADR exists, has an implementation contract, and uses a status that matches reality; `Implemented` is used only after its implementation and verification are complete.
- `MCAF-AI-001` is satisfied for non-trivial work: write scopes were disjoint, required agents reached explicit completion states, all join conditions were met, and the planning model reviewed the integrated result.
- Behaviour matches rules and flows in this document.  
- Diagram section contains at least one Mermaid diagram that renders in the repo.  
- All test flows above are covered by automated tests (Integration / API / UI as applicable).  
- Testing methodology is written down and matches the implemented tests.  
- New or updated automated tests were added for the changed behaviour.  
- Positive, negative, and edge flows are all covered where applicable.  
- Static analysis passes with no new unresolved issues.  
- Test and build commands listed above run clean in local and CI environments, and all relevant tests are green.  
- Coverage is at least at the pre-change baseline or better.  
- Documentation updated: this feature doc, related ADRs, Testing / API / Architecture docs, `AGENTS.md` if rules or patterns changed.  
- Feature flags / migrations rolled out or cleaned up.

---

## References

- Requirements policy: `skills/mcaf-feature-spec/references/requirements-adr-traceability.md`
- ADRs: `docs/ADR/...`  
- API: `docs/API/...`  
- Architecture: `docs/Architecture.md`  
- Testing: `docs/Testing/...`  
- Code: modules / namespaces  
