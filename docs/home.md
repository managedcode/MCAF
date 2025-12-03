# Documentation Home

This repository uses the Managed Code Coding AI Framework (MCAF) and a root `AGENTS.md` to guide work with AI coding agents.

---

## Core references

- MCAF Guide: `docs/MCAF-Guide.md`
- Agent instructions: `AGENTS.md` (repository root)

---

## Feature documentation

- Folder: `docs/Features/`
- Purpose: describe what the system does, why, and under which rules.
- Template: `docs/templates/Feature.md`

Use these docs to describe new behaviour before heavy coding starts.

---

## Architecture decisions (ADR)

- Folder: `docs/ADR/`
- Purpose: record technical decisions, options, and consequences.
- Template: `docs/templates/ADR.md`
- Naming and filing: save accepted ADRs as `docs/ADR/ADR-XXXX-short-title.md` (kebab-case title); keep the template untouched in `docs/templates/`.

Each significant architectural or cross-cutting decision has an ADR.

---

## Architecture notes

- Folder: `docs/Architecture/`
- Purpose: explain how services and modules are structured and connected.
- Template: `docs/templates/Architecture.md` (if present)

Architecture docs link features, ADRs, APIs, and operations.

---

## Testing

- Folder: `docs/Testing/`
- Purpose: describe test strategy, levels, coverage, and feature-level test specs.
- Template: `docs/templates/Testing-Feature.md` (per feature)

Testing docs define which integration/API/UI tests prove behaviour.

---

## Development

- Folder: `docs/Development/`
- Purpose: local setup, commands, workflows, and tooling.
- Typical docs:
  - `Development-Setup.md`
  - `Development-Commands.md`
  - `Development-Workflow.md`

These docs define how to build, test, format, and analyze code.

---

## Operations

- Folder: `docs/Operations/`
- Purpose: deployments, monitoring, incidents, and runbooks.
- Template: `docs/templates/Runbook.md` (per service or feature)

Operations docs explain how to keep the system running and recover from failures.

---

## Templates

Templates live under `docs/templates/` and are cloned when creating new docs:

- `Feature.md` – feature specification
- `ADR.md` – architecture decision record
- `Architecture.md` – architecture note
- `Testing-Feature.md` – testing spec for a feature
- `Runbook.md` – operations runbook

Use these templates instead of inventing new formats.
