# Source Control

Source-control policy exists to keep collaboration predictable and reviewable.

## Baseline Rules

- `MCAF-ARCH-001` keeps all solution-owned backend, frontend, contracts, tests, infrastructure, and documentation in one repository and versions them together
- `MCAF-REQ-001` keeps feature requirements, ADR implementation contracts, tasks, tests, and evidence reviewable in the same change history
- one protected main branch is the default source of truth
- changes land through pull requests or an equally reviewable flow
- branch naming is explicit and documented
- merge strategy is chosen intentionally, not ad hoc
- secrets in git are treated as incidents

## Team Decisions to Make Early

- default branch and release branch model
- merge strategy: squash, rebase, or merge commit
- PR expectations: size, review, and verification
- tag and versioning rules, if the repo publishes artifacts

## Hygiene

- never use `git stash` or automatic stashing; preserve concurrent work visibly
- when asked to commit all current changes, include the full requested scope on the current branch
- never force-push or bypass protections
- keep commit messages understandable
- avoid long-lived branches unless the repo truly needs them
- prefer small PRs that can be reviewed coherently
- document the repo’s branch and merge rules in-repo

## Incident Rule

If a secret lands in git history, rotate it first and clean the history second.
