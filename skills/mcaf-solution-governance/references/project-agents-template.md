# Project-Local AGENTS.md

> Template for a project or module root inside a multi-project solution. Copy into the project root as `AGENTS.md`, then replace placeholders with real values.

Project: TODO
Owned by: TODO

Parent: `../AGENTS.md`

Architecture policy: `MCAF-ARCH-001` from the solution-root `AGENTS.md` is mandatory here and cannot be weakened locally.

Update safety: `MCAF-GOV-001` makes every customized rule in this file mandatory. MCAF updates merge into this file and MUST NOT replace, omit, summarize away, or weaken its existing content.

Model-tier orchestration: `MCAF-AI-001` is mandatory for non-trivial work in this project. Planning and final review use the root planning tier; bounded coding uses the least expensive capable worker tier unless a documented risk or capability constraint requires stronger execution.

Requirements and ADR traceability: `MCAF-REQ-001` is mandatory here. Non-trivial features require stable `REQ-*`/`AC-*`, an explicit ADR decision, implementation tasks, tests, and evidence; required ADRs must include an implementation contract before coding.

## Purpose

- What this project or module does:
- Why it exists in the solution:

## Entry Points

- `...`
- `...`

## Boundaries

- In scope:
- Out of scope:
- Protected or high-risk areas:

## Vertical Slice Ownership (`MCAF-ARCH-001`)

- Canonical slice root for this project or module: `.../Features/<SliceName>/`
- Slices owned here: `...`
- Backend paths by slice: `...` or `N/A` with reason
- Frontend paths by slice: `...` or `N/A` with reason
- Contract paths by slice: `...` or `N/A` with reason
- Test paths by slice: `...` or `N/A` with reason
- Feature documentation: `docs/Features/<SliceName>.md`

Rules:

- Use exactly the same canonical `<SliceName>` as every other backend, frontend, contract, test, and documentation surface in this repository.
- Keep feature-owned code under the slice; do not introduce project-level layer buckets that own feature behaviour.
- Keep every solution-owned surface in this repository. A local project rule cannot authorize a separate repository.
- Mark a genuinely non-applicable surface `N/A` with a reason instead of silently omitting it.

## Project Commands

- `build`: `...`
- `test`: `...`
- `format`: `...`
- `analyze`: `...` (delete if not used)

For .NET projects also document:

- the active test framework
- the runner model: `VSTest` or `Microsoft.Testing.Platform`
- whether analyzer severity lives in the repo-root `.editorconfig`

## Model-Tier Execution (`MCAF-AI-001`)

- Work safe for bounded coding workers: `...`
- Work that must remain with the planning model: `...`
- Worker ownership boundaries: `...`
- Required project-specific worker instructions: `...`
- Native status/wait mechanism and completion states: `...`
- Shared-file integration owner and join gate: `...`

## Feature and ADR Gate (`MCAF-REQ-001`)

- Feature docs owned by this project: `docs/Features/...`
- Requirement and acceptance ID convention: `REQ-*`, `AC-*`
- Project-specific ADR triggers: `...`
- ADR implementation owner and rollout evidence: `...`
- Traceability owner from requirements through tasks, tests, and evidence: `...`
- Escalation triggers: `...`
- Focused verification required before lead review: `...`

Coding workers MUST follow the root plan and contracts, remain inside their assigned scope, and stop on ambiguity. The planning model reviews and integrates every result.

## Applicable Skills

- `...`
- `...`

For .NET projects, install the needed `.NET` skills from the [Managed Code Skills catalog](https://skills.managed-code.com/).
The local skill list usually includes:

- `mcaf-testing`
- exactly one of `mcaf-dotnet-xunit`, `mcaf-dotnet-tunit`, or `mcaf-dotnet-mstest`
- `mcaf-dotnet-quality-ci`
- `mcaf-dotnet-complexity` when complexity gates are part of done

## Local Constraints

- Stricter maintainability limits, if any:
  - `file_max_loc`: `...`
  - `type_max_loc`: `...`
  - `function_max_loc`: `...`
  - `max_nesting_depth`: `...`
- Required local docs:
- Local exception policy:

## Local Rules

- Project-specific rules go here.
- Local rules may tighten root rules, but must not weaken them silently.
- Local rules MUST NOT weaken or redefine `MCAF-ARCH-001`; an existing deviation is migration debt and needs the repository-level migration record required by the root policy.
