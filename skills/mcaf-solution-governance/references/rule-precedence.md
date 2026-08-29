# Rule Precedence

Use this order whenever both root and local governance files exist:

1. Read the solution-root `AGENTS.md`.
2. Read the nearest local `AGENTS.md`.
3. Apply the stricter rule when both files cover the same topic.
4. If a local rule appears weaker than root policy, stop and clarify it before editing code.
5. Document justified exceptions explicitly in the nearest durable doc:
   - local `AGENTS.md`
   - ADR
   - feature doc

`MCAF-ARCH-001` is stricter than the general exception rule. A local file or ADR cannot weaken its single-repository and repo-wide vertical-slice target. It may only record a time-bounded migration deviation with an owner, target layout, verification, and removal date.

`MCAF-GOV-001` protects the governance files themselves. Installing or updating MCAF is a merge operation: all existing root and local rules remain mandatory and MUST NOT be deleted, omitted, summarized away, overwritten, or weakened. When incoming guidance overlaps, keep the stricter rule and report any real conflict.

`MCAF-AI-001` is the mandatory orchestration default for non-trivial implementation work. Local rules may require a stronger planning or coding tier, but they cannot make routine unplanned single-model coding the default or remove the planning model's review and integration accountability.

`MCAF-REQ-001` is the mandatory feature/decision traceability gate. Local rules may add requirement fields or stronger ADR triggers, but they cannot allow non-trivial implementation without stable requirements and acceptance criteria, omit a required architecture ADR, remove its implementation contract, or break traceability to tasks, tests, and evidence.

Root `AGENTS.md` owns:

- cross-solution workflow
- global commands
- global skill catalog
- default maintainability limits
- exception policy shape
- the mandatory `MCAF-ARCH-001` repository boundary and canonical vertical-slice convention
- mandatory `MCAF-GOV-001` preservation of all existing root and local governance rules during install or update
- mandatory `MCAF-AI-001` role-based planning and coding model tiers, worker instruction packets, escalation, and lead review
- mandatory `MCAF-REQ-001` feature requirements, ADR implementation contracts, and end-to-end traceability

Local `AGENTS.md` owns:

- entry points
- project boundaries
- local commands
- stricter local limits
- applicable skills
- project-specific risks
