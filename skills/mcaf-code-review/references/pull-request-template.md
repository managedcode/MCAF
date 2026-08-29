# Pull Request Template

Use a PR template that helps the reviewer verify the change quickly.

## Suggested Sections

- summary
- in scope
- out of scope
- risk
- verification
- docs updated

## Mandatory Architecture Check (`MCAF-ARCH-001`)

- [ ] All solution-owned backend, frontend, contracts, tests, infrastructure, and docs changed by this PR remain in this repository.
- [ ] The change belongs to one or more named vertical slices, and every affected technical root uses the same canonical slice name.
- [ ] The owning slices use the repository's documented internal convention; no layer-first folder became the owner of feature behaviour.
- [ ] All affected slice surfaces changed together, or a non-applicable surface is recorded as `N/A` with a reason in the feature spec.
- [ ] Any existing deviation is reduced under its migration ADR; this PR does not expand it.

## Mandatory Model-Tier Check (`MCAF-AI-001`)

- [ ] The strongest suitable planning model owned analysis, architecture, acceptance criteria, decomposition, and the ordered plan for this non-trivial change.
- [ ] Independent bounded coding scopes were delegated to the least expensive capable models, or the concrete capability/risk/routing reason for a deviation is recorded.
- [ ] Every coding worker received exact ownership, constraints, expected artifacts, verification commands, and escalation conditions.
- [ ] The planning model reviewed every delegated diff and owns integration, conflicts, final quality gates, and completion.
- [ ] Every delegated task has stable IDs, disjoint write ownership, dependencies, an explicit completion state, verification evidence, and a satisfied join condition.
- [ ] The lead waited for all required results and verified the combined repository state.

## Mandatory Requirements and ADR Check (`MCAF-REQ-001`)

- [ ] The feature spec contains stable `REQ-*` and `AC-*` IDs with measurable pass/fail conditions.
- [ ] Every requirement traces to acceptance criteria, an ADR decision, `TASK-*`, automated tests or an explicit exception, and verification evidence.
- [ ] Every required ADR contains an ordered implementation contract with exact ownership, dependencies, migration/rollout/rollback, tests, and join evidence.
- [ ] No feature is marked `Verified` and no ADR is marked `Implemented` before the mapped implementation and verification are complete.

## Keep It Short

- do not repeat the whole ticket
- do not paste logs unless they are needed for review
- do not add sections reviewers never use
