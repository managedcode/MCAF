@./AGENTS.md

`MCAF-ARCH-001`, `MCAF-GOV-001`, `MCAF-AI-001`, and `MCAF-REQ-001` are mandatory and inherited from the imported solution-root `AGENTS.md`.

For non-trivial features, do not start write-capable subagents or teammates until the feature `REQ-*`/`AC-*`, required ADR implementation contracts, task graph, disjoint ownership, completion evidence, and wait/join conditions are explicit. Use native Claude Code task status and waiting, then have the lead inspect and verify every joined result.
