# ADR-XXXX: Title

> TEMPLATE ONLY — copy to `docs/ADR/ADR-XXXX-title-in-kebab-case.md`, replace placeholders, remove this note, and omit optional fields only when inapplicable.

- Status: Proposed | Accepted | Implemented | Rejected | Superseded
- Date: YYYY-MM-DD
- Owner: `...`
- Approval: user decision/reference for the exact material change; pending while Proposed
- Related Features: `docs/Features/...` or `N/A: cross-cutting operational obligation ...`
- Related Requirements: `REQ-*`, `AC-*` or named operational obligations
- Supersedes / Superseded by: links, if applicable

## Context

- Current behavior and affected source:
- Problem and required outcome:
- Constraints and decision drivers:
- Scope and non-goals:

## Requirements and Decision Traceability (`MCAF-REQ-001`)

| Requirement / obligation | Acceptance criteria | Decision needed | Why this ADR is required |
| --- | --- | --- | --- |
| `REQ-001` | `AC-001` | Boundary / contract / data / security / dependency / deployment | Concrete reason |

Every decision and implementation stage maps to requirements or an explicit operational obligation.

## Decision

State the chosen approach, why it meets the requirements, and the preserved/changed contracts. A proposed record does not authorize implementation. Material architecture, serializer/serialization, contract, data, security, dependency, or deployment changes need user approval unless already authorized for this exact scope.

### Architecture placement (`MCAF-ARCH-001`)

| Canonical slice | Backend | Frontend | Contracts | Tests | Docs | Infrastructure |
| --- | --- | --- | --- | --- | --- | --- |
| `<SliceName>` | Exact path | Exact path | Exact path | Exact path | `docs/Features/<SliceName>.md` | Exact path |

All solution-owned artifacts stay in one repository with canonical slice names and conventions. Use `N/A: reason` for inapplicable surfaces. A split repository or layer-first feature owner is migration debt, not a compliant target; record affected paths, owner, target, verification, and removal date.

## Diagram

Include at least one Mermaid diagram of real boundaries, contracts, or interactions, and verify that it renders.

```mermaid
```

## Alternatives and Consequences

| Option | Benefits | Costs / risks | Reason accepted or rejected |
| --- | --- | --- | --- |
| Actual option | Concrete benefit | Concrete trade-off | Requirement/constraint |

- Positive consequences:
- Negative consequences and mitigations:
- User/business, operational, and security impact where applicable:

## Implementation Contract

Define the complete approved scope of code, tests, wiring, migration, cleanup, and docs. Do not substitute incomplete increments for delivery.

### Ordered stages

| Task | Requirement / AC | Deliverable | Slice / exact file ownership | Dependencies / start | Owner / model tier | Tests / pass condition | Join / evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `TASK-001` | `REQ-001`, `AC-001` | Working outcome | Exact paths | None / verified prerequisite | Lead / worker / reviewer | Scenario and command | Artifacts and inspected result |

### Contracts, Data, and Rollout

- Public/internal contracts and serializer/format settings to preserve or change:
- Schema/configuration changes, defaults, and secret ownership:
- Migration order, compatibility window, cleanup, and removal:
- Rollout, failure signal, rollback, and required production evidence:
- Feature, architecture, testing, operations, and governance docs to update:

### Multi-Agent Integration (`MCAF-AI-001`)

- Planning/final integration owner and model tier:
- Read-only research/review scopes:
- Disjoint implementation scopes and one owner for shared files/contracts:
- Native status/wait mechanism and dependencies:
- Completion states: `complete`, `blocked`, `failed`, `cancelled`:
- Join and escalation conditions:

The lead waits for required results, inspects every diff and evidence packet, and verifies the combined repository. Idle state, plans, and unverified worker claims are not completion.

## Verification

Review the complete code and tests, fix in-scope findings, and format before one planned verification phase. A separate baseline/red-phase run or repeated check needs a concrete purpose or explicit requirement.

- Real environment/dependencies, fixtures, isolation, and reset:
- Success, rejection, failure, edge, and migration/rollback scenarios:
- Observable invariants and required/forbidden side effects:
- Coverage baseline and active `AGENTS.md` thresholds:
- Exact repo build/test/format/analyze/coverage and extra-gate commands:
- Manual evidence or approved test exceptions:
- Monitoring and rollout evidence where applicable:

| Test | Requirement / AC | Scenario / level | Meaningful assertion | Command / result / evidence |
| --- | --- | --- | --- | --- |
| `TST-001` | `REQ-001`, `AC-001` | Real flow | Observable outcome / rejected effect | Pending or observed result |

## Completion Checklist

- [ ] Decision approval, alternatives, consequences, and a rendered diagram are recorded.
- [ ] `MCAF-ARCH-001`: one repository and canonical slices; no expanded architecture deviation.
- [ ] `MCAF-REQ-001`: requirements/obligations, stages, tests, and evidence are traceable.
- [ ] `MCAF-AI-001`: ownership, required completions, joins, lead review, and integrated checks are satisfied.
- [ ] Required code, migrations, tests, cleanup, docs, and rollout evidence exist; required gates pass and coverage does not regress without an approved exception.
- [ ] Status matches evidence; `Implemented` is not used while required delivery work remains.

## References

Link real feature docs, architecture, source, tests, issues, related ADRs, and authoritative external specifications.
