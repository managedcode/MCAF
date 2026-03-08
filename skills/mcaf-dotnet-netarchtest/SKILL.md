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

## Load References

- read `references/netarchtest.md` first

## Example Requests

- "Add architecture tests with NetArchTest."
- "Block UI from referencing data directly."
