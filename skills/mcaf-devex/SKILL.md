---
name: mcaf-devex
description: "Improve developer experience for multi-component solutions: onboarding, F5 contract, cross-platform tasks, local inner loop, and reproducible setup. Use when the repo is hard to run, debug, test, or onboard into."
compatibility: "Requires repository access; may update docs, task runners, devcontainer guidance, or local setup conventions."
---

# MCAF: Developer Experience

## Trigger On

- the repo is hard to run, test, debug, or onboard into
- local setup differs too much across contributors
- the inner loop is slow or undocumented

## Do Not Use For

- production deployment or pipeline policy
- pure documentation cleanup with no developer workflow impact

## Inputs

- the current local setup and first-run path
- actual build, run, debug, and test commands
- pain points in onboarding or the inner loop

## Workflow

1. Find the slowest or most fragile part of the inner loop:
   - clone and setup
   - build
   - run and debug
   - test
2. Standardize tasks before optimizing them.
3. Prefer one documented way to run the full solution locally.
4. Pull only the references that match the local-dev problem you are fixing.

## Deliver

- lower-friction local workflow
- better onboarding
- reproducible build, run, test, and debug paths

## Validate

- a newcomer can follow the docs without hidden setup knowledge
- the inner loop is explicit and reproducible
- cross-platform or containerized guidance is used only where it helps
- local development uses real services, containers, or sandbox environments instead of fakes or stubs

## Load References

- read `references/developer-experience.md` first
- open `references/onboarding-guide-template.md` only when relevant

## Example Requests

- "Make this repo easier to onboard into."
- "Document a sane local run and debug loop."
- "Fix the dev setup drift across machines."
