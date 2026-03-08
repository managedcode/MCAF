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
- Projects or modules with local `AGENTS.md` files:
  - `...`
  - `...`

## Rule Precedence

1. Read the solution-root `AGENTS.md` first.
2. Read the nearest local `AGENTS.md` for the area you will edit.
3. Apply the stricter rule when both files speak to the same topic.
4. Local `AGENTS.md` files may refine or tighten root rules, but they must not silently weaken them.
5. If a local rule needs an exception, document it explicitly in the nearest local `AGENTS.md`, ADR, or feature doc.

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

If the stack is `.NET`, this usually includes:

- `mcaf-dotnet`
- `mcaf-dotnet-features`
- `mcaf-testing`
- exactly one of `mcaf-dotnet-xunit`, `mcaf-dotnet-tunit`, or `mcaf-dotnet-mstest`
- `mcaf-dotnet-quality-ci`
- `mcaf-dotnet-complexity`
- `mcaf-solid-maintainability`
- `mcaf-architecture-overview` if the repo keeps a maintained architecture map
- `mcaf-ci-cd`

## Rules to Follow (Mandatory)

### Commands

- `build`: `...`
- `test`: `...`
- `format`: `...`
- `analyze`: `...` (delete if not used)
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

### Maintainability Limits

These limits are repo-configured policy values. They live here so the solution can tune them over time.

- `file_max_loc`: `400`
- `type_max_loc`: `200`
- `function_max_loc`: `50`
- `max_nesting_depth`: `3`
- `exception_policy`: `Document any justified exception in the nearest ADR, feature doc, or local AGENTS.md with the reason, scope, and removal/refactor plan.`

Local `AGENTS.md` files may tighten these values, but they must not loosen them without an explicit root-level exception.

### Task Delivery

- Start from `docs/Architecture/Overview.md` and the nearest local `AGENTS.md`.
- Treat `docs/Architecture/Overview.md` as the architecture map for every non-trivial task.
- If the overview is missing, stale, or diagram-free, update it before implementation.
- Define scope before coding:
  - in scope
  - out of scope
- Keep context tight. Do not read the whole repo if the architecture map and local docs are enough.
- If the task matches a skill, use the skill instead of improvising.
- Analyze first:
  - current state
  - required change
  - constraints and risks
- For non-trivial work, keep a written implementation plan in the feature doc, ADR, issue, or PR description.
- Implement code and tests together.
- Run verification in layers:
  - changed tests
  - related suite
  - broader required regressions
- If `build` is separate from `test`, run `build` before `test`.
- After tests pass, run `format`, then the final required verification commands.
- Summarize the change, risks, and verification before marking the task complete.

### Documentation

- All durable docs live in `docs/` (or `.wiki/` if the repo already uses it).
- `docs/Architecture/Overview.md` is the required global map and the first stop for agents.
- `docs/Architecture/Overview.md` MUST contain Mermaid diagrams for:
  - system or module boundaries
  - interfaces or contracts between boundaries
  - key classes or types for the changed area
- Keep one canonical source for each important fact. Link instead of duplicating.
- Public bootstrap templates are limited to root-level agent files. Authoring scaffolds for architecture, features, ADRs, and other workflows live in skills.
- Update feature docs when behaviour changes.
- Update ADRs when architecture, boundaries, or standards change.
- Every feature doc under `docs/Features/` MUST contain at least one Mermaid diagram for the main behaviour or flow.
- Every ADR under `docs/ADR/` MUST contain at least one Mermaid diagram for the decision, boundaries, or interactions.
- Mermaid diagrams are mandatory in architecture docs, feature docs, and ADRs.
- Mermaid diagrams must render. Simplify them until they do.

### Testing

- TDD is the default for new behaviour and bug fixes: write the failing test first, make it pass, then refactor.
- Bug fixes start with a failing regression test that reproduces the issue.
- Every behaviour change needs automated tests with meaningful assertions.
- Tests must prove the user flow or caller-visible system flow, including the happy path and the most important failure or edge path.
- Prefer integration/API/UI tests over isolated unit tests when behaviour crosses boundaries.
- Do not use mocks, fakes, stubs, or service doubles in verification.
- Exercise internal and external dependencies through real containers, test instances, or sandbox environments that match the real contract.
- Flaky tests are failures. Fix the cause.
- Changed production code MUST reach at least 80% line coverage, and at least 70% branch coverage where branch coverage is available.
- Critical flows and public contracts MUST reach at least 90% line coverage with explicit success and failure assertions.
- Repository or module coverage must not decrease without an explicit written exception.
- Coverage is for finding gaps, not gaming a number. Coverage numbers do not replace scenario coverage or user-flow verification.
- If the stack is `.NET`, document the active framework and runner model explicitly so agents do not mix VSTest and Microsoft.Testing.Platform assumptions.
- If the stack is `.NET`, after changing production code run the repo-defined quality pass: format, build, analyze, focused tests, broader tests, coverage, and any configured extra gates such as architecture, security, or mutation checks.

### Code and Design

- Everything in this solution MUST follow SOLID principles by default.
- Every class, object, module, and service MUST have a clear single responsibility and explicit boundaries.
- SOLID is mandatory.
- SRP and strong cohesion are mandatory for files, types, and functions.
- Prefer composition over inheritance unless inheritance is explicitly justified.
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
- Never introduce a non-SOLID design unless the exception is explicitly documented under `exception_policy`.
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
