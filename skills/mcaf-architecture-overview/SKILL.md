---
name: mcaf-architecture-overview
description: "Create or refresh docs/Architecture.md as a concise map of real modules, boundaries, contracts, slices, and entry points. Use for onboarding or architecture documentation changes."
metadata:
  compatibility: "Requires repository write access; produces Markdown docs with Mermaid diagrams."
---

# MCAF: Architecture Overview

Read root/local `AGENTS.md`, the existing map, relevant source and contracts, ADRs, and feature docs. Document the actual system; do not turn a map update into an unapproved redesign.

## Workflow

1. Map the complete solution boundary under `MCAF-ARCH-001`: in-repository backend, frontend, contracts, tests, infrastructure, and docs, with one canonical name and convention per slice.
2. Show module boundaries, interfaces/contracts, and the key types for the active area with readable Mermaid diagrams using real repository names.
3. Add a small navigation index linking diagram elements to high-signal code, entry points, feature docs, and ADRs. Split crowded diagrams by boundary.
4. Under `MCAF-REQ-001`, link non-trivial slices to stable requirements/acceptance and required ADR implementation contracts with accurate status.
5. Record existing topology deviations as migration debt; do not present split solution repositories or layer-first feature ownership as compliant.
6. Review links, names, diagrams, and ownership against source. Keep behavior and decision details in their canonical feature/ADR docs.

Deliver a navigational `docs/Architecture.md` that lets the next agent find the complete affected flow without scanning unrelated code.

## References

- When scaffolding: [architecture overview template](references/overview-template.md).
