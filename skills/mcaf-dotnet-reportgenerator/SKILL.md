---
name: mcaf-dotnet-reportgenerator
description: "Use the open-source free `ReportGenerator` tool for turning .NET coverage outputs into HTML, Markdown, Cobertura, badges, and merged reports. Use when raw coverage files are not readable enough for CI or human review."
compatibility: "Requires coverage artifacts such as Cobertura, OpenCover, or lcov; respects the repo's `AGENTS.md` commands first."
---

# MCAF: .NET ReportGenerator

## Trigger On

- the repo uses or wants `ReportGenerator`
- CI needs human-readable coverage reports
- multiple coverage files must be merged

## Do Not Use For

- raw coverage collection with no reporting need

## Inputs

- the nearest `AGENTS.md`
- existing coverage artifacts
- desired output formats

## Workflow

1. Keep collection and rendering separate: Coverlet collects, ReportGenerator renders.
2. Prefer the local or manifest-based .NET tool for reproducible CI runs.
3. Choose output formats deliberately:
   - `HtmlSummary`
   - `Cobertura`
   - `MarkdownSummaryGithub`
   - badges
4. Merge multiple reports only when the repo really needs a consolidated view.

## Deliver

- readable coverage artifacts for humans and CI systems
- explicit report-generation commands

## Validate

- report inputs match the generated coverage format
- generated reports land in a stable artifact path

## Load References

- read `references/reportgenerator.md` first

## Example Requests

- "Render coverage as HTML in CI."
- "Merge multiple Coverlet reports."
