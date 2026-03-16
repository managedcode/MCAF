# Getting Started with MCAF v1.2

This tutorial is the canonical bootstrap flow for humans and agents.
It is intentionally separate from `README.md`:
- `README.md` explains MCAF concepts
- `TUTORIAL.md` explains installation and update steps

There is no shell installer in `v1.2`.
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

If you use Claude Code, also place `CLAUDE.md` at the repository root.

Example:

```bash
curl -fsSL https://raw.githubusercontent.com/managedcode/MCAF/main/docs/templates/AGENTS.md -o AGENTS.md
curl -fsSL https://raw.githubusercontent.com/managedcode/MCAF/main/docs/templates/CLAUDE.md -o CLAUDE.md
```

If you are not using Claude Code, `CLAUDE.md` is optional.

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
4. Read the skill’s `Load References` section and fetch only the referenced files you actually need from the same GitHub folder.

This keeps install deterministic without requiring manifests or archives.

### 4.0 For .NET Repositories

This repository no longer bundles `.NET` skills under `skills/`.
Fetch the required `.NET` skills from the [Managed Code Skills catalog](https://skills.managed-code.com/).

For `.NET` repositories, keep these repo-native artifacts explicit in `AGENTS.md`:

- a repo-root `.editorconfig` as the analyzer and formatting source of truth
- project-specific nested `.editorconfig` files when a subtree has a clear different purpose or policy
- `Directory.Build.props` or project files for bulk analyzer and runner settings
- target `TFM` and explicit `LangVersion` only when the repo intentionally differs from the SDK default
- whether the solution uses `VSTest` or `Microsoft.Testing.Platform`
- the non-trivial task flow: `<slug>.brainstorm.md` first, then `<slug>.plan.md`, then implementation and validation

The intended `.NET` flow stays the same even though the bundle is external:

- install the required skills from the external catalog
- use the skills that fit the repo workflow and test framework
- after code changes, run the repo-defined quality pass: format, build, analyze, tests, coverage, and any configured extra gates

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

`v1.2` keeps public templates minimal.

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

---

## 9. Suggested First Prompt After Install

Use a prompt like this:

```text
Analyze this solution and customize the root AGENTS.md.
If this is a multi-project solution, create project-local AGENTS.md files in each project root.
Then identify which MCAF skills apply to each project and document them in the local AGENTS files.
For non-trivial tasks, require a root-level <slug>.brainstorm.md before <slug>.plan.md.
Finally, update docs/Architecture.md so agents can scope work without repo-wide scanning.
```
