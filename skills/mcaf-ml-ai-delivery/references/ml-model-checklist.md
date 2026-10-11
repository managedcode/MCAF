# Model Production Readiness

Assess the real serving flow, not only an offline training score. Record evidence or a justified limitation for each applicable item.

## Evaluation and Data

- [ ] A documented simple baseline exists; the candidate meets accepted product and model thresholds.
- [ ] Evaluation metrics, time windows, segments, class balance, and sampling represent production use.
- [ ] Train/validation/test provenance and splits are reproducible and leakage-aware.
- [ ] Rare or high-impact failures and relevant subgroups are evaluated, not hidden by aggregate accuracy.
- [ ] Ground truth acquisition, delay, label quality, or proxy limitations are explicit.
- [ ] Training and serving feature transforms, schema, and artifact versions are consistent.

## Serving Contract

- [ ] Batch/realtime entry points, callers, output meaning, and downstream effects are documented.
- [ ] Real artifact loading and inference are tested through the actual pipeline/API.
- [ ] Required latency, throughput, compute/memory, and cost limits hold on representative workloads.
- [ ] Invalid inputs, unavailable artifacts/dependencies, uncertain or harmful output, and partial failure have accepted behavior.
- [ ] Any human-review or recovery path is complete and tested; it is not an unapproved legacy fallback.
- [ ] Model/serializer/data/deployment changes and migration/rollback decisions have required approval.

## Operations

- [ ] Data quality checks detect missingness, schema errors, invalid ranges, freshness, and volume issues.
- [ ] Data drift is distinguished from invalid data and linked to a concrete investigation/response.
- [ ] Model quality and system performance are monitored with actionable thresholds, an owner, and runbook.
- [ ] Retraining/adaptation triggers, evaluation, version promotion, and rollback are controlled and traceable.
- [ ] [Responsible-AI risks](responsible-ai.md), privacy, access, and retention constraints have applicable mitigations.

A readiness checklist does not authorize deployment. Report evaluation, integration verification, publication, rollout, and production observations separately. If a criterion cannot be met, name its risk and required decision rather than checking it as complete.
