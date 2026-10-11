# Mandatory Model-Tier Orchestration

Policy ID: `MCAF-AI-001`

For non-trivial software work, MCAF separates high-cost reasoning from bounded implementation. The strongest suitable large or high-capability model available owns planning and integration; routine coding work is delegated to the least expensive model that is still capable of completing the scoped task correctly.

This policy governs Codex, Claude Code, and any other agent runtime. Platform features change; the invariant is a requirements-led lead/worker/reviewer protocol with explicit ownership, dependencies, completion evidence, and a final join gate.

## Entry Gate

No implementation agent may start a non-trivial feature until all of the following exist:

- an approved feature spec satisfying `MCAF-REQ-001`, with stable `REQ-*` and `AC-*` IDs
- a current architecture map and canonical `MCAF-ARCH-001` slice paths
- an accepted ADR when architecture, boundaries, public contracts, data, security posture, deployment topology, dependencies, or cross-cutting standards change
- an ordered implementation plan that maps tasks to requirements, acceptance criteria, ADR decisions, owners, dependencies, tests, and pass conditions

Research-only agents may run before this gate, but they MUST remain read-only and return evidence to the planning model. Platform-native plan approval is not a substitute for the planning model checking the plan against the feature requirements and ADR.

Obtain user approval before a material architecture, serializer/serialization, contract, data, security, dependency, or deployment decision is implemented. Existing task or standing authorization covers its exact scope; routine work within that scope does not need renewed approval.

## Mandatory Responsibilities

### Planning model

The lead planning model MUST own:

- repository and architecture discovery
- problem framing, assumptions, scope, and risk analysis
- brainstorm and option evaluation
- acceptance criteria and test strategy
- architecture, boundary, contract, security, data, and migration decisions
- the ordered implementation plan and task decomposition
- worker instruction packets and ownership boundaries
- review of every delegated result
- integration, conflict resolution, final verification, and completion reporting

Use the highest-capability model available for this role when the task is large, non-trivial, cross-module, architecture-sensitive, security-sensitive, or implementation-heavy.

### Coding models

After the plan and boundaries are explicit, the lead MUST spawn cost-efficient coding workers for independent, bounded implementation scopes whenever the runtime exposes a suitable cheaper model.

Choose the least expensive available model that can reliably satisfy the task's language, framework, context, tool, and risk requirements. "Cheaper" MUST NOT mean incapable, unverified, or permitted to lower quality.

Suitable delegated scopes include:

- implementing a named slice or plan step with fixed contracts
- adding tests from defined acceptance criteria
- mechanical refactors with explicit invariants
- updating bounded documentation or configuration owned by the same change
- running focused verification and returning evidence

### Research and review models

Use a cost-efficient read-only model for bounded discovery, documentation lookup, code mapping, logs, and test-output analysis when it can do the work reliably. Use a stronger model or higher reasoning effort for ambiguous architecture analysis, security review, cross-boundary correctness, competing hypotheses, or final review.

Review MUST be independent of implementation: the coding worker's self-report is evidence to inspect, not approval of its own work.

## Multi-Agent Run Protocol

The planning model MUST execute this lifecycle for non-trivial parallel work:

1. **Classify** — decide whether the work is independently parallelizable. Keep sequential, tightly coupled, or same-file work with one owner.
2. **Specify** — finish the feature requirements and required ADR before write-capable workers start.
3. **Decompose** — create a task graph with one clear deliverable per task, explicit dependencies, and disjoint write ownership.
4. **Route** — assign the least expensive capable model and the minimum required tools/permissions to each task. Discovery and review default to read-only.
5. **Spawn** — give every worker the complete instruction packet below. Do not ask several agents to solve the same implementation scope unless competing proposals are the explicit deliverable.
6. **Monitor** — use the runtime's native agent-status, messaging, and wait controls. Inspect agents that need input, fail, stop early, drift, or remain stuck; steer, retry, replace, or escalate them explicitly.
7. **Wait and join** — wait for every required dependency and worker result before integration. Do not treat `idle`, partial output, a plan, or a worker claim as `complete`.
8. **Review and integrate** — inspect each result and diff, map evidence back to `REQ-*` and `AC-*`, resolve conflicts, and run integrated quality gates.
9. **Close** — report the completed/blocked status of every task, the model tier used, changed artifacts, requirement/test evidence, deviations, and remaining risks.

Busy polling is not verification. Prefer event-driven completion notifications or bounded native wait calls, then inspect the resulting status and evidence. A timeout means “still running or needs inspection,” not “passed.”

## Task Graph and Ownership

Parallel work is permitted only when ownership is safe and the result can be joined deterministically:

- each write-capable worker owns a disjoint file, module, project, or vertical-slice scope
- shared contracts, solution files, central configuration, migrations, and cross-cutting docs have one integration owner
- dependent tasks remain blocked until their prerequisites are verified
- the lead does not begin duplicate implementation while a worker owns that scope
- research or review agents may inspect overlapping files because they are read-only
- if two planned tasks must edit the same file, serialize them or assign the file to one owner

The number of agents is derived from independent workstreams, not from an arbitrary target. More agents increase token cost, coordination overhead, and conflict risk.

## Required Worker Instruction Packet

Every coding worker MUST receive:

- the task goal and applicable acceptance-criteria IDs
- exact file, project, module, or slice ownership
- the approved architecture and contracts it must preserve
- implementation constraints and forbidden changes
- expected production and test artifacts
- exact verification commands and pass conditions
- an instruction to stop and escalate on ambiguity or required scope expansion

The packet MUST also identify:

- worker role and selected model tier/reasoning level
- read-only or write-capable mode and allowed tools
- prerequisite task IDs and the condition that unblocks the task
- expected completion report: changed files, requirement/acceptance IDs, tests run, results, assumptions, and blockers
- join condition describing what the lead must receive before the dependent work can continue

A worker MUST NOT invent architecture, change public contracts, weaken tests or rules, expand into another worker's scope, or silently resolve a planning ambiguity.

## Completion State Contract

Every delegated task MUST finish in exactly one explicit state:

- `complete` — required artifacts exist and stated verification passed
- `blocked` — the exact missing input, permission, dependency, or decision is named
- `failed` — attempted work or verification failed, with reproducible evidence
- `cancelled` — the lead intentionally stopped obsolete or unsafe work

`idle`, “looks done,” a prose summary without required artifacts, and an unverified diff are not completion states. A blocked or failed task must not silently unblock dependants.

## Lead Review Gate

Delegation never transfers accountability. Before accepting worker output, the planning model MUST:

1. inspect the complete diff and verification evidence
2. compare the result with the plan and acceptance criteria
3. reject unplanned architecture, contract, scope, or quality changes
4. resolve integration conflicts and cross-slice implications
5. run or confirm the required focused and broader quality gates
6. keep the plan current and report which model tier owned planning and implementation

The lead MUST wait for all required workers before finalizing. It MUST verify the integrated repository state itself; passing worker-local checks do not prove that combined changes build, test, or satisfy the feature.

Every worker and lead inspects the complete affected flow, finishes the approved scope, reviews code and tests, fixes findings, and formats before its planned verification. Coordinate shared build/test writers rather than launching competing or redundant runs. Rerun affected checks only for a new change, concrete failure, or unresolved question, and fix the complete cause first.

## Platform Adapters

Inspect the actual runtime's available models, roles, permissions, and native spawn/status/message/wait controls before configuring delegation. Product names and commands are refreshable configuration, not framework policy.

### Codex

Use the exposed read-only and implementation roles, supported per-agent model routing, and native status/wait tools. Keep concurrency aligned with safe ownership and record unavailable capabilities instead of assuming a particular UI or command exists.

Official sources: [Codex subagents](https://developers.openai.com/codex/subagents), [OpenAI model guidance](https://developers.openai.com/api/docs/guides/latest-model).

### Claude Code

Choose the currently supported delegation mode according to whether work returns to one lead or needs shared coordination. Give each participant the complete instruction packet; do not assume inherited conversation context or availability of a specific command, model alias, or experimental feature.

Official sources: [Claude Code parallel agents](https://code.claude.com/docs/en/agents), [Claude Code subagents](https://code.claude.com/docs/en/sub-agents), [Claude Code agent teams](https://code.claude.com/docs/en/agent-teams).

## Exceptions and Deviations

Simple, short, or obvious tasks do not require multi-model orchestration when delegation overhead would exceed the work.

For non-trivial work, routine coding delegation is mandatory when suitable model-tier routing is available. A deviation is allowed only when:

- the runtime cannot select or spawn another model
- no cheaper available model is capable of the required language, tools, context, or risk level
- the implementation is inseparable from a high-risk architecture, security, data-loss, or public-contract decision owned by the planning model
- safe file ownership cannot be separated without creating more risk than the delegation removes

The lead MUST record the concrete reason before doing the implementation itself. Cost optimization MUST NOT override correctness, security, verification, repository rules, or explicit user model requirements.

## Repository Configuration

Root `AGENTS.md` MUST record role-based selection rules rather than hard-coded model product names that may expire:

- planning tier: highest-capability suitable model
- coding tier: least expensive capable model
- work that may be delegated
- work that must remain with the planning model
- required worker instruction fields
- escalation and review gates

If a repository pins exact model names, it MUST also define how they are refreshed when availability or capabilities change.
