---
name: mcaf-solution-governance
description: "Set up or refine solution-level governance for MCAF repositories: root and project-local `AGENTS.md`, rule precedence, solution topology, skill routing, and maintainability-limit policy placement. Use when bootstrapping a repo, restructuring a multi-project solution, or tightening agent rules."
metadata:
  compatibility: "Requires repository write access; updates root or local `AGENTS.md` files and related governance docs."
---

# MCAF: Solution Governance

## Trigger On

- bootstrap or rewrite a repo-wide `AGENTS.md`
- add project-local `AGENTS.md` files for a multi-project solution
- clarify rule precedence, skill routing, or maintainability policy placement

## Value

- produce a concrete project delta: code, docs, config, tests, CI, or review artifact
- reduce ambiguity through explicit planning, verification, and final validation skills
- leave reusable project context so future tasks are faster and safer

## Do Not Use For

- writing feature specs or ADR content
- code-level refactoring without a governance change

## Inputs

- current repo topology and module roots
- every solution-owned backend, frontend, contract, test, infrastructure, and documentation root
- existing root or local `AGENTS.md` files
- actual build, test, format, and analyze commands
- the active stack when commands or tooling are platform-specific
- available model tiers, delegation capabilities, and repository risk boundaries for `MCAF-AI-001`
- feature/ADR locations and traceability expectations for `MCAF-REQ-001`

## Quick Start

1. Read the nearest `AGENTS.md` and confirm scope and constraints.
2. Run this skill's `Workflow` through the `Ralph Loop` until outcomes are acceptable.
3. Return the `Required Result Format` with concrete artifacts and verification evidence.

## Workflow

1. Read `references/agents-update-safety.md` and apply `MCAF-GOV-001`: inventory and read every existing root and local `AGENTS.md` completely before editing governance.
2. Read `references/monorepo-vertical-slices.md` and treat `MCAF-ARCH-001` as a non-optional solution invariant.
3. Read `references/model-tier-orchestration.md` and apply `MCAF-AI-001`: strong-model planning and review plus cost-efficient capable coding workers are mandatory for non-trivial implementation work.
4. Read `../mcaf-feature-spec/references/requirements-adr-traceability.md` and apply `MCAF-REQ-001`: non-trivial features require traceable requirements and architecture-affecting decisions require ADR implementation contracts before coding.
5. Merge current MCAF requirements into existing governance. Never replace, truncate, summarize away, omit, or weaken an existing rule; preserve the stricter rule and report conflicts.
6. Identify the single solution repository root, every solution-owned technical root, the canonical slice convention, and any project or module roots that need their own `AGENTS.md`.
7. Treat a solution-owned surface in another repository or an inconsistent/layer-first feature layout as migration debt. Do not describe it as compliant.
8. Keep the root file global:
   - shared workflow
   - shared commands
   - rule precedence
   - global skill list
   - maintainability-limit keys
   - the mandatory repository boundary and canonical vertical-slice convention
   - role-based planning and coding model-tier selection, worker instructions, escalation, and lead review gates
   - feature requirements, ADR triggers, implementation contracts, and traceability gates
9. Keep local files narrow:
   - project purpose
   - entry points
   - boundaries
   - owned slices and their paths
   - local commands
   - applicable skills
   - stricter local constraints
10. Resolve overlap explicitly. Local rules may be stricter or more specific, never silently weaker; they cannot weaken `MCAF-ARCH-001`, `MCAF-AI-001`, or `MCAF-REQ-001`.
11. When the stack is .NET, record:
   - the test framework
   - the runner model (`VSTest` or `Microsoft.Testing.Platform`)
   - the repo-root `.editorconfig` as the analyzer config owner
12. Put numeric maintainability limits in `AGENTS.md`, not in framework prose or skill bodies.

## Deliver

- one clear root `AGENTS.md`
- local `AGENTS.md` files only where boundaries justify them
- explicit precedence rules and skill-routing guidance
- an explicit `MCAF-ARCH-001` repository boundary, slice convention, and backend/frontend/contracts/tests/docs path map
- an explicit `MCAF-AI-001` model-tier policy for planning, bounded coding delegation, escalation, and lead review
- an explicit `MCAF-REQ-001` feature requirements, ADR implementation, and traceability gate

## Validate

- root and local responsibilities are not duplicated blindly
- local files do not weaken root policy
- maintainability keys are present and named consistently
- an agent can tell which `AGENTS.md` to read first for any path
- all solution-owned surfaces are mapped inside one repository
- every feature uses the same canonical slice name and convention across backend, frontend, contracts, tests, and docs
- local rules and ADRs do not present split repositories or layer-first feature ownership as compliant
- no pre-existing root or local rule, section, command, boundary, preference, or exception record was deleted, omitted, summarized away, or weakened
- the final diff proves updates were merged and that overlapping rules retain the stricter formulation
- non-trivial work uses the highest-capability suitable planning model and the least expensive capable coding workers when routing is available
- every delegated coding scope has a complete instruction packet, and the planning model owns review, integration, and final verification
- governance blocks implementation until feature requirements and required ADR implementation contracts are explicit and traceable

## Ralph Loop

Use the Ralph Loop for every task, including docs, architecture, testing, and tooling work.

1. Brainstorm first (mandatory):
   - analyze current state
   - define the problem, target outcome, constraints, and risks
   - generate options and think through trade-offs before committing
   - capture the recommended direction and open questions
2. Plan second (mandatory):
   - write a detailed execution plan from the chosen direction
   - list final validation skills to run at the end, with order and reason
3. Execute one planned step and produce a concrete delta.
4. Review the result and capture findings with actionable next fixes.
5. Apply fixes in small batches and rerun the relevant checks or review steps.
6. Update the plan after each iteration.
7. Repeat until outcomes are acceptable or only explicit exceptions remain.
8. If a dependency is missing, bootstrap it or return `status: not_applicable` with explicit reason and fallback path.

### Required Result Format

- `status`: `complete` | `clean` | `improved` | `configured` | `not_applicable` | `blocked`
- `plan`: concise plan and current iteration step
- `actions_taken`: concrete changes made
- `validation_skills`: final skills run, or skipped with reasons
- `verification`: commands, checks, or review evidence summary
- `remaining`: top unresolved items or `none`

For setup-only requests with no execution, return `status: configured` and exact next commands.

## Load References

- read `references/agents-update-safety.md` first
- read `references/monorepo-vertical-slices.md` second
- read `references/model-tier-orchestration.md` third
- read `../mcaf-feature-spec/references/requirements-adr-traceability.md` fourth
- read `references/rule-precedence.md` fifth
- use `references/project-agents-template.md` only when creating a local file
- use `references/dotnet-agents-pattern.md` when the solution stack is .NET

## Example Requests

- "Set up AGENTS for this mono-repo."
- "Set up AGENTS for this .NET solution."
- "Split governance between the solution root and each service."
- "Move maintainability limits into AGENTS and make precedence explicit."
