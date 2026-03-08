---
name: mcaf-documentation
description: "Create or refine durable engineering documentation: docs structure, navigation, source-of-truth placement, and writing quality. Use when a repo’s docs are missing, stale, duplicated, or hard to navigate, or when adding new durable engineering guidance."
compatibility: "Requires repository write access; updates docs and documentation structure."
---

# MCAF: Documentation

## Trigger On

- docs are missing, stale, duplicated, or hard to navigate
- a repo needs a cleaner source-of-truth structure
- durable engineering guidance needs to be added without bloating pages

## Do Not Use For

- writing a specific feature spec or ADR when that skill already fits
- dumping large template content into public pages

## Inputs

- current docs structure and entry pages
- the code, policy, or workflow that the docs should reflect
- duplicate or conflicting sources of truth

## Workflow

1. Decide the canonical location for each fact before writing.
2. Prefer navigational docs that link to detail instead of copying detail.
3. Keep bootstrap pages small; move workflow scaffolds into skills.
4. Update stale docs in the same change as the code or policy they describe.

## Deliver

- cleaner docs structure
- better source-of-truth placement
- docs that reflect the code and workflow that actually exist

## Validate

- each durable fact has one clear home
- entry pages route the reader correctly
- pages do not bloat with template or reference dumps
- docs match the real repo, not the intended future repo

## Load References

- read `references/documentation.md` for structure and documentation-quality guidance

## Example Requests

- "Clean up this docs mess."
- "Move process clutter out of public pages."
- "Make the repo docs navigable for an agent."
