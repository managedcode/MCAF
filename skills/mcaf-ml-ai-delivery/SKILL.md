---
name: mcaf-ml-ai-delivery
description: "Apply ML/AI project delivery guidance for data exploration, feasibility, experimentation, testing, responsible AI, and operating ML systems. Use when the repo includes model training, inference, data science workflows, or ML-specific delivery planning."
compatibility: "Requires repository access when ML/AI docs, experiments, or delivery guidance live in the repo."
---

# MCAF: ML/AI Delivery

## Trigger On

- the repo contains model training, inference, experimentation, or data-science workflow
- ML work needs explicit process, testing, or responsible-AI guidance
- delivery discussion is mixing product, data, and model concerns

## Do Not Use For

- generic software delivery with no ML or data-science component
- loading all ML references when only one stage is active

## Inputs

- the current ML stage: framing, data exploration, experimentation, training, inference, or operations
- product assumptions, data assumptions, and model assumptions
- current verification and responsible-AI expectations

## Workflow

1. Separate product assumptions, data assumptions, and model assumptions.
2. Keep experimentation traceable and testable.
3. Treat responsible AI, data quality, and ML-specific verification as first-class requirements.
4. Load only the references that match the current ML stage.

## Deliver

- clearer ML/AI delivery guidance
- better links between data, experimentation, verification, and responsible AI
- docs that match how the ML system is built and validated

## Validate

- the active ML stage is explicit
- experimentation and evaluation are traceable
- responsible-AI and data-quality requirements are not bolted on at the end

## Load References

- read `references/ml-ai-projects.md` first
- open `references/data-exploration.md`, `references/feasibility-studies.md`, `references/ml-fundamentals-checklist.md`, `references/model-experimentation.md`, `references/testing-data-science-and-mlops-code.md`, `references/responsible-ai.md`, or `references/ml-model-checklist.md` only when that stage is active

## Example Requests

- "Define the delivery workflow for this ML feature."
- "We need responsible-AI and testing guidance for this model."
- "Separate product, data, and model decisions in our docs."
