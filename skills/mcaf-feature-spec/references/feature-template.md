# Feature: FeatureName

> TEMPLATE ONLY — copy to `docs/Features/<SliceName>.md`, replace placeholders, remove this note, and omit optional fields only when inapplicable.

- Status: Draft | Approved | Implementing | Verified
- Owner: `...`
- Architecture: `docs/Architecture.md`
- ADRs: actual links or `N/A: existing architecture and contracts suffice because ...`

## Purpose and Scope

- Business/user outcome:
- In scope, including every required behavior variant:
- Out of scope:
- Actors, entry points, permissions, and affected boundaries:
- Assumptions and open decisions:

## Vertical Slice Placement (`MCAF-ARCH-001`)

| Canonical slice | Backend | Frontend | Contracts | Tests | Docs | Infrastructure |
| --- | --- | --- | --- | --- | --- | --- |
| `<SliceName>` | Exact path | Exact path | Exact path | Exact path | `docs/Features/<SliceName>.md` | Exact path |

All solution-owned paths remain in one repository and use the same canonical slice name and convention. Record `N/A: reason` for inapplicable surfaces; feature behavior must not be owned by repository-level layer folders.

## Requirements (`MCAF-REQ-001`)

Requirements describe observable behavior or required contracts, not implementation guesses.

| ID | Type | Requirement | Priority | Source / rationale | Pass condition | Fail condition | Acceptance |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `REQ-001` | Functional / data / contract / UI / security / performance / observability / migration / operational | Outcome or invariant | Must | Reason | Measurable result | Measurable failure | `AC-001` |

### Architecture Decision and Approval

- Required ADR links, or why no ADR trigger applies:
- Material architecture, serializer/serialization, contract, data, security, dependency, or deployment changes:
- User approval for each such decision, or already-authorized scope:
- Migration, compatibility, rollout, and rollback expectations:

No implementation of a protected decision begins while its approval is pending.

## Acceptance and Flows

| ID | Requirements | Given | When | Then | Test / manual exception |
| --- | --- | --- | --- | --- | --- |
| `AC-001` | `REQ-001` | Real starting state | User/system action | Observable result | `TST-001` |

Every requirement maps to acceptance and every acceptance maps to automated proof or an explicit exception with required manual evidence.

- Primary success flows:
- Rejection/permission/validation flows:
- Dependency failure and recovery:
- Edge, boundary, and unexpected paths:
- Required business invariants:

## System Behavior

- Entry points and contracts:
- Reads, writes, state ownership, and consistency:
- Side effects/events and required or forbidden effects:
- Idempotency, retries, concurrency, and cancellation where relevant:
- User-facing error behavior:
- Data/serialization, security, performance, and observability constraints:
- Configuration/flags with defaults and cleanup:

## Diagram

Include at least one rendered Mermaid diagram of the actual main flow.

```mermaid
```

## Implementation Plan

Replace with ordered tasks for the complete approved scope.

- [ ] Inspect implementation, callers, contracts, tests, docs, and every affected flow.
- [ ] Finalize requirements, acceptance, approval, required ADR implementation contracts, and ownership.
- [ ] Implement all required code, tests, wiring, data/configuration, and docs.
- [ ] Self-review complete code and tests; fix in-scope defects and weak assertions.
- [ ] Format, run the planned required verification, and record evidence.
- [ ] Complete migration/rollout/cleanup where required and update status.

## Multi-Agent Execution Contract (`MCAF-AI-001`)

For non-trivial work, record the lead/integration and independent review roles. A documented routing/capability/risk exception must explain why delegation is unavailable or unsafe.

| Task | Role / model tier | Requirement / AC | Read/write ownership | Dependencies / start | Artifact / verification | Completion state / join |
| --- | --- | --- | --- | --- | --- | --- |
| `TASK-001` | Lead / explorer / worker / reviewer | `REQ-001`, `AC-001` | Read-only or exact paths | Approved/verified prerequisites | Files, tests, command, pass condition | Explicit state and evidence |

Write scopes are disjoint; shared files have one integration owner. Research before approval stays read-only. The lead monitors native status, waits for required results, inspects diffs and evidence, and verifies the combined repo. Idle/partial/unverified output is not completion.

## Verification

Plan one phase after complete implementation, code/test self-review, fixes, and formatting. Every check confirms a requirement or answers a specific risk; separate baseline/red-phase runs and reruns require a concrete purpose or explicit requirement. Preserve all required repo gates.

- Real environment/dependencies and representative fixtures:
- Data reset, isolation, cleanup, and deterministic timing:
- Positive, negative, failure, edge, and applicable non-functional scenarios:
- Tests capable of detecting the original defect or incorrect behavior:
- Coverage baseline and active repository thresholds:
- Exact `AGENTS.md` commands for build, test, format checks, analysis, coverage, and configured extra gates:
- Exceptions without automated proof and required manual evidence:

| Test | Acceptance | Scenario / level | Meaningful expected result | Fixture | Command / evidence |
| --- | --- | --- | --- | --- | --- |
| `TST-001` | `AC-001` | Integration/API/UI or isolated logic | Observable result / forbidden effect | Real data | Pending or observed result |

## Requirements-to-Implementation Traceability (`MCAF-REQ-001`)

| Requirement | Acceptance | ADR | Task | Automated test / exception | Evidence |
| --- | --- | --- | --- | --- | --- |
| `REQ-001` | `AC-001` | Actual ADR or `N/A: reason` | `TASK-001` | `TST-001` | Command/result/link |

Update the chain when a requirement changes. A required ADR has an executable implementation contract and a status matching reality.

## Definition of Done

- [ ] All accepted variants and integrations work end to end; no in-scope stubs, TODOs, or deferred wiring remain.
- [ ] `MCAF-ARCH-001`, `MCAF-REQ-001`, and applicable `MCAF-AI-001` requirements are satisfied.
- [ ] Required decisions have user approval and ADR implementation contracts.
- [ ] Complete code and tests were reviewed, fixed, and formatted before required verification.
- [ ] Meaningful positive/negative/edge proof, required gates, non-regressing coverage or approved exception, and rendered diagram evidence exist.
- [ ] Feature, ADR, architecture, testing, operations, and governance docs match the delivered state.
- [ ] Required migrations, rollout, and cleanup are complete; `Verified`/`Implemented` statuses match the evidence.

## References

Link actual source, tests, architecture, ADRs, requirements policy, and operation/testing docs.
