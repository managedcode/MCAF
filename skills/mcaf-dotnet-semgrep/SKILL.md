---
name: mcaf-dotnet-semgrep
description: "Use the open-source free Semgrep CLI for .NET and broader codebase security scanning. Use when a repo needs OSS-friendly CLI scanning, custom rules, or CI security checks without a private-repo platform lock-in."
compatibility: "Requires the Semgrep CLI in local or CI environments; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET Semgrep

## Trigger On

- the repo uses or wants Semgrep for .NET security scanning
- the team wants an OSS-friendly CLI scanner for local and CI runs

## Value

- produce a concrete project delta: code, docs, config, tests, CI, or review artifact
- reduce ambiguity through explicit planning, verification, and final validation skills
- leave reusable project context so future tasks are faster and safer

## Do Not Use For

- formatting or style checks

## Inputs

- the nearest `AGENTS.md`
- desired rule source: auto, local rules, or org rules
- CI environment

## Quick Start

1. Read the nearest `AGENTS.md` and confirm scope and constraints.
2. Run this skill's `Workflow` through the `Ralph Loop` until outcomes are acceptable.
3. Return the `Required Result Format` with concrete artifacts and verification evidence.

## Workflow

1. Use `semgrep scan` for local and offline-friendly CLI scanning.
2. Use `semgrep ci` only when the repo intentionally depends on Semgrep AppSec Platform.
3. Keep custom rules versioned in the repo if the team writes them.

## Bootstrap When Missing

If `Semgrep` is not configured yet:

1. Detect current state:
   - `command -v semgrep`
   - `python3 -m pip show semgrep`
2. Install via one path:
   - `brew install semgrep`
   - or `python3 -m pip install semgrep`
3. Select rule source (`--config auto` or repo-local rules) and check in local rules when used.
4. Add a CI step with explicit command, usually `semgrep scan --config auto`.
5. Run the command once and return `status: configured` or `status: improved`.
6. If the repository policy excludes Semgrep, return `status: not_applicable` with the active security gate.


## Deliver

- explicit Semgrep install and run commands
- CI-ready security scanning without hidden platform dependence

## Validate

- the chosen Semgrep mode matches the team's account and platform expectations
- rule sources are explicit

## Ralph Loop

Use the Ralph Loop for every task, including docs, architecture, testing, and tooling work.

1. Plan first (mandatory):
   - analyze current state
   - define target outcome, constraints, and risks
   - write a detailed execution plan
   - list final validation skills to run at the end, with order and reason
2. Execute one planned step and produce a concrete delta.
3. Review the result and capture findings with actionable next fixes.
4. Apply fixes in small batches and rerun the relevant checks or review steps.
5. Update the plan after each iteration.
6. Repeat until outcomes are acceptable or only explicit exceptions remain.
7. If a dependency is missing, bootstrap it or return `status: not_applicable` with explicit reason and fallback path.

### Required Result Format

- `status`: `complete` | `clean` | `improved` | `configured` | `not_applicable` | `blocked`
- `plan`: concise plan and current iteration step
- `actions_taken`: concrete changes made
- `validation_skills`: final skills run, or skipped with reasons
- `verification`: commands, checks, or review evidence summary
- `remaining`: top unresolved items or `none`

For setup-only requests with no execution, return `status: configured` and exact next commands.

## Load References

- read `references/semgrep.md` first

## Example Requests

- "Add Semgrep CLI scanning for this .NET repo."
- "Use Semgrep without a hosted platform dependency."
