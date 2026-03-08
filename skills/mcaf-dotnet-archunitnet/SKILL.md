---
name: mcaf-dotnet-archunitnet
description: "Use the open-source free `ArchUnitNET` library for architecture rules in .NET tests. Use when a repo needs richer architecture assertions than lightweight fluent rule libraries usually provide."
compatibility: "Requires a .NET test project; supports dedicated integrations for xUnit, xUnit v3, MSTest, TUnit, and others where available."
---

# MCAF: .NET ArchUnitNET

## Trigger On

- the repo uses or wants `ArchUnitNET`
- architecture testing needs richer modeling than simple dependency checks

## Do Not Use For

- the lightest possible architecture rule checks

## Inputs

- the nearest `AGENTS.md`
- target assemblies
- architecture boundaries and naming conventions

## Workflow

1. Load the architecture once per test assembly where possible.
2. Encode a small number of durable, high-value architecture rules first.
3. Use the test-framework-specific integration package that matches the repo.

## Deliver

- architecture tests with richer domain and type modeling

## Validate

- architecture load cost is reasonable for the suite
- rules are stable and tied to real boundaries

## Load References

- read `references/archunitnet.md` first

## Example Requests

- "Use ArchUnitNET for layered architecture tests."
- "Set up ArchUnitNET with xUnit or MSTest."
