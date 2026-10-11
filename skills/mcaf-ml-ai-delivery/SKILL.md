---
name: mcaf-ml-ai-delivery
description: "Plan or improve data exploration, ML feasibility, experiments, evaluation, inference, and model operations. Use for training, inference, or data-science delivery, not generic AI coding."
metadata:
  compatibility: "Requires repository access when ML/AI docs, experiments, or delivery guidance live in the repo."
---

# MCAF: ML/AI Delivery

Read root/local `AGENTS.md`, the current ML stage, accepted product outcomes, data constraints, and existing model/pipeline contracts.

## Workflow

1. Separate product, data, and model assumptions; identify the uncertainty or delivery requirement the task must resolve.
2. Use representative data, a documented baseline, meaningful evaluation, reproducible datasets/parameters/artifacts, and leakage-aware splits.
3. Define data quality, harmful-output/uncertainty handling, responsible-AI risks, and stage exit criteria before experiments or implementation.
4. Keep exploratory experiments distinct from production delivery claims. Complete approved data, model, inference, tests, and integration changes before self-review and planned software verification.
5. Review evaluation code and tests for real outcomes, required rejection paths, and model/data contract failures. Obtain approval for material model architecture, serializer, data, dependency, or deployment decisions.
6. Report evidence, limitations, and readiness separately; an offline metric does not prove the production flow.

## References

Load only the guidance for the active stage:

- Framing: [ML project stages](references/ml-ai-projects.md), [feasibility](references/feasibility-studies.md).
- Data: [exploration](references/data-exploration.md).
- Experiments: [experiment records](references/model-experimentation.md), [fundamentals](references/ml-fundamentals-checklist.md).
- Verification: [data science and MLOps tests](references/testing-data-science-and-mlops-code.md).
- Release: [model readiness](references/ml-model-checklist.md), [responsible AI](references/responsible-ai.md).
