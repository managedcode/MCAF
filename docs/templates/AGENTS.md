# AGENTS.md

> TEMPLATE NOTE: Copy this file to the solution root as `AGENTS.md`, then replace every `TODO:` and every `...` with repo-specific values. Delete this note once the file is customized.

Project: TODO
Stack: TODO

Follows [MCAF](https://mcaf.managed-code.com/)

---

## Purpose

This file defines how AI agents work in this solution.

- Root `AGENTS.md` holds the global workflow, shared commands, cross-cutting rules, and global skill catalog.
- In multi-project solutions, each project or module root MUST have its own local `AGENTS.md`.
- Local `AGENTS.md` files add project-specific entry points, boundaries, commands, risks, and applicable skills.

## Solution Topology

- Solution root: `...`
- Repository boundary: this repository contains the complete solution.
- Canonical slice convention: `.../Features/<SliceName>/...`
- Solution-owned surfaces that MUST stay in this repository:
  - backend applications and services: `...`
  - frontend applications: `...`
  - shared contracts: `...`
  - automated tests: `...`
  - infrastructure and deployment assets: `...`
  - durable documentation: `docs/...`
- Projects or modules with local `AGENTS.md` files:
  - `...`
  - `...`

## Mandatory Solution Architecture (`MCAF-ARCH-001`)

- This solution MUST be delivered as one repository. All solution-owned backend, frontend, contracts, tests, infrastructure, and documentation live here and are versioned together.
- Vertical-slice architecture is mandatory across the entire repository.
- Every feature MUST use one canonical `<SliceName>` across backend, frontend, contracts, tests, and `docs/Features/`.
- Every technical root MUST organize feature-owned work under the same `Features/<SliceName>/` convention, or use one fully colocated executable-artifact convention; durable feature docs remain under `docs/Features/<SliceName>.md`.
- A feature surface that does not apply MUST be recorded as `N/A` with a reason in the feature spec; it must not be silently omitted.
- Layer-first folders such as repository-level `Controllers`, `Services`, or `Repositories` MUST NOT own feature behaviour.
- Only genuinely solution-wide entry points, composition roots, building blocks, infrastructure, and global docs may live outside a feature slice.
- Local `AGENTS.md` files and ADRs may tighten these rules or document time-bounded migration debt, but MUST NOT make split repositories, layer-first feature ownership, or inconsistent slice names compliant.
- Existing deviations require a migration ADR with affected paths, owner, target layout, verification, and removal date. New work MUST use the target slice structure and MUST NOT expand the deviation.

## Rule Precedence

1. Read the solution-root `AGENTS.md` first.
2. Read the nearest local `AGENTS.md` for the area you will edit.
3. Apply the stricter rule when both files speak to the same topic.
4. Local `AGENTS.md` files may refine or tighten root rules, but they must not silently weaken them.
5. If a local rule needs an exception, document it explicitly in the nearest local `AGENTS.md`, ADR, or feature doc.
6. `MCAF-ARCH-001` has no target-architecture exception: a durable doc may record only a time-bounded migration deviation and may not declare that deviation compliant.

## MCAF Update Safety (`MCAF-GOV-001`)

- Every rule in this customized root `AGENTS.md` and every project-local `AGENTS.md` is mandatory repository policy.
- An MCAF install or update MUST read all existing root and local `AGENTS.md` files completely before editing them.
- Update by merging current requirements into the existing files. MUST NOT replace, overwrite, truncate, summarize away, or omit existing rules, sections, commands, boundaries, preferences, or exception records.
- MUST NOT weaken a rule by changing mandatory wording into optional guidance, narrowing its scope, reducing its priority, or adding a bypass.
- When incoming guidance overlaps or conflicts, preserve the stricter rule and report the conflict instead of silently rewriting policy.
- Template-only notes and placeholders may be replaced during first customization; a real rule may change only under explicit, rule-specific owner direction.
- Before completion, review the full governance diff and verify that every existing rule remains present and equally or more strict.

## Mandatory Feature Requirements and ADR Implementation (`MCAF-REQ-001`)

- Every non-trivial feature MUST have a real `docs/Features/<SliceName>.md` specification before implementation.
- The feature spec MUST contain stable `REQ-*` requirements and `AC-*` acceptance criteria with measurable pass/fail conditions, positive/negative/edge/error flows, and one canonical slice map.
- Every `REQ-*` MUST map to at least one `AC-*`; every `AC-*` MUST map to automated tests or an explicit exception with required manual evidence.
- The feature spec MUST link each required ADR, or record `ADR: N/A` with a concrete reason why existing architecture and contracts are sufficient.
- Create or update an ADR before implementing changes to boundaries, public contracts, data, dependencies, security/trust boundaries, deployment topology, cross-cutting standards, or migration architecture.
- Every required ADR MUST contain an implementation contract: related `REQ-*`/`AC-*`, ordered stages, exact slice/file ownership, dependencies, migration/rollout/rollback, tests, verification, agent roles, and integration/join points.
- An ADR MUST NOT be marked `Implemented` until its required implementation, migration, tests, docs, and verification evidence exist.
- Keep a traceability chain from `REQ-*` to `AC-*`, ADR, `TASK-*`, automated test, and final evidence. Update the whole chain before continuing when a requirement changes.

## Conversations (Self-Learning)

Learn the user's stable habits, preferences, and corrections. Record durable rules here instead of relying on chat history.

Before doing any non-trivial task, evaluate the latest user message.
If it contains a durable rule, correction, preference, or workflow change, update `AGENTS.md` first.
If it is only task-local scope, do not turn it into a lasting rule.

Update this file when the user gives:

- a repeated correction
- a permanent requirement
- a lasting preference
- a workflow change
- a high-signal frustration that indicates a rule was missed

Extract rules aggressively when the user says things equivalent to:

- "never", "don't", "stop", "avoid"
- "always", "must", "make sure", "should"
- "remember", "keep in mind", "note that"
- "from now on", "going forward"
- "the workflow is", "we do it like this"

Preferences belong in `## Preferences`:

- positive preferences go under `Likes`
- negative preferences go under `Dislikes`
- comparisons should become explicit rules or preferences

Corrections should update an existing rule when possible instead of creating duplicates.

Treat these as strong signals and record them immediately:

- anger, swearing, sarcasm, or explicit frustration
- ALL CAPS, repeated punctuation, or "don't do this again"
- the same mistake happening twice
- the user manually undoing or rejecting a recurring pattern

Do not record:

- one-off instructions for the current task
- temporary exceptions
- requirements that are already captured elsewhere without change

Rule format:

- one instruction per bullet
- place it in the right section
- capture the why, not only the literal wording
- remove obsolete rules when a better one replaces them

## Global Skills

List only the skills this solution actually uses.
Do not paste the whole framework catalog here.

- `<skill-name>` — when agents should use it
- `<skill-name>` — when agents should use it

If the stack is `.NET`, install the needed `.NET` skills from the [Managed Code Skills catalog](https://skills.managed-code.com/).
The usual baseline often includes:

- `mcaf-dotnet`
- `mcaf-dotnet-features`
- `mcaf-testing`
- exactly one of `mcaf-dotnet-xunit`, `mcaf-dotnet-tunit`, or `mcaf-dotnet-mstest`
- `mcaf-dotnet-quality-ci`
- `mcaf-dotnet-complexity`
- `mcaf-solid-maintainability`
- `mcaf-architecture-overview` if the repo keeps a maintained architecture map
- `mcaf-ci-cd`

If the stack is `.NET`, document skill-management rules explicitly:

- `.NET` skills are sourced from `https://skills.managed-code.com/`.
- `mcaf-dotnet` is the entry skill and routes to specialized `.NET` skills.
- Keep exactly one framework skill: `mcaf-dotnet-xunit` or `mcaf-dotnet-tunit` or `mcaf-dotnet-mstest`.
- Add tool-specific `.NET` skills only when the repository actually uses those tools in CI or local verification.
- Keep only `mcaf-*` skills in agent skill directories.
- When upgrading skills, recheck `build`, `test`, `format`, `analyze`, `complexity`, and `coverage` commands against the repo toolchain.

## Rules to Follow (Mandatory)

### Commands

- `build`: `...`
- `test`: `...`
- `format`: `...`
- `analyze`: `...` (delete if not used)
- `complexity`: `...` (delete if not used)
- `coverage`: `...` (delete if not used)

If the stack is `.NET`, also document:

- whether tests run on `VSTest` or `Microsoft.Testing.Platform`
- whether `format` is `dotnet format --verify-no-changes` or a checked-in wrapper over it
- whether coverage uses a VSTest collector, `coverlet.MTP`, or an MSTest SDK extension
- explicit `LangVersion` only when the repo intentionally differs from the SDK default

### Project AGENTS Policy

- Multi-project solutions MUST keep one root `AGENTS.md` plus one local `AGENTS.md` in each project or module root.
- Each local `AGENTS.md` MUST document:
  - project purpose
  - entry points
  - boundaries
  - project-local commands
  - applicable skills
  - local risks or protected areas
- If a project grows enough that the root file becomes vague, add or tighten the local `AGENTS.md` before continuing implementation.

### Agent Orchestration

- `MCAF-AI-001` is mandatory for non-trivial work: use the strongest suitable large or high-capability model available for planning, architecture, acceptance criteria, decomposition, integration, and final review.
- Do not begin delegated implementation until the planning model has made the scope, boundaries, contracts, acceptance criteria, test strategy, and ordered plan explicit.
- Do not begin write-capable delegated implementation until `MCAF-REQ-001` requirements and every required ADR implementation contract are approved.
- After planning, spawn cost-efficient coding workers for every independent, bounded implementation scope when a suitable cheaper model is available.
- Choose the least expensive model that is still capable of the language, framework, tools, context size, and risk level. Cost MUST NOT override correctness, security, or verification.
- Every coding worker MUST receive the goal, acceptance IDs, exact file/module/slice ownership, architecture and contracts to preserve, constraints, forbidden changes, expected artifacts, verification commands, and escalation conditions.
- Coding workers MUST stop and escalate rather than invent architecture, change public contracts, weaken tests or rules, or expand scope.
- The planning model MUST inspect every delegated diff, compare it with the plan and acceptance criteria, integrate the results, resolve conflicts, and own final quality gates and completion.
- Build an explicit task graph before spawning: task ID, requirements/acceptance IDs, owner, model tier/effort, permissions, dependencies, start condition, artifacts, verification, completion state, and join condition.
- Research and analysis agents SHOULD be read-only and may run in parallel before implementation. Use stronger reasoning for ambiguous architecture/security/review work and cost-efficient capable models for bounded discovery, log/test analysis, and documentation lookup.
- For large, non-trivial, cross-module, research-heavy, or implementation-heavy tasks, the lead agent's primary job is to plan the work, identify all parallelizable workstreams, split them into independent scopes, and spawn subagents to execute those scopes in parallel.
- Before writing the implementation plan, explicitly look for parallel tasks across research, code ownership areas, test creation, verification, documentation, and review.
- Spawn subagents for every independent workstream that can run safely in parallel unless there is a concrete coordination, risk, or ownership reason not to.
- Give each subagent a concrete responsibility, clear file or module ownership, expected output, and verification duty.
- Subagents that write code MUST own disjoint write scopes and must not revert or overwrite work from other agents.
- Shared contracts, solution files, central configuration, migrations, and cross-cutting docs MUST have exactly one integration owner. Same-file edits MUST be serialized.
- Use platform-native agent status, messaging, and wait controls. Monitor agents needing input or drifting; steer, retry, replace, or escalate them explicitly.
- Wait for every required dependency and result before integration. `idle`, partial output, a plan, or an unverified worker claim is not `complete`.
- Every delegated task MUST end as `complete`, `blocked`, `failed`, or `cancelled` with artifacts and evidence appropriate to that state. Blocked or failed tasks MUST NOT unblock dependants.
- The lead MUST verify the combined repository state after joining worker results; worker-local checks are not integrated proof.
- The lead agent remains responsible for the final architecture, integration, conflict resolution, quality gates, and completion criteria.
- Do not serialize independent work when safe parallel execution is available.
- Keep the orchestration lightweight for simple, short, or obvious tasks; do not create subagents when coordination overhead would be larger than the task.
- If non-trivial coding cannot be delegated because model-tier routing is unavailable, no cheaper model is capable, or safe ownership cannot be separated, record the concrete reason before the planning model implements it.

### Maintainability Limits

These limits are repo-configured policy values. They live here so the solution can tune them over time.

- `file_max_loc`: `400`
- `type_max_loc`: `200`
- `function_max_loc`: `50`
- `max_nesting_depth`: `3`
- `exception_policy`: `Document any justified exception in the nearest ADR, feature doc, or local AGENTS.md with the reason, scope, and removal/refactor plan.`

Local `AGENTS.md` files may tighten these values, but they must not loosen them without an explicit root-level exception.

### Task Delivery

- Start from `docs/Architecture.md` and the nearest local `AGENTS.md`.
- Treat `docs/Architecture.md` as the architecture map for every non-trivial task.
- If the overview is missing, stale, or diagram-free, update it before implementation.
- Apply mandatory policy `MCAF-ARCH-001` before choosing implementation paths.
- Keep each feature in one repository-wide vertical slice, using the same canonical slice name for its backend, frontend, contracts, tests, and documentation.
- Change all affected surfaces of the owning slice together; do not move one surface into another repository or an unrelated layer folder.
- Prefer the smallest relevant feature slice over repo-wide scanning so context stays narrow.
- Define scope before coding:
  - in scope
  - out of scope
- Keep context tight. Do not read the whole repo if the architecture map and local docs are enough.
- If the task matches a skill, use the skill instead of improvising.
- Analyze first:
  - current state
  - required change
  - constraints and risks
- Before starting a brainstorm, decide whether the task is actually non-trivial.
- For non-trivial work, create a root-level `<slug>.brainstorm.md` file before making code or doc changes.
- For simple, short, or obvious work, skip the brainstorm and go directly to execution.
- Use `<slug>.brainstorm.md` to capture the problem framing, options, trade-offs, risks, open questions, and the recommended direction.
- Think through the task in the brainstorm before committing to implementation details.
- Before creating `<slug>.plan.md`, create a root-level `<slug>.acceptance.md` file.
- The acceptance criteria file MUST be detailed enough that another agent or maintainer can implement and test the task without rereading the conversation.
- The acceptance criteria file MUST contain:
  - task goal and user-visible outcome
  - in-scope and out-of-scope behaviour
  - assumptions and open questions
  - actors, entry points, permissions, and affected boundaries
  - numbered criteria with stable IDs such as `AC-001`, `AC-002`, and `AC-003`
  - clear pass and fail conditions for every criterion
  - positive flows, negative flows, edge cases, and unexpected/error paths
  - data, contract, API, UI, persistence, performance, security, and observability expectations where relevant
  - migration, compatibility, and rollback expectations where relevant
  - a criterion-to-test matrix that maps each `AC-*` item to planned automated tests, test level, assertions, and verification commands
  - explicit criteria that will not receive automated coverage, with the reason and required manual or review evidence
- Do not start implementation until the acceptance criteria file exists and the test strategy maps back to it.
- After the acceptance criteria are written, create a root-level `<slug>.plan.md` file derived from `<slug>.acceptance.md`.
- Keep the `<slug>.plan.md` file as the working plan for the task until completion.
- The plan file MUST contain:
  - a link or reference to the chosen brainstorm
  - a link or reference to the acceptance criteria file
  - implementation steps derived from the accepted `AC-*` criteria
  - task goal and scope
  - a detailed implementation plan with detailed ordered steps
  - constraints and risks
  - explicit test steps as part of the ordered plan, not as a later add-on
  - a test plan derived from the `AC-*` criteria, with every criterion covered by tests or a documented exception
  - the test and verification strategy for each planned step
  - the testing methodology for the task: what flows will be tested, how they will be tested, and what quality bar the tests must meet
  - an explicit full-test baseline step after the plan is prepared
  - a tracked list of already failing tests, with one checklist item per failing test
  - root-cause notes and intended fix path for each failing test that must be addressed
  - a checklist with explicit done criteria for each step
  - ordered final validation skills and commands, with reason for each
- Use the Ralph Loop for every non-trivial task:
  - brainstorm in `<slug>.brainstorm.md` before coding or document edits
  - think through options and choose the intended direction before planning
  - turn the chosen direction into detailed acceptance criteria in `<slug>.acceptance.md`
  - map every acceptance criterion to planned automated tests or a documented test exception before coding
  - turn the chosen direction into a detailed `<slug>.plan.md`
  - include test creation, test updates, and verification work in the ordered steps from the start
  - once the initial plan is ready, run the full relevant test suite to establish the real baseline
  - if tests are already failing, add each failing test back into `<slug>.plan.md` as a tracked item with its failure symptom, suspected cause, and fix status
  - work through failing tests one by one: reproduce, find the root cause, apply the fix, rerun, and update the plan file
  - include ordered final validation skills in the plan file, with reason for each skill
  - require each selected skill to produce a concrete action, artifact, or verification outcome
  - execute one planned step at a time
  - mark checklist items in `<slug>.plan.md` as work progresses
  - update `<slug>.acceptance.md` when the criteria change, then update the mapped tests and plan before continuing
  - review findings, apply fixes, and rerun relevant verification
  - update the plan file and repeat until done criteria are met or an explicit exception is documented
- Implement code and tests together.
- Run verification in layers:
  - changed tests
  - related suite
  - broader required regressions
- If `build` is separate from `test`, run `build` before `test`.
- After tests pass, run `format`, then the final required verification commands.
- Run every repo-defined quality gate that is available for the stack and change scope, including analyzers, linters, complexity checks, coverage, architecture checks, security checks, and any other configured tools.
- The task is complete only when every planned checklist item is done, every acceptance criterion is satisfied, and all relevant tests are green.
- Summarize the change, risks, and verification before marking the task complete.

### Documentation

- All durable docs live in `docs/` (or `.wiki/` if the repo already uses it).
- `docs/Architecture.md` is the required global map and the first stop for agents.
- `docs/Architecture.md` MUST contain Mermaid diagrams for:
  - system or module boundaries
  - interfaces or contracts between boundaries
  - key classes or types for the changed area
- Keep one canonical source for each important fact. Link instead of duplicating.
- Public bootstrap templates are limited to root-level agent files. Authoring scaffolds for architecture, features, ADRs, and other workflows live in skills.
- Update feature docs when behaviour changes.
- Update ADRs when architecture, boundaries, or standards change.
- Every non-trivial feature doc MUST satisfy `MCAF-REQ-001`: stable `REQ-*` and `AC-*`, explicit ADR decision, multi-agent execution contract when applicable, and requirement-to-test evidence traceability.
- Every architecture-affecting ADR MUST include its implementation contract and MUST remain `Accepted` until implementation and verification are complete.
- For non-trivial work, the acceptance criteria file, plan file, feature doc, or ADR MUST document the testing methodology:
  - what flows are covered
  - how they are tested
  - which commands prove them
  - what quality and coverage requirements must hold
- Every feature doc under `docs/Features/` MUST contain at least one Mermaid diagram for the main behaviour or flow.
- Every ADR under `docs/ADR/` MUST contain at least one Mermaid diagram for the decision, boundaries, or interactions.
- Mermaid diagrams are mandatory in architecture docs, feature docs, and ADRs.
- Mermaid diagrams must render. Simplify them until they do.

### Testing

- TDD is the default for new behaviour and bug fixes: write the failing test first, make it pass, then refactor.
- Bug fixes start with a failing regression test that reproduces the issue.
- Tests MUST be written from acceptance criteria, not from implementation details.
- Each `AC-*` criterion in `<slug>.acceptance.md` MUST be covered by one or more automated tests or by an explicit written exception.
- Test names, display names, or comments should reference the relevant `AC-*` ID when that improves traceability.
- Every behaviour change needs new or updated automated tests with meaningful assertions. New tests are mandatory for new behaviour and bug fixes.
- Tests must prove the real user flow or caller-visible system flow, not only internal implementation details.
- Tests should be as realistic as possible and exercise the system through real flows, contracts, and dependencies.
- Tests must cover positive flows, negative flows, edge cases, and unexpected paths from multiple relevant angles when the behaviour can fail in different ways.
- Prefer integration/API/UI tests over isolated unit tests when behaviour crosses boundaries.
- Integration tests are the default primary proof for feature-slice behaviour that spans multiple components.
- Do not use mocks, fakes, stubs, or service doubles in verification.
- Exercise internal and external dependencies through real containers, test instances, or sandbox environments that match the real contract.
- Flaky tests are failures. Fix the cause.
- Changed production code MUST reach at least 80% line coverage, and at least 70% branch coverage where branch coverage is available.
- Critical flows and public contracts MUST reach at least 90% line coverage with explicit success and failure assertions.
- Repository or module coverage must not decrease without an explicit written exception. Coverage after the change must stay at least at the previous baseline or improve.
- Coverage is for finding gaps, not gaming a number. Coverage numbers do not replace scenario coverage or user-flow verification.
- The task is not done until the full relevant test suite is green, not only the newly added tests.
- If the stack is `.NET`, document the active framework and runner model explicitly so agents do not mix VSTest and Microsoft.Testing.Platform assumptions.
- If the stack is `.NET`, after changing production code run the repo-defined quality pass: format, build, analyze, focused tests, broader tests, complexity, coverage, and any configured extra gates such as architecture, security, or mutation checks.

### Code and Design

- Everything in this solution MUST follow SOLID principles by default.
- Every class, object, module, and service MUST have a clear single responsibility and explicit boundaries.
- SOLID is mandatory.
- SRP and strong cohesion are mandatory for files, types, and functions.
- Vertical-slice architecture and the single-repository boundary are mandatory under `MCAF-ARCH-001`.
- Each feature MUST live in one consistently named repository-wide slice with all feature-owned backend, frontend, contracts, tests, and supporting artifacts colocated or mirrored under the documented slice convention and its durable doc mapped by the same name under `docs/Features/`.
- Local rules and ADRs MUST NOT weaken `MCAF-ARCH-001`; they may only document stricter rules or a time-bounded migration to compliance.
- Prefer composition over inheritance unless inheritance is explicitly justified.
- Do not preserve obsolete, dead, duplicate, or replaced legacy code unless the user explicitly asks for a temporary compatibility path.
- When replacing an old implementation, remove the old code, tests, configuration, docs, and routing in the same change once the new path is proven.
- Do not leave compatibility shims, placeholder implementations, or fallback paths as a substitute for a complete migration.
- If a temporary transition path is unavoidable, document the reason, owner, scope, verification, and removal plan in the nearest ADR, feature doc, or local `AGENTS.md`.
- Large files, types, functions, and deep nesting are design smells. Split them or document a justified exception under `exception_policy`.
- Hardcoded values are forbidden.
- String literals are forbidden in implementation code. Declare them once as named constants, enums, configuration entries, or dedicated value objects, then reuse those symbols.
- Avoid magic literals. Extract shared values into constants, enums, configuration, or dedicated types.
- Design boundaries so real behaviour can be tested through public interfaces.
- If the stack is `.NET`, the repo-root `.editorconfig` is the source of truth for formatting, naming, style, and analyzer severity. Use nested `.editorconfig` files when they serve a clear subtree-specific purpose. Do not let IDE defaults, pipeline flags, and repo config disagree.

### Critical

- Never commit secrets, keys, or connection strings.
- Never skip tests to make a branch green.
- Never weaken a test or analyzer without explicit justification.
- Never introduce mocks, fakes, stubs, or service doubles to hide real behaviour in tests or local flows.
- Never keep legacy, obsolete, dead, duplicate, shim, placeholder, or fallback code unless an explicit documented exception requires it.
- Never introduce a non-SOLID design unless the exception is explicitly documented under `exception_policy`.
- Never spread one feature across unrelated folders when a vertical slice can keep it isolated.
- Never move solution-owned backend, frontend, tests, infrastructure, or documentation into a separate repository.
- Never use different names or different internal conventions for the same slice across technical roots.
- Never overwrite an existing root or local `AGENTS.md` with a downloaded template or a shortened reconstruction.
- Never delete, omit, or weaken an existing `AGENTS.md` rule during framework installation or update.
- Never force-push to `main`.
- Never approve or merge on behalf of a human maintainer.

### Boundaries

Always:

- Read root and local `AGENTS.md` files before editing code.
- Read the relevant docs before changing behaviour or architecture.
- Run the required verification commands yourself.

Ask first:

- changing public API contracts
- adding new dependencies
- modifying database schema
- deleting code files

## Preferences

### Likes

### Dislikes
