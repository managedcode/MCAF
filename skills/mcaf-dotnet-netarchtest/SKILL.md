---
name: mcaf-dotnet-netarchtest
description: "Use the open-source free `NetArchTest.Rules` library for architecture rules in .NET unit tests. Use when a repo wants lightweight, fluent architecture assertions for namespaces, dependencies, or layering."
compatibility: "Requires a .NET test project; works with any unit-test framework."
---

# MCAF: .NET NetArchTest

## Trigger On

- the repo uses or wants `NetArchTest.Rules`
- architecture rules should be enforced in automated tests

## Do Not Use For

- very rich architecture modeling that needs a heavier DSL

## Inputs

- the nearest `AGENTS.md`
- architecture boundaries to enforce
- target assemblies

## Workflow

1. Encode only durable architecture rules:
   - forbidden dependencies
   - namespace layering
   - type shape conventions
2. Keep rules readable and close to the boundary they protect.
3. Fail tests on architecture drift, not on temporary style noise.

## Deliver

- architecture tests that are understandable and stable

## Validate

- the rules map to real boundaries the team cares about
- failures point to actionable dependency drift

## Findings Loop

When this skill is used to run a checker, analyzer, test gate, or verification command:

1. Run the command in read-only or report mode first and collect findings.
2. Return a concise findings list with only actionable items:
   - rule or check id
   - `file:line`
   - one-line fix intent
3. Fix findings in small batches without hiding rules unless the repo already documents an exception.
4. Re-run the same command after each fix batch.
5. Repeat until the gate passes or only explicitly accepted exceptions remain.
6. Keep output trimmed: include counts and the top remaining items only, not raw full logs.

For setup-only requests that do not execute checks, return `status: configured` and the exact commands that should be run later.

## Load References

- read `references/netarchtest.md` first

## Example Requests

- "Add architecture tests with NetArchTest."
- "Block UI from referencing data directly."
