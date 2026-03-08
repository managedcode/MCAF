---
name: mcaf-ci-cd
description: "Design or refine CI/CD workflows, quality gates, release flow, and safe AI-assisted pipeline authoring. Use when adding or changing build pipelines, release stages, IaC-driven environments, or deployment rollback policy."
compatibility: "Requires repository access; may update CI workflows, pipeline docs, and release guidance."
---

# MCAF: CI/CD

## Trigger On

- adding or changing CI workflows
- defining release flow or rollback policy
- tightening pipeline quality gates
- writing or reviewing AI-assisted pipeline YAML

## Do Not Use For

- feature-level testing with no pipeline or release impact
- general source-control policy without CI/CD changes

## Inputs

- the current pipeline and release flow
- real build, test, analyze, and deploy steps
- environment and rollback constraints

## Workflow

1. Define the target flow first:
   - PR validation
   - integration-branch gates
   - non-production deployment
   - production promotion or release
2. Keep pipelines reviewable:
   - explicit build, test, and analyze steps
   - least-privilege secrets and permissions
   - rollback or fail-safe strategy
3. Treat AI-generated YAML as draft content until it is reviewed and validated.
4. For .NET repositories, make the quality gate explicit:
   - formatting ownership
   - analyzer ownership
   - coverage and report generation
   - runner model (`VSTest` or `Microsoft.Testing.Platform`)
5. Pull only the references that match the current delivery problem.

## Deliver

- CI/CD changes that are explicit, reproducible, and reviewable
- release documentation with rollback thinking
- pipeline rules aligned with MCAF verification

## Validate

- every stage has a clear purpose and failure signal
- rollback or safe failure is explicit
- secrets and permissions are minimized
- the pipeline matches the repo’s actual verification model

## Load References

- read `references/ci-cd.md` first
- for .NET quality gates, use `mcaf-dotnet-quality-ci`

## Example Requests

- "Design CI for this repo."
- "Tighten our deployment gates and rollback story."
- "Review this GitHub Actions YAML before we trust it."
