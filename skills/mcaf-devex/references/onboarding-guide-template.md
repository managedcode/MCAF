# Onboarding Guide Template

Use this shape for a repo onboarding guide.

## Include

- project purpose
- mandatory policy `MCAF-ARCH-001`: the complete solution lives in one repository and feature work uses consistent repository-wide vertical slices
- mandatory policy `MCAF-AI-001`: strong-model planning and review with bounded coding delegated to the least expensive capable worker models
- mandatory policy `MCAF-REQ-001`: stable feature requirements and acceptance criteria, required ADR implementation contracts, and traceability through agent tasks, tests, and evidence
- a repository map covering backend, frontend, contracts, tests, infrastructure, and documentation
- the canonical `Features/<SliceName>/` convention and one real slice traced across every applicable technical root
- prerequisites
- setup steps
- build, run, and test commands
- common failure cases
- where architecture and workflow docs live

## Quality Rule

If a new engineer still needs chat help after following the guide, the guide is incomplete.

The guide is also incomplete if it points to another repository for a solution-owned surface or does not let a newcomer find the backend, frontend, contracts, tests, and docs for a slice using one canonical name.

Document how the runtime selects planning and coding model tiers, which work can be delegated, what every worker instruction must contain, and how the planning model reviews and integrates worker output.
