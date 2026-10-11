# ADR Format Guidance

Use [adr-template.md](adr-template.md) as the canonical scaffold. Do not maintain a second full template here.

## Required Content

Any ADR format must preserve `MCAF-ARCH-001`, `MCAF-AI-001`, and `MCAF-REQ-001`: real context and alternatives, the approved decision, a rendered Mermaid diagram, requirements or operational obligations, an executable implementation contract, and verification evidence.

Use the repository's numbering and filename convention under `docs/ADR/`. Status is `Proposed` before approval, `Accepted` while delivery is pending, and `Implemented` only with complete implementation and verification evidence. Keep supersession links accurate.

## Compact Decision

For a contained decision, shorten prose and remove inapplicable optional fields. Keep the reason, alternative, consequences, affected contracts, approval, ordered implementation, migration/rollback where relevant, tests, and evidence. A compact format does not waive required policy gates.

## Options Matrix

When several plausible options need comparison, use a table in the canonical scaffold:

| Option | Meets requirements | Benefits | Costs / risks | Decision reason |
| --- | --- | --- | --- | --- |
| Candidate | Related `REQ-*` / obligation | Concrete benefit | Operational and migration impact | Accept / reject reason |

Compare options against the actual decision drivers; do not create an arbitrary number of alternatives. Diagram the chosen boundaries and record the implementation and verification contract once.
