---
name: mcaf-source-control
description: "Define or refine branch, merge, commit, release, and repository ownership policy. Use for source-control governance or secrets-in-history response, not routine Git commands."
metadata:
  compatibility: "Requires repository access; may update contribution docs, AGENTS rules, or repository policy files."
---

# MCAF: Source Control

Read existing root/local `AGENTS.md`, branch protections, release conventions, and the user's authorized Git scope before changing policy.

## Workflow

1. Make the default/release branch model, merge strategy, review expectations, and tag/versioning rules explicit using the team's actual workflow.
2. Apply `MCAF-ARCH-001`: version solution-owned backend, frontend, contracts, tests, infrastructure, and docs together in one repository.
3. Apply `MCAF-REQ-001`: review changed behavior through requirements, acceptance, required ADR contracts, tasks, tests, and evidence; document statuses must match reality.
4. Preserve visible concurrent work. Never use `git stash` or automatic stashing. When the user requests committing all current changes, include the full requested scope on the current branch.
5. Do not force-push or bypass protections. Policy writing alone does not authorize pushing, merging, releasing, or rewriting history.
6. If a secret entered history, arrange authorized credential rotation before any separately approved history cleanup.

Deliver the requested contribution/governance changes and explain their practical effect. Do not silently introduce another branching strategy or repository.

## References

- For repository hygiene: [source-control policy](references/source-control.md).
- When defining a naming convention: [branch naming](references/naming-branches.md); preserve the existing user/repo prefix.
