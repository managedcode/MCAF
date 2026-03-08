---
name: mcaf-source-control
description: "Set or refine source-control policy for repository structure, branch naming, merge strategy, commit hygiene, and secrets-in-git discipline. Use when bootstrapping a repo, tightening PR flow, or documenting branch and release policy."
compatibility: "Requires repository access; may update contribution docs, AGENTS rules, or repository policy files."
---

# MCAF: Source Control

## Trigger On

- bootstrapping source-control policy
- tightening branch, merge, or PR rules
- documenting commit or release hygiene
- dealing with secrets-in-git or repository structure issues

## Do Not Use For

- CI/CD workflow design with no source-control policy change
- one-off git commands that do not alter repo policy

## Inputs

- current branching and merge flow
- release strategy and versioning expectations
- secret-handling and repository-structure constraints

## Workflow

1. Agree on merge and release strategy before scaling implementation.
2. Keep branch and PR rules explicit in-repo.
3. Treat secrets in git history as a critical incident, not cleanup noise.
4. Use concrete policy language, not hand-waving.

## Deliver

- clear branch and merge strategy
- updated contribution or governance docs
- safer repository hygiene around commits, PRs, and secrets

## Validate

- naming and merge rules are explicit
- release/versioning implications are documented where needed
- secret hygiene is treated as policy, not tribal knowledge

## Load References

- read `references/source-control.md` first
- open `references/naming-branches.md` only when the task is specifically about branch naming

## Example Requests

- "Define branch naming and merge rules for this repo."
- "Document how releases and component versions should work."
- "Tighten our source-control policy after a secrets leak."
