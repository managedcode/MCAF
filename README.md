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
- **Verification** — tests and analyzers are the decision makers, not opinions.
- **Instructions** — root and local `AGENTS.md` files define how agents work here.

These concepts define the framework (the "what" and "why").  
`TUTORIAL.md` is the bootstrap procedure (the "how").  
Repository `AGENTS.md` files apply both to a specific solution.

### 1.1 Bootstrap Surface

`v1.2` is skill-first.

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

- `docs/Architecture/` — global map and module boundaries
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
For example, a typical .NET repo baseline can install `mcaf-dotnet` as the entry skill, `mcaf-dotnet-features`, `mcaf-solution-governance`, `mcaf-testing`, exactly one of `mcaf-dotnet-xunit`, `mcaf-dotnet-tunit`, or `mcaf-dotnet-mstest`, plus `mcaf-dotnet-quality-ci`, `mcaf-dotnet-complexity`, `mcaf-solid-maintainability`, `mcaf-architecture-overview`, and `mcaf-ci-cd`.
In that setup, `mcaf-dotnet` knows when to open the more specific .NET skills, the repo-root lowercase `.editorconfig` is the default source of truth for formatting and analyzer severity, and `AGENTS.md` records the exact `dotnet build`, `dotnet test`, `dotnet format`, `analyze`, and coverage commands. Nested `.editorconfig` files are allowed when they serve a clear subtree-specific purpose, such as stricter domain rules, generated-code handling, test-specific conventions, or legacy-code containment.
For .NET code changes, the task is not done when tests are green if the repo also configured formatters, analyzers, coverage, architecture tests, or security gates. Agents should run the repo-defined post-change quality pass before completion.
If the repo standardizes on concrete tools, install the matching tool skills as well. Typical open or free .NET additions include `mcaf-dotnet-format`, `mcaf-dotnet-code-analysis`, `mcaf-dotnet-analyzer-config`, `mcaf-dotnet-stylecop-analyzers`, `mcaf-dotnet-roslynator`, `mcaf-dotnet-meziantou-analyzer`, `mcaf-dotnet-coverlet`, `mcaf-dotnet-reportgenerator`, `mcaf-dotnet-stryker`, `mcaf-dotnet-netarchtest`, `mcaf-dotnet-archunitnet`, `mcaf-dotnet-semgrep`, and `mcaf-dotnet-csharpier`. `mcaf-dotnet-codeql` stays available, but should be chosen only when its hosting and licensing model fits the repository.

### 2.5 Context Rules

- All durable engineering context lives in the repository.
- The project has a current `docs/Architecture/Overview.md`.
- Humans and agents start from the architecture map, not repo-wide scanning.
- `docs/Architecture/Overview.md` contains Mermaid diagrams for system/module boundaries, interfaces/contracts, and key types for the active area.
- Feature docs under `docs/Features/` contain at least one Mermaid diagram for the main flow.
- ADRs under `docs/ADR/` contain at least one Mermaid diagram for the decision and affected boundaries.
- Multi-project solutions use root plus project-local `AGENTS.md` files.
- Bootstrap templates stay tiny; detailed scaffolds belong in skills.
- Docs are written precisely enough to support direct implementation and verification.

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

### 3.2 Verification Rules

- Prefer TDD for new behaviour and bug fixes: start with a failing test, make it pass, then refactor.
- New or changed behaviour is proven by automated tests.
- Tests prove user-visible or caller-visible flows, not just isolated implementation detail.
- Integration/API/UI coverage is preferred when the behaviour crosses boundaries.
- Internal and external systems are exercised through real containers, test instances, or sandbox environments in primary suites.
- Mocks, fakes, stubs, and service doubles are forbidden in verification flows.
- Changed production code should reach at least 80% line coverage and 70% branch coverage where supported; critical flows and public contracts should reach 90% line coverage.
- Coverage must not regress without an explicit exception, and coverage numbers do not replace scenario coverage.
- Static analysis is part of done, not a cleanup task.
- Failing tests or analyzers block completion.

### 3.3 Verification Artifacts

Feature docs and ADRs should point to:

- the scenarios that must be proven
- the commands used to prove them
- the suites or artifacts that provide that proof

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

- commands (`build`, `test`, `format`, `analyze`, `coverage` if used)
- global skills and when to use them
- self-learning rules
- testing discipline
- design and maintainability rules
- exception policy
- topology for local `AGENTS.md` files

Project-local `AGENTS.md` files stay current with:

- local purpose and boundaries
- entry points
- project commands
- local risks
- stricter maintainability limits when needed
- exact applicable skills

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

### 4.6 Hard Rules for Instructions

- Every MCAF repo has a root `AGENTS.md`.
- Multi-project solutions use local `AGENTS.md` files at project roots.
- Agents read root and local `AGENTS.md` before editing code.
- Skills are preferred over improvised workflow when a skill matches the task.
- Numeric maintainability limits live in `AGENTS.md`, not in framework prose.

## 5. Coding and Testability

MCAF coding rules exist to keep systems changeable and testable.

### 5.1 Design Policy

- SOLID is mandatory.
- SRP and cohesion are mandatory.
- Prefer composition over inheritance unless inheritance is explicitly justified.
- Boundaries must support realistic tests through public interfaces.
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

### 7.2 Plan

For non-trivial work, record:

- files or boundaries to change
- tests to add or update
- docs to update
- risks and constraints

### 7.3 Implement

- implement code and tests together
- keep changes small and reviewable
- use the architecture map and nearest local `AGENTS.md` to stay in scope

### 7.4 Verify

Run verification in layers:

1. changed tests
2. related suite
3. broader required regressions
4. analyzers

### 7.5 Update Durable Context

After implementation:

- update feature docs
- update ADRs
- update the architecture map when boundaries changed
- update `AGENTS.md` or skills when rules or workflows changed

## 8. AI Participation Modes

MCAF supports three common AI participation modes.

### 8.1 Delegated

The agent executes scoped work under current docs, skills, and `AGENTS.md`.

### 8.2 Collaborative

The agent and engineer iterate together on design, code, tests, and docs.

### 8.3 Consultative

The agent reviews, critiques, or drafts options while humans retain implementation control.

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
- tests and analyzers are the real gates
