---
name: mcaf-architecture-overview
description: "Create or update `docs/Architecture/Overview.md` as the global architecture map for a solution. Use when bootstrapping a repo, onboarding, or changing modules, boundaries, or contracts. Keep it navigational and use `references/overview-template.md` for scaffolding."
compatibility: "Requires repository write access; produces Markdown docs with Mermaid diagrams."
---

# MCAF: Architecture Overview

## Trigger On

- create the first repo-wide architecture map
- modules, boundaries, interfaces, or ownership changed
- onboarding is slow because there is no short "start here" system map

## Do Not Use For

- recording a single architecture decision with alternatives
- writing feature-level behaviour details

## Inputs

- current solution layout and entry points
- existing ADRs, feature docs, and boundary docs
- the nearest `AGENTS.md` files

## Workflow

1. Start from the current `docs/Architecture/Overview.md`; if it is missing, scaffold it from `references/overview-template.md`.
2. Build a short navigational overview:
   - system or module map
   - key boundaries and contracts
   - scoping hints
   - links to ADRs, feature docs, and high-signal code paths
3. Use only real names from the repo. No placeholders like "Module A".
4. Prefer Mermaid diagrams plus a tiny link index over long prose.
5. Split diagrams by boundary if the map becomes noisy.

## Deliver

- `docs/Architecture/Overview.md`
- a short architecture map that routes the reader to deeper docs

## Validate

- diagram nodes use real repo names
- every important box or boundary links to deeper material
- the file stays navigational instead of becoming an inventory dump
- the overview lets a new agent scope work without reading the whole repo

## Load References

- use `references/overview-template.md` only when scaffolding the file

## Example Requests

- "Create an architecture overview for this repo."
- "Update the overview after splitting the API and worker."
- "Make onboarding easier by adding a real module map."
