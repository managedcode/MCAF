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
Install or update MCAF for this repository using these canonical pages:
- https://mcaf.managed-code.com/tutorial
- https://mcaf.managed-code.com/templates
- https://mcaf.managed-code.com/skills

Rules:
- remove all legacy skills with prefix mcf-
- install only current skills with prefix mcaf-
- keep AGENTS.md in the repository root
- if this is a multi-project solution, create or update local AGENTS.md files per project
```

---

## 1. Open the Canonical Pages

Use these pages as the install surface:

- Tutorial: [https://mcaf.managed-code.com/tutorial](https://mcaf.managed-code.com/tutorial)
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

### 4.0 Remove Legacy `mcf-*` Skills First

Before installing current skills, delete old folders with prefix `mcf-` from your chosen target directory.

Codex:

```bash
find .codex/skills -maxdepth 1 -mindepth 1 -type d -name 'mcf-*' -exec rm -rf {} +
```

Claude Code:

```bash
find .claude/skills -maxdepth 1 -mindepth 1 -type d -name 'mcf-*' -exec rm -rf {} +
```

Optional verification:

```bash
find .codex/skills .claude/skills -maxdepth 1 -mindepth 1 -type d -name 'mcf-*' 2>/dev/null
```

The result should be empty.

For each selected skill:

1. Open the skill entry on the Skills page.
2. Open the `Raw SKILL` link for that skill.
3. Fetch `SKILL.md` into the target skill folder.
4. Read the skill’s `Load References` section and fetch only the referenced files you actually need from the same GitHub folder.

This keeps install deterministic without requiring manifests or archives.

### 4.1 Recommended .NET Bundle

For a .NET repository, the usual baseline is:

- `mcaf-dotnet`
- `mcaf-dotnet-features`
- `mcaf-solution-governance`
- `mcaf-testing`
- exactly one of:
  - `mcaf-dotnet-xunit`
  - `mcaf-dotnet-tunit`
  - `mcaf-dotnet-mstest`
- `mcaf-dotnet-quality-ci`
- `mcaf-dotnet-complexity`
- `mcaf-solid-maintainability`
- `mcaf-architecture-overview`
- `mcaf-ci-cd`

For .NET repositories, also make these repo-native artifacts explicit:

- a repo-root `.editorconfig` as the analyzer and formatting source of truth
- project-specific nested `.editorconfig` files when a subtree has a clear different purpose or policy
- `Directory.Build.props` or project files for bulk analyzer and runner settings
- target `TFM` and explicit `LangVersion` only when the repo intentionally differs from the SDK default
- whether the solution uses `VSTest` or `Microsoft.Testing.Platform`

The intended flow is:

- `mcaf-dotnet` is the entry skill for normal C# or .NET work
- `mcaf-dotnet-features` decides which modern language features are safe to use, especially for C# 13 on `.NET 9` and C# 14 on `.NET 10`
- the framework-specific test skill handles xUnit, TUnit, or MSTest mechanics
- after code changes, agents run the repo-defined quality pass: format, build, analyze, tests, coverage, and any configured extra gates

Add tool-specific .NET skills only when the repo standardizes on them:

<!-- MCAF:DOTNET-OPTIONAL-SKILLS-BEGIN -->
- Generated during site build from current `mcaf-dotnet-*` folders in `skills/`.
<!-- MCAF:DOTNET-OPTIONAL-SKILLS-END -->

### 4.2 Current Skill Catalog (Generated)

The website build generates this list from the actual folders under `skills/`.

<!-- MCAF:ALL-SKILLS-BEGIN -->
- Generated during site build from `skills/*/SKILL.md`
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
- no legacy `mcf-*` skill folders remain in the chosen skills directory
- local `AGENTS.md` files exist for project roots in a multi-project solution
- docs and commands are customized to the real repo

---

## 9. Suggested First Prompt After Install

Use a prompt like this:

```text
Analyze this solution and customize the root AGENTS.md.
If this is a multi-project solution, create project-local AGENTS.md files in each project root.
Then identify which MCAF skills apply to each project and document them in the local AGENTS files.
Finally, update docs/Architecture/Overview.md so agents can scope work without repo-wide scanning.
```
