---
name: mcaf-solution-governance
description: "Set up or refine solution-level governance for MCAF repositories: root and project-local `AGENTS.md`, rule precedence, solution topology, skill routing, and maintainability-limit policy placement. Use when bootstrapping a repo, restructuring a multi-project solution, or tightening agent rules."
compatibility: "Requires repository write access; updates root or local `AGENTS.md` files and related governance docs."
---

# MCAF: Solution Governance

## Trigger On

- bootstrap or rewrite a repo-wide `AGENTS.md`
- add project-local `AGENTS.md` files for a multi-project solution
- clarify rule precedence, skill routing, or maintainability policy placement

## Do Not Use For

- writing feature specs or ADR content
- code-level refactoring without a governance change

## Inputs

- current repo topology and module roots
- existing root or local `AGENTS.md` files
- actual build, test, format, and analyze commands
- the active stack when commands or tooling are platform-specific

## Workflow

1. Identify the solution root and any project or module roots that need their own `AGENTS.md`.
2. Keep the root file global:
   - shared workflow
   - shared commands
   - rule precedence
   - global skill list
   - maintainability-limit keys
3. Keep local files narrow:
   - project purpose
   - entry points
   - boundaries
   - local commands
   - applicable skills
   - stricter local constraints
4. Resolve overlap explicitly. Local rules may be stricter or more specific, never silently weaker.
5. When the stack is .NET, record:
   - the test framework
   - the runner model (`VSTest` or `Microsoft.Testing.Platform`)
   - the repo-root `.editorconfig` as the analyzer config owner
6. Put numeric maintainability limits in `AGENTS.md`, not in framework prose or skill bodies.

## Deliver

- one clear root `AGENTS.md`
- local `AGENTS.md` files only where boundaries justify them
- explicit precedence rules and skill-routing guidance

## Validate

- root and local responsibilities are not duplicated blindly
- local files do not weaken root policy
- maintainability keys are present and named consistently
- an agent can tell which `AGENTS.md` to read first for any path

## Load References

- read `references/rule-precedence.md` first
- use `references/project-agents-template.md` only when creating a local file
- use `references/dotnet-agents-pattern.md` when the solution stack is .NET

## Example Requests

- "Set up AGENTS for this mono-repo."
- "Set up AGENTS for this .NET solution."
- "Split governance between the solution root and each service."
- "Move maintainability limits into AGENTS and make precedence explicit."
