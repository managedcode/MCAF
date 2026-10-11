# Getting Started with MCAF v1.3

This tutorial is the canonical bootstrap flow for humans and agents.
It is intentionally separate from `README.md`:
- `README.md` explains MCAF concepts
- `TUTORIAL.md` explains installation and update steps

There is no shell installer in `v1.3`.
The install path is URL-first and simple:

1. fetch bootstrap templates
2. fetch the needed skill folders
3. place them in the right target directories
4. restart the agent

---

## 0. First Prompt to Paste into an AI Agent

Use this prompt first when you want to install or update MCAF in an existing repo:

```text
Install or update MCAF for this repository using the canonical tutorial:
- https://mcaf.managed-code.com/tutorial

Follow the tutorial end-to-end, including template and skill installation steps it references.

Rules:
- install only current skills with prefix mcaf-
- keep AGENTS.md in the repository root
- if this is a multi-project solution, create or update local AGENTS.md files per project
- if this is a .NET repo, fetch the needed skills from https://skills.managed-code.com/
- treat every rule in every existing root or local AGENTS.md as mandatory repository policy
- update AGENTS.md files by merging; never replace, truncate, summarize, or omit existing rules or sections
- never weaken a rule, reduce its scope or priority, add a bypass, or change mandatory wording into optional guidance
- if incoming MCAF guidance conflicts with an existing rule, preserve the stricter rule and report the conflict instead of silently rewriting policy
- for non-trivial work, use the strongest suitable large or high-capability model available for analysis, architecture, acceptance criteria, planning, decomposition, integration, and final review
- before write-capable agents start, require a feature spec with stable REQ-* and AC-* IDs plus every required ADR with an implementation contract
- after the plan is explicit, spawn bounded coding tasks on the least expensive capable models with exact instructions, disjoint ownership, dependencies, verification commands, completion states, wait/join conditions, and escalation rules
- wait for all required agent results, inspect every diff and evidence packet, then run integrated verification before completion
- inspect the complete affected code, callers, contracts, tests, and docs up front; implement all approved behavior and wiring, self-review code and tests, fix findings, and format before one planned verification phase
- preserve required repository gates; rerun affected checks only for a new change, concrete failure, or unresolved question
- require explicit user approval for architecture, serializers/serialization contracts, and other material changes; do routine work within the approved design without asking again
```

---

## 1. Open the Canonical Entry Point

Use the tutorial as the single canonical install surface:

- Tutorial: [https://mcaf.managed-code.com/tutorial](https://mcaf.managed-code.com/tutorial)

Direct links below are optional shortcuts when you need them:

- Templates: [https://mcaf.managed-code.com/templates](https://mcaf.managed-code.com/templates)
- Skills: [https://mcaf.managed-code.com/skills](https://mcaf.managed-code.com/skills)

Use these raw template files for direct download:

- Root `AGENTS.md`: [https://raw.githubusercontent.com/managedcode/MCAF/main/docs/templates/AGENTS.md](https://raw.githubusercontent.com/managedcode/MCAF/main/docs/templates/AGENTS.md)
- `CLAUDE.md`: [https://raw.githubusercontent.com/managedcode/MCAF/main/docs/templates/CLAUDE.md](https://raw.githubusercontent.com/managedcode/MCAF/main/docs/templates/CLAUDE.md)

---

## 2. Bootstrap the Repo Root

Always place `AGENTS.md` at the repository or solution root.

`MCAF-GOV-001` is mandatory during both installation and updates. Before changing governance, read the complete root `AGENTS.md` and every project-local `AGENTS.md`. Existing rules remain mandatory and MUST NOT be deleted, omitted, summarized away, overwritten, or weakened.

Policy details: [`MCAF-GOV-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solution-governance/references/agents-update-safety.md).

If you use Claude Code, also place `CLAUDE.md` at the repository root.

For a first bootstrap, download a template only when the target file does not already exist:

```bash
if [[ ! -e AGENTS.md ]]; then
  curl -fsSL https://raw.githubusercontent.com/managedcode/MCAF/main/docs/templates/AGENTS.md -o AGENTS.md
else
  printf '%s\n' 'AGENTS.md already exists; preserve it and merge the current template requirements.'
fi

if [[ ! -e CLAUDE.md ]]; then
  curl -fsSL https://raw.githubusercontent.com/managedcode/MCAF/main/docs/templates/CLAUDE.md -o CLAUDE.md
else
  printf '%s\n' 'CLAUDE.md already exists; preserve it and merge only required additions.'
fi
```

For an update:

1. Inventory and read the root and all local `AGENTS.md` files completely.
2. Fetch the current template to a separate temporary path, never to an existing `AGENTS.md` path.
3. Merge missing current requirements into the customized files.
4. Preserve every existing rule and keep the stricter wording when rules overlap.
5. Review the complete diff for deleted sections, softened verbs, narrowed scope, new bypasses, or missing commands and boundaries.
6. Stop and report a real conflict instead of resolving it by silently reducing a rule's importance.

If you are not using Claude Code, `CLAUDE.md` is optional.

### 2.1 Structure the Solution for AI Coding

Vertical-slice architecture means that one business capability is the ownership boundary across the complete solution. For example, `Orders` is one logical slice spanning its backend, frontend, contracts, tests, infrastructure, and `docs/Features/Orders.md`.

The solution means the complete product delivery boundary in this repository, not only a `.sln` or `.slnx` file and not only the backend project.

An AI coding agent uses the slice as its unit of context: it reads the architecture entry, root and local governance, feature doc, and matching implementation and test paths. It should not have to reconstruct a feature by searching unrelated top-level `Controllers`, `Services`, `Repositories`, `Components`, and test buckets.

Use one canonical name and mirrored structure when toolchains require separate projects:

```text
src/Backend/Features/<SliceName>/
src/Frontend/Features/<SliceName>/
src/Contracts/Features/<SliceName>/
tests/Features/<SliceName>/
docs/Features/<SliceName>.md
```

Alternatively, colocate executable artifacts under `features/<SliceName>/` when the toolchain supports it. Durable feature docs still live under `docs/Features/` with the same slice name.

During setup:

1. Inventory every backend, frontend, contract, test, infrastructure, and documentation root in the repository.
2. Choose one `<SliceName>` naming and casing convention.
3. Record the exact paths and required internal shape in root `AGENTS.md`.
4. Add the repository boundary and slice-to-surface map to `docs/Architecture.md`.
5. Create or update local `AGENTS.md` files so each project names the slices and paths it owns.
6. Keep feature-owned code in its slice; use shared folders only for dependencies genuinely owned by multiple slices.
7. For every change, update and verify all affected surfaces of the same slice together.

Canonical details: [`MCAF-ARCH-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solution-governance/references/monorepo-vertical-slices.md).

### 2.2 Configure Mandatory Model-Tier Orchestration

`MCAF-AI-001` is mandatory for non-trivial implementation work.

Configure root `AGENTS.md` so that:

1. The strongest suitable large or high-capability model available owns discovery, architecture, acceptance criteria, test strategy, the ordered plan, and task decomposition.
2. No coding worker starts before its scope, contracts, constraints, tests, and pass conditions are explicit.
3. Independent, bounded coding scopes are spawned on the least expensive models that remain capable of the stack, tools, context, and risk level.
4. Every worker receives exact file/module/slice ownership, expected artifacts, forbidden changes, verification commands, and an instruction to stop on ambiguity.
5. The planning model reviews every worker diff, integrates the result, resolves conflicts, and owns final quality gates.
6. A non-trivial task that cannot use cheaper coding workers records the concrete reason before the planning model implements it directly.
7. Every delegated task records its `TASK-*`, `REQ-*`, and `AC-*` IDs, role/model tier, exact read/write ownership, dependencies, start condition, expected evidence, and join condition.
8. Write-capable agents own disjoint files or slices; shared contracts, migrations, solution files, and central docs have one integration owner.
9. The lead monitors native agent status, steers or replaces stuck work, and waits until every required task is explicitly `complete`, `blocked`, `failed`, or `cancelled`.
10. Only verified `complete` results may unblock dependent tasks. The lead inspects joined output and proves the combined repository state.

Do not hard-code temporary product names unless the repository intentionally pins them. Prefer durable roles such as `planning tier: highest-capability suitable model` and `coding tier: least expensive capable model`.

Canonical details: [`MCAF-AI-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solution-governance/references/model-tier-orchestration.md).

Inspect the actual runtime's models, roles, permissions, and native delegation/status/wait controls. Use durable capability roles rather than model names or commands that may become stale:

| Role | Selection rule | Ownership |
| --- | --- | --- |
| Lead / architect | Highest-capability suitable model | Requirements, decisions, task graph, integration, final quality |
| Explorer / researcher | Least expensive capable model; stronger reasoning for ambiguity | Read-only discovery and evidence |
| Coding worker | Least expensive model proven capable of the bounded stack/tool/risk scope | Disjoint writes, fixed contracts, complete implementation and tests |
| Independent reviewer | Suitable correctness/security reasoning capability | Read-only requirement, code, and test review |

For exact product configuration, consult the current official [Codex subagents](https://developers.openai.com/codex/subagents), [Claude Code parallel agents](https://code.claude.com/docs/en/agents), [subagents](https://code.claude.com/docs/en/sub-agents), or [agent teams](https://code.claude.com/docs/en/agent-teams) documentation as applicable. Record unsupported capabilities instead of inventing an adapter. Escalate incapable workers without lowering requirements.

Use a spawn request shaped like this:

```text
Keep the lead on the highest-capability suitable planning tier.
Read the approved feature requirements and ADR implementation contract.
Create one TASK-* per independent workstream and record dependencies.
Spawn read-only explorers for discovery and the least expensive capable coding workers for disjoint write scopes.
Give each worker its REQ-*/AC-* IDs, exact owned paths, preserved contracts, forbidden changes, required artifacts, test commands, pass conditions, and escalation rules.
Monitor native task status. Steer or replace blocked, failed, or drifting workers.
Wait for every required task; do not treat idle or partial output as complete.
After all join conditions are satisfied, inspect every diff and evidence packet, run integrated verification, and report the requirement-to-test results.
```

### 2.3 Require Feature Requirements and ADR Implementation Contracts

`MCAF-REQ-001` is mandatory for every non-trivial feature.

Before implementation:

1. Create or update `docs/Features/<SliceName>.md` from `mcaf-feature-spec`.
2. Give every requirement a stable `REQ-*` ID, type, priority, rationale, measurable pass/fail conditions, and one or more `AC-*` acceptance criteria.
3. Record an ADR link or `ADR: N/A` with the concrete reason existing architecture and contracts are sufficient.
4. Create or update an ADR before changing boundaries, public contracts, data, dependencies, security, deployment topology, cross-cutting standards, or migration architecture.
5. Require the ADR to define ordered implementation stages, exact ownership, dependencies, migration/rollout/rollback, agent roles, tests, pass conditions, and integration/join evidence.
6. Keep one traceability matrix from `REQ-*` to `AC-*`, ADR, `TASK-*`, automated test, and final evidence.
7. Do not mark a feature `Verified` or ADR `Implemented` until the mapped implementation and verification are complete.

Canonical details: [`MCAF-REQ-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-feature-spec/references/requirements-adr-traceability.md).

---

## 3. Choose the Agent Skill Directory

Use one of these target directories:

- Codex: `.codex/skills/`
- Claude Code: `.claude/skills/`

Create the directory if it does not exist:

```bash
mkdir -p .codex/skills
mkdir -p .claude/skills
```

Only create the directory for the agent runtime you actually use.

---

## 4. Fetch the Skill Folders

Get the available skills from:

- Skills page: [https://mcaf.managed-code.com/skills](https://mcaf.managed-code.com/skills)

For each selected skill:

1. Open the skill entry on the Skills page.
2. Open the `Raw SKILL` link for that skill.
3. Fetch `SKILL.md` into the target skill folder.
4. Follow the skill's reference links and fetch only the files needed for the active task, preserving relative paths. If a link points into another skill folder, fetch that required reference at the matching path too.

Read the installed repository's `AGENTS.md` for the shared task workflow and approval rules. Skill entrypoints add task-specific guidance; references are conditional, not a list to load in full. When updating a skill, keep its name and folder stable, replace its files with the current version, and review removed resources before deleting them. Governance updates still follow `MCAF-GOV-001`.

This keeps install deterministic without requiring manifests or archives.

### 4.0 For .NET Repositories

This repository no longer bundles `.NET` skills under `skills/`.
Fetch the required `.NET` skills from the [Managed Code Skills catalog](https://skills.managed-code.com/).

The mandatory repository and slice contract is [`MCAF-ARCH-001`](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solution-governance/references/monorepo-vertical-slices.md).

For `.NET` repositories, keep these repo-native artifacts explicit in `AGENTS.md`:

- a repo-root `.editorconfig` as the analyzer and formatting source of truth
- project-specific nested `.editorconfig` files when a subtree has a clear different purpose or policy
- `Directory.Build.props` or project files for bulk analyzer and runner settings
- target `TFM` and explicit `LangVersion` only when the repo intentionally differs from the SDK default
- whether the solution uses `VSTest` or `Microsoft.Testing.Platform`
- the decision rule for `brainstorm`: use `<slug>.brainstorm.md` only for non-trivial tasks, then `<slug>.plan.md`, then implementation and validation
- mandatory `MCAF-ARCH-001` rules: all solution-owned backend, frontend, contracts, tests, infrastructure, and docs stay in one repository
- one canonical vertical-slice name and internal convention reused across every applicable technical root
- self-learning rules so repeated corrections become durable repo guidance

The intended `.NET` flow stays the same even though the bundle is external:

- install the required skills from the external catalog
- use the skills that fit the repo workflow and test framework
- after code changes, run the repo-defined quality pass: format, build, analyze, tests, complexity, coverage, and any configured extra gates

### 4.1 Current Skill Catalog (Generated)

The website build generates this list from the actual folders under `skills/`.

`.NET` skills are excluded here because they live in the external repository above.

<!-- MCAF:ALL-SKILLS-BEGIN -->
- `mcaf-adr-writing` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-adr-writing), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-adr-writing/SKILL.md)
- `mcaf-agile-delivery` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-agile-delivery), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-agile-delivery/SKILL.md)
- `mcaf-architecture-overview` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-architecture-overview), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-architecture-overview/SKILL.md)
- `mcaf-ci-cd` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-ci-cd), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-ci-cd/SKILL.md)
- `mcaf-code-review` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-code-review), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-code-review/SKILL.md)
- `mcaf-devex` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-devex), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-devex/SKILL.md)
- `mcaf-documentation` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-documentation), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-documentation/SKILL.md)
- `mcaf-feature-spec` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-feature-spec), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-feature-spec/SKILL.md)
- `mcaf-human-review-planning` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-human-review-planning), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-human-review-planning/SKILL.md)
- `mcaf-ml-ai-delivery` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-ml-ai-delivery), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-ml-ai-delivery/SKILL.md)
- `mcaf-nfr` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-nfr), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-nfr/SKILL.md)
- `mcaf-observability` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-observability), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-observability/SKILL.md)
- `mcaf-security-baseline` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-security-baseline), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-security-baseline/SKILL.md)
- `mcaf-solid-maintainability` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solid-maintainability), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-solid-maintainability/SKILL.md)
- `mcaf-solution-governance` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-solution-governance), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-solution-governance/SKILL.md)
- `mcaf-source-control` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-source-control), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-source-control/SKILL.md)
- `mcaf-testing` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-testing), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-testing/SKILL.md)
- `mcaf-ui-ux` — [Folder](https://github.com/managedcode/MCAF/blob/main/skills/mcaf-ui-ux), [Raw SKILL](https://raw.githubusercontent.com/managedcode/MCAF/main/skills/mcaf-ui-ux/SKILL.md)
<!-- MCAF:ALL-SKILLS-END -->

---

## 5. Multi-Project Solutions

For multi-project solutions:

- keep one root `AGENTS.md` at the solution root
- add one local `AGENTS.md` at each project or module root

Do not create local files ad hoc.
Use the `mcaf-solution-governance` skill to define:

- project purpose
- entry points
- boundaries
- project-local commands
- applicable skills
- stricter local maintainability limits, if needed

Project-local `AGENTS.md` files refine root rules.
They do not silently weaken root policy.

---

## 6. Maintainability Limits Live in AGENTS.md

Numeric limits are repo policy, not framework constants.

Put them in root `AGENTS.md` under `Maintainability Limits`:

- `file_max_loc`
- `type_max_loc`
- `function_max_loc`
- `max_nesting_depth`
- `exception_policy`

Project-local `AGENTS.md` files may tighten these limits for a specific area.

Use the `mcaf-solid-maintainability` skill for:

- SOLID and SRP guidance
- split/refactor workflow
- documenting justified exceptions

---

## 7. Where the Authoring Scaffolds Live

`v1.3` keeps public templates minimal.

Public templates:

- `AGENTS.md`
- `CLAUDE.md`

Authoring scaffolds are now loaded through skills:

- architecture overview scaffold: `mcaf-architecture-overview`
- feature spec scaffold: `mcaf-feature-spec`
- ADR scaffold: `mcaf-adr-writing`
- project-local `AGENTS.md` scaffold: `mcaf-solution-governance`

This keeps public pages small and lets agents fetch only the guidance they need.

---

## 8. Restart the Agent

After placing the skill folders in the target directory, restart the agent runtime so it reloads the installed skills.

The bootstrap is complete when:

- root `AGENTS.md` exists
- the right skill folders exist in the chosen skills directory
- local `AGENTS.md` files exist for project roots in a multi-project solution
- docs and commands are customized to the real repo
- root `AGENTS.md` defines the mandatory `MCAF-AI-001` planning tier, coding tier, task graph, worker instruction packet, native status/wait, completion states, join, escalation, and lead review rules
- root `AGENTS.md` defines mandatory `MCAF-REQ-001` feature requirements, ADR triggers and implementation contracts, plus traceability through tasks, tests, and evidence
- root `AGENTS.md` requires complete implementation and code/test self-review before planned verification, and user approval for architecture, serialization, and other material decisions while allowing routine work autonomously

---

## 9. Suggested First Prompt After Install

Use a prompt like this:

```text
Analyze this solution and customize the root AGENTS.md.
If this is a multi-project solution, create project-local AGENTS.md files in each project root.
Then identify which MCAF skills apply to each project and document them in the local AGENTS files.
For non-trivial tasks, require a root-level <slug>.brainstorm.md before <slug>.plan.md, but skip brainstorm for simple or obvious tasks.
Make MCAF-ARCH-001 mandatory: keep every solution-owned backend, frontend, contract, test, infrastructure, and documentation artifact in this repository.
Use one canonical vertical-slice name and one consistent feature-first convention across every applicable technical root; local AGENTS files and ADRs must not weaken this rule.
Require MCAF-AI-001 for non-trivial work: use the strongest suitable large or high-capability model available for planning, architecture, acceptance criteria, decomposition, integration, and final review; delegate bounded coding scopes to the least expensive capable models with exact instructions, disjoint ownership, dependencies, status/wait, completion evidence, and join gates.
Require MCAF-REQ-001: every non-trivial feature has stable REQ-* and AC-* before implementation; every architecture-affecting decision has an ADR with an ordered implementation contract; trace requirements through ADRs, TASK-*, tests, and final evidence.
Treat integration tests, self-learning, and full quality-gate execution as non-negotiable repo rules.
Inspect the complete affected flow before coding, implement every approved variant and integration, self-review code and tests, fix findings, and format before one planned verification phase. Keep TDD and the Ralph Loop purposeful; rerun checks only for a new change, concrete failure, or unresolved question.
Require explicit user approval before architecture, serializer/serialization, or other material contract, data, security, dependency, or deployment changes. Preserve prior authorization and do routine work within the agreed design without asking again.
Finally, update docs/Architecture.md so agents can scope work without repo-wide scanning.
```
