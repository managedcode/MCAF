# The MCAF Guide

**Managed Code Coding AI Framework**

Developed and sustained by **Managed Code**  
December 2025

---

## 1. What MCAF Is

MCAF is a framework for building software products together with AI coding agents.

It defines how to:

- keep all relevant context in a single repository  
- describe work clearly before coding  
- use integration/API/UI tests, containerized environments, and static analysis as hard gates  
- encode repository-specific rules for AI agents in `AGENTS.md` at the repo root  

The goal of MCAF:

> Use AI to build real products in a way that is predictable, safe, and repeatable.

MCAF has three core elements:

- **Context** — code, tests, documentation, and `AGENTS.md` live together in the repository.  
- **Verification** — behaviour and code quality are proven by automated tests and static analysis, not opinions.  
- **Instructions** — `AGENTS.md` defines how AI agents work in this repo and how they learn from feedback.

This Guide defines the framework.  
The root `AGENTS.md` in each repository applies it to that codebase.

---

## 2. Context

Context is everything needed to understand, change, and run the system.  
MCAF requires that humans and agents work from the same context stored in the repository.

### 2.1 Definition

In MCAF, repository context includes:

- application code  
- automated tests (unit, integration, API, UI/E2E)  
- documentation for features, architecture, testing, development, and operations  
- the repository’s root `AGENTS.md`  

Anything that matters for development, testing, or operations lives in the repository.

### 2.2 Documentation layout

A typical `docs/` layout:

- `docs/Features/`  
  Feature descriptions, user flows, business rules, Definition of Done, diagrams, test flows.

- `docs/ADR/`  
  Architecture Decision Records: context, options, decision, consequences, links to features and code.

- `docs/API/`  
  Public endpoints, request/response models, error formats, versioning rules.

- `docs/Architecture/`  
  System and module diagrams, boundaries, deployment and runtime views.

- `docs/Testing/`  
  Test strategy, levels, coverage goals, test environments, how to run each suite.

- `docs/Development/`  
  Local setup, tools, standard commands, branching and review practices.

- `docs/Operations/`  
  Deployment, monitoring, alerting, incident handling.

- `docs/Home.md`  
  Entry point with links to the most important docs and templates.

This structure is a reference. A repository may adapt directory names, but keeps clear places for features, decisions, testing, development, and operations.

### 2.3 Feature docs

Each non-trivial feature has a document under `docs/Features/` that includes:

- feature name and purpose  
- business rules and constraints  
- main flows and edge cases  
- at least one diagram (for example, Mermaid) that shows the main flow or interaction  
- test flows:
  - which scenarios are tested  
  - what data / state is required  
  - expected result for each flow  
- Definition of Done:
  - exact conditions under which the feature is considered complete  

Feature docs are written precisely enough that:

- a human can implement and verify the feature end-to-end  
- an AI agent can derive code and tests directly from the description without inventing behaviour  

### 2.4 Linking and references

Documentation links to:

- other docs (Features, ADR, Testing, Architecture, Operations)  
- specific code elements (files, classes, methods, modules)  
- diagrams that show flows, data, or structure  
- external articles, standards, or specifications that explain patterns or decisions  

Links make it easy to navigate:

- from feature → tests → code → ADR  
- from incident → operations doc → underlying implementation  

### 2.5 Hard rules for Context

- All information that matters for understanding, changing, or running the system lives in the repository.  
- Every non-trivial feature has a feature doc before heavy coding starts.  
- Each feature doc includes test flows and a clear Definition of Done.  
- Docs are written in English.  
- Docs may reference other docs, code, diagrams, and relevant external resources.

---

## 3. Verification

Verification is how the team proves that behaviour and code quality meet expectations.  
Under MCAF, tests and static analysis are the main decision makers.

### 3.1 Test levels and coverage

MCAF uses several levels of tests:

- **Unit tests**  
  Pure functions and algorithms, no I/O. Used for complex logic that is hard to cover via higher-level tests.

- **Integration tests**  
  Components working together with real backing services: databases, queues, caches, internal services.

- **API tests**  
  Public endpoints exercised over HTTP or equivalent, touching real services and storage.

- **UI / E2E tests**  
  Full user flows through browser, mobile, or desktop, hitting the real backend.

Coverage expectations:

- Each significant feature or functional behaviour has sufficient tests to cover its possible cases; at minimum, one integration-level test for the core flow.
- If behaviour is exposed via API, each public endpoint has at least one API test; complex endpoints have tests for different input variations and error conditions.
- API and integration tests must exercise real flows end-to-end, not just call endpoints in isolation; tests verify that components work together correctly.
- If behaviour is visible to users through UI, there is at least one UI/E2E test for it; critical user flows have tests for main and alternative paths.
- Unit tests are added when internal logic is complex, critical, or performance-sensitive.
- The goal is not "one test per feature" but "enough tests to have confidence in the behaviour"; one is the minimum, not the target.

Code coverage:

- Code coverage is measured and tracked to see which functionality is actually tested.
- Coverage reports show which functions, branches, and flows are exercised by tests — and which are not.
- Coverage reports are generated as part of CI or on demand.
- Low coverage in critical modules triggers review and test planning.
- Coverage is a tool for finding gaps, not a target to game; 100% coverage with weak assertions is worse than 70% coverage with meaningful tests.

Test quality:

- Each test verifies a real flow or scenario, not just that a function can be called.
- Tests without meaningful assertions are forbidden; a test that only calls code without verifying outcomes is not a valid test.
- Tests check behaviour and outcomes, not implementation details.  

Tests cover:

- positive flows (happy paths)  
- negative flows (validation failures, forbidden actions, error conditions)  
- edge cases (limits, boundaries, big inputs, time-sensitive behaviour) where relevant  

### 3.2 Containerized environments

Integration/API/UI tests run against reproducible infrastructure.

- Internal dependencies (databases, queues, caches, internal services) run in containers (for example, Docker Compose) or equivalent scripted setups defined in the repository.  
- The test environment can be started from the repo using documented scripts or config; no hidden manual steps.  
- The same test commands work on a developer machine and in CI.  

If an internal dependency cannot reasonably run in a test container or local instance, this is treated and documented as an architectural smell.

### 3.3 Static analysis

Static analyzers and linters enforce a consistent baseline of code quality.

- Analyzer configurations live in the repository and are versioned with the code.  
- A standard console command runs analyzers; it is documented in `AGENTS.md` and `docs/Development/`.  
- CI runs analyzers on relevant branches and pull requests.

New code does not introduce new violations without explicit justification and review.  
Recurring analyzer issues (unsafe APIs, bad patterns) lead to updates in `AGENTS.md` and/or ADRs.

### 3.4 External dependencies, mocks, and fakes

Mocks and fakes are strongly restricted in MCAF.

For internal systems (databases, queues, caches, internal services):

- Primary test suites do not use mocks or fakes.  
- These systems are exercised through real containers or test instances.

For external third-party systems (payment gateways, SMS providers, external APIs):

- Replacement is used only when they cannot realistically run in a test or sandbox environment.  
- When replaced, official sandboxes or test accounts are preferred.  
- When sandboxes are unavailable, dedicated fake services are defined in the repo.

When using fakes or mocks for external systems:

- Fake/mocked APIs realistically match the real API surface (endpoints, methods, fields).  
- Fakes can produce realistic data and realistic error conditions.  
- Fake/mocked API definitions are updated when external contracts change.

Over-use of mocks is treated as a test smell and triggers refactoring or revisiting architecture and test strategy.

### 3.5 Hard rules for Verification

- New and changed behaviour is proven with automated tests.  
- Important behaviour is validated via integration/API/UI tests, not solely by unit tests.  
- Internal systems are exercised against real containers or test instances in primary suites; they are not mocked there.  
- Mocks and fakes are used only for external systems that cannot reasonably run in tests, and they realistically match the real API and behaviour.  
- Static analyzers run as part of the Definition of Done.  
- Failing tests or analyzers block completion of a task.

---

## 4. Instructions and AGENTS.md

Instructions define how AI coding agents behave in the repository and how they learn over time.  
They live primarily in `AGENTS.md`.

### 4.1 Role of AGENTS.md

The root `AGENTS.md` sits next to this Guide in the repository.

It defines:

- how AI coding agents work in this codebase  
- which commands they run (build, test, format, analyze)  
- how they learn from feedback and code patterns  
- coding rules, testing discipline, and Definition of Done specific to this repo  
- maintainer preferences and style choices  

This Guide defines the framework.  
The root `AGENTS.md` applies it to this repository.

### 4.2 Required content of AGENTS.md

In a repository that uses MCAF, the root `AGENTS.md` stays up to date with:

- self-learning rules: how to extract patterns from feedback and code history  
- development flow: high-level steps agents follow when changing code  
- testing discipline: which tests to run (new, related, full), and in which order  
- coding rules: important constraints, patterns, and anti-patterns  
- commands: canonical `build`, `test`, `format`, `analyze` commands  
- maintainer preferences: naming, formatting, tone, explanation style  

Local `AGENTS.md` files in subdirectories refine these rules for specific areas when needed.

### 4.3 Self-learning

`AGENTS.md` describes how agents:

- recognize feedback that should become a rule  
- decide scope (local vs global) for new rules  
- update or replace existing rules when they conflict  

Feedback categories:

- directive (must do / must not do)  
- preference (likes/dislikes, verbosity, style)  
- evaluation (good/bad, useful/useless, clean/messy)  
- process (workflow, Definition of Done, "this is how we deploy/test")  
- correction (explicit "this is wrong, never do this again")  
- emotional (anger, sarcasm, passive aggression signalling serious issues)  
- pattern (recurring feedback across tasks)  

Conversations are not memory. Stable patterns are written into `AGENTS.md` or docs.

### 4.4 Commands

`AGENTS.md` lists the canonical commands for this repository, for example:

- `build`: build the solution  
- `test`: run tests (with notes on focused vs full suites)  
- `format`: run code formatter  

Agents and automation use these commands instead of ad-hoc command sequences.

### 4.5 Local AGENTS.md

In large repositories, directories may have their own `AGENTS.md` files. They:

- refine rules for that area (for example, UI vs backend vs infrastructure)  
- add stricter requirements without contradicting MCAF principles  
- apply to files in that directory and its subdirectories  

### 4.6 AGENTS.md governance

`AGENTS.md` is a critical document that shapes how AI agents work in the repository. Changes to it affect all future AI-assisted development.

Change approval:

- Changes to the root `AGENTS.md` require review and approval by a designated owner or lead maintainer.
- The owner of `AGENTS.md` is defined in the document itself or in `CODEOWNERS`.
- AI agents may propose changes to `AGENTS.md`, but humans approve and merge them.
- Significant rule changes are discussed with the team before merging.

Review criteria for `AGENTS.md` changes:

- The change aligns with MCAF principles.
- The rule is clear and actionable.
- The rule does not contradict existing rules without explicit replacement.
- The rule reflects a stable pattern, not a one-time preference.

### 4.7 Hard rules for Instructions

- Every repository that uses MCAF has a root `AGENTS.md`.
- Root `AGENTS.md` is in English and aligned with this Guide.
- Agents read `AGENTS.md` and relevant docs before editing code.
- Stable patterns and lessons are recorded in `AGENTS.md` or docs; chat alone is not memory.
- Automation and agent instructions rely only on documented `build`, `test`, `format`, and `analyze` commands.

---

## 5. Coding and Testability

Coding rules in MCAF exist to make integration/API/UI tests and static analysis effective and sustainable.

### 5.1 Purpose

Code structure and style:

- support realistic end-to-end tests  
- keep static analyzers useful and manageable  
- avoid patterns that block or weaken tests  

### 5.2 Constants and configuration

Meaningful literals are not scattered through the codebase.

Examples:

- URLs and paths  
- keys, identifiers, tokens  
- status strings and important messages  
- numeric thresholds, limits, error codes  

Values like these:

- are extracted into named constants, enums, configuration objects, or dedicated types  
- have a single source of truth  
- are reused in both tests and production code  
- are not copied as new hard-coded duplicates of existing values  

### 5.3 Structure and testability

Code structure serves integration/API/UI tests:

- Components are designed so realistic flows can be exercised through public interfaces (API endpoints, handlers, queues, UI).  
- Pure logic lives in small, focused units when internal behaviour is non-trivial.  
- Global state and hidden side effects are avoided in favour of explicit dependencies.  
- Boundaries are explicit so test environments can wire dependencies cleanly.  

When a test is hard or impossible to write for a piece of behaviour, this is treated as a design problem to solve, not a reason to skip tests.

### 5.4 Relationship to mocks and fakes

Mocks and fakes follow the rules in the Verification section:

- Primary test suites do not mock internal systems.  
- Mocks and fakes for external systems appear only under the strict conditions defined in Verification.  

Coding patterns that rely heavily on mocking internal services are treated as design smells and reworked.

### 5.5 Hard rules for Coding and Testability

- Code is structured so that integration/API/UI tests can exercise real behaviour.  
- Meaningful constants and configuration are centralized rather than duplicated as magic values.  
- Patterns that require mocking internal systems in core tests are treated as problems to fix, not practices to copy.  
- Hard-to-test behaviour is treated as a design issue to resolve, not as justification to skip or weaken tests.

---

## 6. Perspectives

MCAF describes responsibilities using four perspectives. One person may play several perspectives at once.  
Titles do not matter; responsibilities do.

### 6.1 Product

Accountable for what the system does and why.

Responsibilities:

- write and maintain feature docs with scenarios, rules, and Definition of Done  
- ensure features are described before heavy coding starts  
- link feature docs to ADRs, tests, and code  
- use AI agents for drafts; review business meaning and scope  

### 6.2 Dev

Accountable for how the system is built.

Responsibilities:

- write and maintain ADRs for significant technical decisions  
- define and maintain build, test, format, and analyze commands  
- maintain root and, if needed, local `AGENTS.md` files  
- choose AI participation mode per task (delegated, collaborative, consultative)  
- review diffs and own merge decisions  

### 6.3 QA

Accountable for how behaviour is verified.

Responsibilities:

- write and maintain test case documentation with steps and expected results  
- design test environments with Dev (containers, data, reset strategy)  
- ensure critical behaviour is backed by integration/API/UI tests  
- validate that tests match feature docs and ADRs  

### 6.4 AI Agent

Accountable for generation and adaptation within the rules.

Responsibilities:

- read root and local `AGENTS.md` and relevant docs before editing code  
- follow the repository’s development flow and testing discipline  
- help draft feature docs, ADRs, and test specifications  
- run documented commands (build, test, format, analyze)  
- propose updates to `AGENTS.md` when stable patterns appear  
- ask concrete questions when information is missing or contradictory  

The AI Agent does not approve or merge changes.  
Human maintainers make the final decision.

---

## 7. Development Cycle

The development cycle describes how a change moves from idea to merged code under MCAF.  
It is built around tests and static analysis, not just "write code".

### 7.1 Describe

Before coding:

1. Product updates or creates feature documentation.  
2. Dev updates or creates ADRs if architecture changes.  
3. QA updates or creates test documentation for the new behaviour.  
4. AI Agent may draft content; humans validate and finalize.

Output:

- a feature doc with behaviour and test flows  
- ADRs for architectural or trade-off changes  
- a clear Definition of Done for this work  

### 7.2 Plan

For non-trivial tasks:

1. Agent proposes a plan that includes:
   - files to change  
   - tests to add or update (positive, negative, edge flows, integration/API/UI)  
   - docs to modify  
2. Engineer adjusts and accepts the plan.  
3. The plan is recorded (issue, document, or merge request description).

### 7.3 Implement tests and code

1. Add or update tests that match the documented test flows, focusing on integration/API/UI where possible.  
2. Implement code until these tests pass.  
3. Keep changes small and reviewable.  
4. Follow coding and testability rules from this Guide and the repository’s `AGENTS.md`.

In MCAF, tests and code move together; a task is not "almost done" while tests are missing.

### 7.4 Run tests in layers

Tests run in this order:

1. New and modified tests for this change.  
2. Related suites for the affected feature/module/service.  
3. Full required test sets for this repository (unit, integration, API, UI/E2E as defined).

Failures at any layer are understood and fixed, not skipped or muted.

### 7.5 Run static analysis

1. Run the standard `analyze` command for this repository.  
2. Review warnings and errors.  
3. Fix violations or explicitly document justified exceptions.  
4. Re-run targeted tests if fixes touched behaviour.

A task is not ready until tests and analyzers both pass.

### 7.6 Update docs and AGENTS.md

After implementation and verification:

1. Feature docs are updated so they reflect actual behaviour and edge cases.  
2. Test docs are updated so they match real test coverage and flows.  
3. If the work revealed new stable patterns or errors:
   - `AGENTS.md` is updated with new rules or clarifications  
   - ADRs are updated if architecture or standards changed  

Docs and `AGENTS.md` describe the system that actually exists.

### 7.7 Review and merge

Humans review:

- code and test diffs  
- documentation changes  
- test and analysis results  

A change is merged when:

- MCAF principles in this Guide have been followed  
- repository `AGENTS.md` rules are respected  
- required integration/API/UI tests and unit tests (where present) are green  
- static analysis passes without unresolved violations  

The AI Agent prepares and updates code, tests, and docs.  
Maintainers own the final merge decision.

---

## 8. AI Participation Modes

For each task, the team chooses how the AI Agent participates.

### 8.1 Delegated

The agent performs most of the development cycle:

- reads docs and `AGENTS.md`  
- proposes a plan  
- writes or updates tests  
- implements code  
- runs tests and analyzers  
- updates docs and proposes `AGENTS.md` changes  

Humans review and decide on merge.

Used for:

- well-understood areas  
- clearly described features  
- bug fixes with known reproduction  
- routine refactoring  

### 8.2 Collaborative

The agent and humans work closely throughout the task:

- agent drafts designs, code, tests, and docs  
- humans steer architecture, scope, and key decisions continuously  

Used for:

- complex features  
- significant architectural changes  
- cross-cutting or high-risk modifications  

### 8.3 Consultative

The agent focuses on analysis and explanation:

- reads code and docs  
- explains current behaviour and impact of changes  
- suggests alternative designs and trade-offs  

Humans implement code and tests.

Used for:

- onboarding to a codebase  
- exploring design options  
- security-sensitive or compliance-heavy work  

---

## 9. Adopting MCAF in a Repository

To adopt MCAF in a repository:

1. A `docs/` directory exists with at least `Features/`, `ADR/`, `Testing`, and `Development`.  
2. This Guide and a root `AGENTS.md` live at the repository root and are kept current.  
3. Commands for `build`, `test`, `format`, and `analyze` are defined and documented.  
4. Containerized or scripted environments exist for integration/API/UI tests.  
5. Static analyzers are configured and treated as part of the Definition of Done.  
6. Meaningful changes follow the MCAF development cycle:
   - docs first  
   - explicit plan  
   - tests and code together  
   - layered test runs  
   - static analysis  
   - updated docs and `AGENTS.md`  
   - human review and merge  

MCAF is considered active only when these practices are followed in day-to-day work, not just written down.

---

## 10. Ownership and Process

### 10.1 Ownership

Every significant feature, document, and decision has an accountable owner:

- Feature docs — owned by the feature owner (Product perspective).
- ADRs — owned by the person who made the decision.
- Test docs — owned by QA or the feature owner.
- `AGENTS.md` — see governance rules in section 4.6.

### 10.2 Process

- **Onboarding**: New team members read this Guide, the root `AGENTS.md`, and key docs before making changes.
- **Regular review**: The team periodically reviews `AGENTS.md` and docs to ensure they reflect current practices.
- **Feedback loops**: Issues with AI agent behaviour are tracked and lead to `AGENTS.md` or doc updates, not repeated chat corrections.