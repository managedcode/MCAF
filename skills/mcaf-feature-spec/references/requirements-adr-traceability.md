# Mandatory Feature Requirements and ADR Implementation Traceability

Policy ID: `MCAF-REQ-001`

Every non-trivial feature MUST have an executable feature specification before implementation. Every architecture-affecting feature decision MUST have an ADR whose implementation contract is traceable to that feature. A cross-cutting ADR not owned by one feature maps to an explicit operational obligation instead. Requirements or obligations, decisions, implementation tasks, tests, and final evidence must form one auditable chain.

## Feature Requirements Contract

A real document under `docs/Features/` MUST contain:

- one canonical feature/slice name and all applicable `MCAF-ARCH-001` paths
- status and owner
- in-scope and out-of-scope behaviour
- stable requirement IDs such as `REQ-001`, `REQ-002`, and `REQ-003`
- requirement type (`functional`, `data`, `contract`, `UI`, `security`, `performance`, `observability`, `migration`, or `operational`)
- rationale/source and priority for each requirement
- measurable pass and fail conditions
- stable acceptance-criteria IDs such as `AC-001`
- positive, negative, edge, and unexpected/error flows
- an explicit ADR decision: linked ADR IDs or `N/A` with a concrete reason
- a traceability matrix from `REQ-*` to `AC-*`, ADR, implementation task, automated test, and verification evidence

Requirements MUST describe observable outcomes and constraints, not implementation guesses. An implementation detail belongs in an ADR or implementation plan unless the detail is itself a required external contract.

## ADR Trigger

Create or update an ADR before implementation when the feature changes any of the following:

- solution, module, service, or vertical-slice boundaries
- public API, event, schema, persistence, or compatibility contracts
- dependency, platform, runtime, deployment topology, or infrastructure ownership
- security, privacy, identity, authorization, or trust boundaries
- cross-cutting engineering standards or an exception to an existing rule
- a migration that changes the target architecture or has rollback risk

For a non-trivial feature with no ADR trigger, record `ADR: N/A` and explain why the existing architecture and contracts are sufficient. Silence is not an ADR decision.

## ADR Implementation Contract

An ADR is not complete with only context and a decision. It MUST define how the accepted decision becomes working software:

- related `REQ-*` and `AC-*` IDs
- affected canonical slices, projects, files, contracts, data, configuration, and docs
- ordered implementation stages and their dependencies
- migration, compatibility, rollout, rollback, and cleanup steps where applicable
- implementation owners, including lead and bounded agent roles under `MCAF-AI-001`
- disjoint write scopes and explicit integration/join points for parallel work
- tests, verification commands, pass conditions, and production/rollout evidence
- status transition rules: `Accepted` means approved; `Implemented` requires the implementation and verification evidence to exist

An ADR MUST NOT be marked `Implemented` while required implementation steps, migrations, tests, documentation, or quality gates remain incomplete.

## Required Traceability

Use a table equivalent to this in the feature spec and keep it current:

| Requirement | Acceptance criteria | ADR | Implementation task | Automated test | Evidence |
| --- | --- | --- | --- | --- | --- |
| `REQ-001` | `AC-001` | `ADR-0001` or `N/A: reason` | `TASK-001` | `TST-001` | command/result/link |

Rules:

- every `REQ-*` maps to at least one `AC-*`
- every `AC-*` maps to an automated test, or to a documented exception with required manual evidence
- every architecture-affecting `REQ-*` maps to an ADR
- every ADR implementation step maps back to one or more requirements or operational obligations
- every task and test uses stable IDs so agents can receive bounded, verifiable work packets
- when a requirement changes, update its acceptance criteria, ADR impact, plan tasks, tests, and evidence before continuing implementation

## Multi-Agent Gate

For non-trivial work, the feature doc MUST contain a `MCAF-AI-001` execution contract before write-capable workers start:

- lead/planning tier and final integration owner
- one task ID per independent workstream
- role and least expensive capable model tier per task
- exact read/write ownership and allowed tools
- requirements and acceptance IDs assigned to the task
- dependencies, start condition, completion state, and join condition
- expected artifacts, verification commands, and escalation rules

Research may be delegated before final approval, but implementation may not. Worker completion reports update the traceability matrix; they do not replace lead review or integrated verification.

## Review Gate

Before a feature is marked complete, the reviewer MUST confirm:

1. all mandatory sections exist and contain real values rather than placeholders
2. every requirement and acceptance criterion is traceable
3. every required ADR exists and contains an actionable implementation contract
4. all worker results reached an explicit completion state and all required joins occurred
5. the integrated implementation satisfies requirements and all mapped verification passes
6. the feature doc and ADR status match the actual repository and rollout state
