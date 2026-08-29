# MCAF Concepts

**Managed Code Coding AI Framework**

Developed and sustained by **Managed Code**  
March 2026

---

## 1. What MCAF Is

MCAF is a framework for building real software with AI coding agents.

It defines how to:

- keep durable engineering context in the repository
- make AI work from `AGENTS.md` plus repo-native docs and skills
- verify behaviour with tests and static analysis
- keep AI guidance small, explicit, and versioned

The goal of MCAF:

> Use AI to build real products in a way that is predictable, safe, and repeatable.

MCAF has three core elements:

- **Context** — code, docs, `AGENTS.md`, and skills live with the repo.
- **Verification** — integration tests and quality gates are the decision makers, not opinions.
- **Instructions** — root and local `AGENTS.md` files define how agents work here and learn over time.

These concepts define the framework (the "what" and "why").  
`TUTORIAL.md` is the bootstrap procedure (the "how").  
Repository `AGENTS.md` files apply both to a specific solution.

### 1.1 Bootstrap Surface

`v1.3` is skill-first.

Bootstrap stays minimal:

- one root `AGENTS.md` template
- one `CLAUDE.md` wrapper template
- one tutorial page that explains how agents fetch and install the right skill folders

Canonical install entry point:

- Tutorial: [https://mcaf.managed-code.com/tutorial](https://mcaf.managed-code.com/tutorial)

Optional direct shortcuts:

- Templates: [https://mcaf.managed-code.com/templates](https://mcaf.managed-code.com/templates)
- Skills: [https://mcaf.managed-code.com/skills](https://mcaf.managed-code.com/skills)

## 2. Context

Context is everything needed to understand, change, and run the system.

### 2.1 Repository Context

In MCAF, repository context includes:

- application code
- automated tests
- architecture, feature, ADR, and operational docs
- skills for repeatable agent workflows
- the solution-root `AGENTS.md`
- project-local `AGENTS.md` files for multi-project solutions

Anything that materially affects development, verification, or operation belongs in the repo.

### 2.2 Documentation Layout

A typical MCAF repo keeps durable docs under `docs/`:

- `docs/Architecture.md` — global map and module boundaries
- `docs/Features/` — behaviour specs and testable flows
- `docs/ADR/` — architecture decisions and trade-offs
- `docs/Testing/` — test strategy and environments
- `docs/Development/` — local setup and workflows
- `docs/Operations/` — deployment, monitoring, and incident handling

This is a reference layout, not a rigid folder law. The important part is that the repo has clear homes for architecture, behaviour, testing, development, and operations.

### 2.3 Bootstrap Templates

Public bootstrap templates are intentionally minimal:

- `docs/templates/AGENTS.md`
- `docs/templates/CLAUDE.md`

Authoring scaffolds for architecture docs, feature specs, ADRs, governance, and maintainability do **not** live in `docs/templates/`.
They live in skills under `references/` or `assets/`.

### 2.4 Skills

Skills are small, versioned workflow packs that make repetitive agent work predictable.

A skill contains:

- `SKILL.md` — trigger metadata plus concise workflow instructions
- `references/` — long-form guidance or scaffolds loaded only when needed
- `assets/` — output assets or templates used by the workflow
- `scripts/` — deterministic helpers when they add reliability

Recommended target locations in a consuming repo:

- Codex: `.codex/skills/`
- Claude Code: `.claude/skills/`

The public skill catalog lives on the Skills page:

- [https://mcaf.managed-code.com/skills](https://mcaf.managed-code.com/skills)

Platform-specific bundles can stay small and still be explicit.
`.NET` skills are maintained outside this repository in the [Managed Code Skills catalog](https://skills.managed-code.com/).
Install the `.NET` skills you need from that catalog, then document the exact `dotnet build`, `dotnet test`, `dotnet format`, `analyze`, `complexity`, coverage, and other quality-gate commands in the consuming repo’s `AGENTS.md`.
For `.NET` code changes, the task is not done when tests are green if the repo also configured formatters, analyzers, complexity checks, coverage, architecture tests, or security gates.
Agents should run the repo-defined post-change quality pass before completion, and any external `.NET` helper should still include a `Bootstrap When Missing` section so agents can detect, install, verify, and first-run the tool without guessing.

### 2.5 Context Rules

The canonical contract is [`MCAF-ARCH-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solution-governance/references/monorepo-vertical-slices.md).

- All durable engineering context lives in the repository.
- `MCAF-ARCH-001` is mandatory: one solution repository contains all solution-owned backend, frontend, contracts, tests, infrastructure, and documentation.
- The project has a current `docs/Architecture.md`.
- Humans and agents start from the architecture map, not repo-wide scanning.
- Vertical-slice architecture is mandatory across every technical root.
- Each feature uses one canonical slice name and one documented internal convention across backend, frontend, contracts, tests, and `docs/Features/`.
- Feature-owned behaviour is organized by business capability, not by repository-level technical-layer folders.
- Feature slices stay as isolated as possible so task context stays narrow and the right files are easy to find.
- `docs/Architecture.md` contains Mermaid diagrams for system/module boundaries, interfaces/contracts, and key types for the active area.
- Feature docs under `docs/Features/` contain at least one Mermaid diagram for the main flow.
- ADRs under `docs/ADR/` contain at least one Mermaid diagram for the decision and affected boundaries.
- Multi-project solutions use root plus project-local `AGENTS.md` files.
- Bootstrap templates stay tiny; detailed scaffolds belong in skills.
- Docs are written precisely enough to support direct implementation and verification.

### 2.6 Vertical-Slice Architecture for AI Coding

A vertical slice is one end-to-end business capability or use case, not one technical layer. A slice such as `Orders` owns its affected UI, API or backend behaviour, contracts, persistence or integrations, tests, infrastructure, and feature documentation.

In this policy, the solution is the complete product delivery boundary—not merely a `.sln` or `.slnx` file and not merely the backend. Its solution-owned frontend, backend, contracts, tests, infrastructure, and docs live and evolve together.

For an AI coding agent, the slice is the default unit of context and delivery. The agent starts from `docs/Architecture.md`, reads the applicable root and local `AGENTS.md` files, opens `docs/Features/<SliceName>.md`, and then works only in the matching slice paths. This lets the agent find the full behaviour without scanning the repository or guessing which generic service, controller, component, or test folder belongs to the feature.

The solution remains one repository, while toolchains may keep separate projects. Reuse the exact same slice name and internal convention across those roots:

```text
src/Backend/Features/Orders/
src/Frontend/Features/Orders/
src/Contracts/Features/Orders/
tests/Features/Orders/
docs/Features/Orders.md
```

With this structure, a request such as "add order cancellation" has one deterministic scope: read the `Orders` feature doc and applicable governance, then update the affected Orders backend, frontend, contract, test, and documentation surfaces together.

Do not organize feature ownership primarily as repository-level `Controllers/`, `Services/`, `Repositories/`, `Components/`, or generic test buckets. Technical subfolders may exist inside a slice, but the business capability remains the owner.

To structure a solution:

1. Inventory backend, frontend, contract, test, infrastructure, and documentation roots.
2. Choose one canonical `<SliceName>` naming and casing convention.
3. Choose colocated slices or mirrored `Features/<SliceName>/` paths.
4. Record the convention and slice-to-surface map in root `AGENTS.md` and `docs/Architecture.md`.
5. Add one `docs/Features/<SliceName>.md` behaviour and verification source for every feature.
6. Keep feature-owned code in the slice; move only genuinely multi-slice code into shared building blocks.
7. Require every change to name its slice and keep all affected surfaces aligned.

### 2.7 Executable Feature Requirements and ADR Implementation

`MCAF-REQ-001` makes requirements the input to architecture, agent tasks, code, and verification—not a prose artifact written afterward.

Every non-trivial `docs/Features/<SliceName>.md` contains:

- stable `REQ-*` requirements with type, priority, rationale, and measurable pass/fail conditions
- stable `AC-*` acceptance criteria and positive, negative, edge, and error flows
- an explicit ADR link, or `ADR: N/A` with a concrete reason
- a `MCAF-AI-001` execution contract for non-trivial parallel work
- a traceability matrix from requirement to acceptance, ADR, task, automated test, and evidence

Create an ADR before implementation when a feature changes boundaries, public contracts, data, dependencies, security, deployment topology, cross-cutting standards, or migration architecture. The ADR must include an executable implementation contract: ordered stages, exact slice/file ownership, dependencies, migration/rollout/rollback, agent roles, tests, pass conditions, and join evidence. `Accepted` means the decision is approved; `Implemented` means the implementation and verification evidence actually exist.

Canonical contract: [`MCAF-REQ-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-feature-spec/references/requirements-adr-traceability.md).

## 3. Verification

Verification is how the team proves that behaviour and code quality meet expectations.

### 3.1 Test Levels

MCAF expects layered verification:

- unit tests for isolated, non-trivial logic
- integration tests for real component interaction
- API tests for public contracts
- UI/E2E tests for user-visible flows

The goal is not “one test per feature.”  
The goal is enough automated evidence to trust the change.

Integration tests are the backbone because they prove that a slice works through real boundaries, not just isolated units.

### 3.2 Verification Rules

- Prefer TDD for new behaviour and bug fixes: start with a failing test, make it pass, then refactor.
- New or changed behaviour is proven by new or updated automated tests.
- Tests prove user-visible or caller-visible flows, not just isolated implementation detail.
- Tests cover positive, negative, edge, and unexpected flows when the behaviour can fail in different ways.
- Integration/API/UI coverage is preferred when the behaviour crosses boundaries.
- Integration tests are the default primary proof for behaviour that spans more than one component inside a feature slice.
- Internal and external systems are exercised through real containers, test instances, or sandbox environments in primary suites.
- Mocks, fakes, stubs, and service doubles are forbidden in verification flows.
- Changed production code should reach at least 80% line coverage and 70% branch coverage where supported; critical flows and public contracts should reach 90% line coverage.
- Coverage must not regress below the pre-change baseline without an explicit exception, and coverage numbers do not replace scenario coverage.
- Static analysis is part of done, not a cleanup task.
- Failing tests or analyzers block completion.
- Run every repo-defined quality gate that is available for the stack and change scope: formatters, linters, analyzers, complexity checks, architecture tests, security scans, mutation checks, coverage, and any other configured verification tools.
- The task is not done until the full relevant test suite is green, not only the newly added or changed tests.

### 3.3 Verification Artifacts

Under `MCAF-REQ-001`, non-trivial feature docs and architecture-affecting ADRs MUST point to:

- the scenarios that must be proven
- the testing methodology for those scenarios
- the commands used to prove them
- the suites or artifacts that provide that proof
- the stable `REQ-*`, `AC-*`, ADR, and `TASK-*` IDs that make the proof traceable

## 4. Instructions and AGENTS.md

Instructions define how AI agents behave in the repository and how they improve over time.

### 4.1 Root and Local AGENTS.md

Every MCAF repo has a solution-root `AGENTS.md`.

In multi-project solutions, each project or module root also has a local `AGENTS.md`.

Root `AGENTS.md` owns:

- global workflow
- shared commands
- cross-cutting rules
- global skills
- maintainability-limit keys
- rule precedence

Local `AGENTS.md` owns:

- project purpose
- entry points
- local boundaries
- local commands
- applicable skills
- stricter local constraints

### 4.2 Rule Precedence

Agents follow this order:

1. Read the root `AGENTS.md`.
2. Read the nearest local `AGENTS.md`.
3. Apply the stricter rule if both apply.
4. Do not silently weaken root policy in a local file.

### 4.3 Required Content

Root `AGENTS.md` stays current with:

- commands (`build`, `test`, `format`, `analyze`, `complexity`, `coverage`, and other quality gates if used)
- global skills and when to use them
- self-learning rules
- subagent orchestration rules for large, non-trivial, research-heavy, or implementation-heavy tasks
- mandatory `MCAF-AI-001` model-tier routing: strongest suitable planning model, least expensive capable coding workers, required instruction packets, escalation, and lead review
- mandatory `MCAF-REQ-001` feature requirements, ADR triggers and implementation contracts, plus traceability through tasks, tests, and evidence
- non-trivial task workflow rules, including root-level `<slug>.brainstorm.md` and `<slug>.plan.md` usage
- testing discipline
- done criteria for tests, coverage, and quality gates
- design and maintainability rules
- the mandatory `MCAF-ARCH-001` single-repository boundary and canonical vertical-slice path convention
- exception policy
- topology for local `AGENTS.md` files

Project-local `AGENTS.md` files stay current with:

- local purpose and boundaries
- entry points
- project commands
- local risks
- stricter maintainability limits when needed
- exact applicable skills
- owned slices and their paths, using the same canonical names as all other project, test, and documentation roots

### 4.4 Maintainability Limits

MCAF requires a `Maintainability Limits` section in `AGENTS.md` with stable keys:

- `file_max_loc`
- `type_max_loc`
- `function_max_loc`
- `max_nesting_depth`
- `exception_policy`

These values are repo policy, not framework constants.

MCAF may show starter values, but the active limits live only in the consuming repo’s `AGENTS.md`.

### 4.5 Self-Learning

Chat is not memory.

Stable corrections, preferences, and recurring mistakes should become:

- `AGENTS.md` rules
- docs updates
- skill updates

If the same mistake happens twice, the framework expects the rule to be made durable.
Self-learning is a cornerstone of the framework, not an optional habit.

### 4.6 Hard Rules for Instructions

- [`MCAF-GOV-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solution-governance/references/agents-update-safety.md) makes MCAF installation and updates merge-only: every existing root and local `AGENTS.md` rule stays mandatory and cannot be deleted, omitted, overwritten, summarized away, or weakened.
- Every MCAF repo has a root `AGENTS.md`.
- Multi-project solutions use local `AGENTS.md` files at project roots.
- Agents read root and local `AGENTS.md` before editing code.
- `MCAF-ARCH-001` is mandatory: all solution-owned backend, frontend, contracts, tests, infrastructure, and docs stay in one repository.
- Every feature uses one canonical slice name and one consistent feature-first convention across all applicable technical roots.
- Local rules and ADRs cannot weaken this target architecture. They may only document a time-bounded migration deviation with an owner, target layout, verification, and removal date.
- Agents must prefer the smallest relevant feature slice over repo-wide scanning.
- [`MCAF-AI-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solution-governance/references/model-tier-orchestration.md) is mandatory for non-trivial work: the strongest suitable large or high-capability model available owns planning and final integration, while bounded coding scopes are spawned on the least expensive capable models.
- Coding delegation starts only after scope, architecture, contracts, acceptance criteria, tests, and the ordered plan are explicit.
- Cheaper coding models receive exact ownership, constraints, expected artifacts, verification commands, and escalation conditions; they do not invent architecture or weaken rules.
- [`MCAF-REQ-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-feature-spec/references/requirements-adr-traceability.md) is mandatory: non-trivial feature docs define stable `REQ-*`/`AC-*`; architecture-affecting ADRs define their implementation contract; every requirement traces through tasks, tests, and evidence.
- For large or complex tasks, the lead agent plans the work, explicitly identifies parallelizable workstreams, and spawns subagents for independent research, implementation, test, verification, documentation, and review scopes that can run in parallel.
- The agent must spawn subagents for every independent parallel workstream unless there is a concrete coordination, risk, or ownership reason not to.
- Subagents must receive concrete ownership and verification duties; the lead agent remains responsible for integration, quality gates, and final completion.
- Only non-trivial tasks start with a root-level `<slug>.brainstorm.md`, then move into a root-level `<slug>.plan.md`.
- Simple, short, or obvious tasks should skip the brainstorm and go straight to execution.
- Brainstorms capture thinking, options, trade-offs, and the chosen direction before implementation starts.
- Plans include ordered implementation steps, explicit test steps, testing methodology, and final validation commands.
- Skills are preferred over improvised workflow when a skill matches the task.
- Numeric maintainability limits live in `AGENTS.md`, not in framework prose.

## 5. Coding and Testability

MCAF coding rules exist to keep systems changeable and testable.

### 5.1 Design Policy

- SOLID is mandatory.
- SRP and cohesion are mandatory.
- `MCAF-ARCH-001` makes the single-repository boundary and vertical-slice architecture mandatory for the complete solution.
- Organize every technical root by feature so backend, frontend, contracts, tests, and docs reuse the same canonical slice name and internal convention.
- Do not use repository-level `Controllers`, `Services`, `Repositories`, or equivalent layer folders as the owners of feature behaviour.
- Prefer composition over inheritance unless inheritance is explicitly justified.
- Boundaries must support realistic tests through public interfaces.
- Do not preserve obsolete, dead, duplicate, or replaced legacy code unless the user explicitly asks for a temporary compatibility path.
- Replacements remove the old code, tests, configuration, docs, and routing in the same change once the new path is proven.
- Placeholder implementations, compatibility shims, and fallback paths are not acceptable substitutes for a complete migration.
- Hidden global state and side effects are design smells.

### 5.2 Maintainability Policy

- Large files, classes, functions, and deep nesting are design smells.
- Repos configure their numeric thresholds in `AGENTS.md`.
- If code exceeds those limits, split it or document a justified exception using the repo’s `exception_policy`.
- A justified exception is a temporary, explicit debt record, not a silent norm.

### 5.3 Constants and Configuration

Meaningful literals are not scattered through the codebase.

Extract shared values into:

- constants
- enums
- config
- dedicated types

Hardcoded values are forbidden.

String literals do not belong in implementation logic. If a string matters, define it once as a named constant, enum value, configuration entry, or dedicated type and reference that symbol everywhere else.

### 5.4 Hard Rules for Coding and Testability

- Code structure must support meaningful automated tests.
- Maintainability limits are enforced through `AGENTS.md`.
- Patterns that depend on mocks, fakes, stubs, or service doubles are design smells.
- Legacy, obsolete, duplicate, shim, placeholder, and fallback code must be removed unless an explicit documented exception requires it.
- Hard-to-test behaviour is treated as a design problem to fix.

## 6. Perspectives

MCAF describes responsibilities using four perspectives.

### 6.1 Product

- owns what the system should do
- keeps feature docs current
- ensures scope and acceptance are explicit

### 6.2 Dev

- owns how the system is built
- keeps architecture docs, ADRs, commands, and `AGENTS.md` current
- owns maintainability and verification quality

### 6.3 QA

- owns how behaviour is proven
- keeps scenario coverage explicit
- aligns tests with feature docs and ADRs

### 6.4 AI Agent

- reads root and local `AGENTS.md`
- follows skills and repo rules
- updates docs and skills when durable patterns change
- asks concrete questions only when the repo cannot answer them

Humans still own approval and merge decisions.

## 7. Development Cycle

### 7.1 Describe

Before heavy coding:

1. update or create feature docs
2. update or create ADRs if architecture changes
3. align test expectations
4. identify the right skills

### 7.2 Brainstorm

For non-trivial work, start with a root-level `<slug>.brainstorm.md` and keep it concise.
The brainstorm records:

- the problem to solve
- scope and constraints
- relevant context and assumptions
- candidate approaches or options
- trade-offs, risks, and open questions
- the recommended direction that will become the plan

Brainstorm first, think through the task, then convert the chosen direction into a working plan.
Do not create a brainstorm for simple, short, or obvious work where the path is already clear.

### 7.3 Plan

For non-trivial work, create a root-level `<slug>.plan.md` after the brainstorm direction is chosen, and keep it current.
The plan records:

- goal and scope
- detailed ordered implementation steps
- files or boundaries to change
- tests to add or update
- the testing methodology: which flows are covered, how they are verified, which commands prove them, and the required quality or coverage bar
- docs to update
- risks and constraints
- final validation skills and commands, with reasons
- checklist items and done criteria

Before implementation starts, run the full relevant test baseline.
If anything is already failing, add each failing test to the plan with its symptom, suspected or confirmed root cause, and intended fix path.

### 7.4 Implement

- Use the Ralph Loop for non-trivial work: brainstorm first, turn the chosen direction into a plan, execute one planned step, run the relevant checks, update the plan, then move to the next step.
- implement code and tests together
- keep changes small and reviewable
- fix failing tests deliberately, one by one, and track them in the plan until they are closed
- use the architecture map and nearest local `AGENTS.md` to stay in scope

### 7.5 Verify

Run verification in layers:

1. changed tests
2. related suite
3. broader required regressions and the full relevant suite
4. analyzers, formatters, and any configured architecture, security, mutation, or other quality gates
5. complexity checks and any other configured code-quality tools
6. coverage comparison against the pre-change baseline

### 7.6 Update Durable Context and Close the Task

After implementation:

- update feature docs
- update ADRs
- update the architecture map when boundaries changed
- update `AGENTS.md` or skills when rules or workflows changed
- keep the plan file current until every checklist item is done
- close the task only when all planned work is finished, all relevant tests are green, and coverage is at least at the starting baseline unless an explicit exception was documented

## 8. AI Participation Modes

MCAF supports three common AI participation modes.

### 8.1 Delegated

The agent executes scoped work under current docs, skills, and `AGENTS.md`.

### 8.2 Collaborative

The agent and engineer iterate together on design, code, tests, and docs.

### 8.3 Consultative

The agent reviews, critiques, or drafts options while humans retain implementation control.

### 8.4 Mandatory Model-Tier Orchestration

For non-trivial implementation work, MCAF separates expensive reasoning from bounded code production:

- the strongest suitable large or high-capability model available owns repository discovery, architecture, acceptance criteria, test strategy, planning, decomposition, integration, and final review
- after the plan is explicit, independent coding scopes are spawned on the least expensive models that are still capable of the required stack, tools, context, and risk level
- every coding worker receives exact scope, ownership, contracts, constraints, expected artifacts, verification commands, and escalation conditions
- workers stop on ambiguity instead of inventing architecture, changing contracts, weakening tests, or expanding scope
- the planning model reviews every diff and remains accountable for integration and all quality gates

The mandatory run protocol is:

1. finish `MCAF-REQ-001` feature requirements and every required ADR implementation contract
2. build a task graph with stable IDs, dependencies, disjoint write ownership, artifacts, tests, completion states, and join conditions
3. use strong reasoning for architecture, ambiguity, security, and final review; use the least expensive capable models for bounded exploration, implementation, test work, and documentation
4. spawn only independent workstreams; serialize same-file work and give shared contracts or migrations one integration owner
5. monitor native task status, steer or replace stuck agents, and wait for all required results
6. accept only explicit `complete`, `blocked`, `failed`, or `cancelled` states with evidence; `idle` and unverified summaries are not completion
7. have the planning model inspect every result and diff, then run integrated repository verification

For Codex, official guidance supports read-heavy `explorer`, execution-focused `worker`, and project custom agents with per-agent model/reasoning configuration; Codex can wait for all requested agents and consolidate their results. For Claude Code, choose subagents for bounded delegation, background sessions for human-monitored independent work, and experimental agent teams only when workers need shared tasks or messaging. Claude Code exposes current-session work through `/tasks` and background sessions through `claude agents`. See the official [Codex subagents](https://developers.openai.com/codex/subagents), [Claude Code parallel agents](https://code.claude.com/docs/en/agents), [Claude Code subagents](https://code.claude.com/docs/en/sub-agents), and [Claude Code agent teams](https://code.claude.com/docs/en/agent-teams) documentation.

Simple work does not require delegation when orchestration overhead exceeds the task. For non-trivial work, failure to delegate routine coding must have a concrete recorded reason such as unavailable model routing, insufficient worker capability, inseparable high-risk decisions, or unsafe ownership overlap.

The canonical contract is [`MCAF-AI-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solution-governance/references/model-tier-orchestration.md).

The repo may choose different modes per task, but the same verification and governance rules still apply.

## 9. Adopting MCAF in a Repository

Use the tutorial as the canonical install flow:

1. Open [Tutorial](https://mcaf.managed-code.com/tutorial).
2. Follow the tutorial flow to fetch templates and install the needed skills.
3. In multi-project solutions, add project-local `AGENTS.md` files using the governance skill.
4. Restart the agent so it reloads the installed skills.

Adoption is complete when:

- the repo has root `AGENTS.md`
- the right skills are installed
- multi-project boundaries have local `AGENTS.md`
- commands and docs reflect the real repo
- non-trivial work is guided by root-level `<slug>.brainstorm.md`, `<slug>.plan.md`, and the Ralph Loop
- simple work skips brainstorm overhead and goes straight to execution
- `MCAF-ARCH-001` is recorded in `AGENTS.md` and `docs/Architecture.md`, with all solution-owned surfaces in one repository and a consistent repo-wide slice map
- `MCAF-GOV-001` is enforced: framework updates preserve every existing root and local `AGENTS.md` rule and keep the stricter formulation on overlap
- `MCAF-AI-001` is enforced: strong models plan and review non-trivial work, while bounded coding is delegated to cheaper capable models with explicit instructions
- `MCAF-REQ-001` is enforced: non-trivial features have stable requirements and acceptance criteria, required ADRs have implementation contracts, and requirements trace through tasks, tests, and evidence
- vertical-slice architecture, integration tests, and self-learning are treated as core framework pillars
- tool-specific skills document real bootstrap and install steps when the tool is missing
- tests and analyzers are the real gates
