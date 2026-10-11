# ML Delivery Fundamentals

Use only the sections relevant to the active stage. Record evidence and unresolved assumptions; a checked box is not evidence by itself.

## Data and Feasibility

- [ ] Data access, use restrictions, ownership, lineage, and quality are understood.
- [ ] Labels or another meaningful evaluation method are available where needed.
- [ ] Representative exploration identifies distributions, gaps, leakage, and integration risks.
- [ ] A bounded [feasibility decision](feasibility-studies.md) connects results to product outcomes, cost, and harm constraints.

## Evaluation and Experiments

- [ ] Metrics directly measure accepted success/failure criteria and can be computed from available data.
- [ ] Evaluation code and fixtures have meaningful tests.
- [ ] Versioned datasets/splits, transforms, parameters, artifacts, and results make comparisons reproducible.
- [ ] A documented baseline and common evaluation conditions support candidate comparisons.
- [ ] Error analysis includes relevant segments and limitations; results are not cherry-picked.

## Production

- [ ] [Model readiness](ml-model-checklist.md) is supported by actual evidence.
- [ ] Input/output schemas, artifact loading, transforms, and inference work through real end-to-end paths.
- [ ] Accepted quality, latency, throughput, and cost requirements hold.
- [ ] Monitoring and controlled retraining/rollback ownership are defined.
- [ ] [Responsible AI](responsible-ai.md) requirements and mitigations are implemented where applicable.
