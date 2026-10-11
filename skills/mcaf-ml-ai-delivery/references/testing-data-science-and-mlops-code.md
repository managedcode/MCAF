# Data Science and MLOps Tests

Apply the repository's test policy to real data loading, transforms, evaluation, training, artifact storage/loading, and inference paths. Inspect source and contracts and review code/tests before the planned verification phase.

## Fixtures and Execution

Use tiny, deterministic, representative real files and datasets. Keep expensive training/E2E suites distinct from focused checks without omitting required gates. Use real sandbox/test dependencies, not doubles that conceal contract failures.

## Required Scenario Selection

| Boundary | Meaningful proof |
| --- | --- |
| Loading | Correct schema/values; missing file, malformed record, null, and invalid schema behavior |
| Transforms | Expected values as well as shape; boundary/range/encoding behavior and training/serving consistency |
| Training | Real selected training path updates parameters and produces a usable artifact |
| Artifact and inference | Real save/load and caller entry point; meaningful outputs plus invalid/unavailable artifact behavior |
| Evaluation | Known fixture yields correct metrics and threshold decisions; split/segment assumptions are honored |
| Pipeline | Real transforms, model, validation, and required metadata/lineage persistence work together |
| Monitoring/recovery | Quality/drift/threshold logic and accepted uncertain, invalid, or unavailable-output behavior |

Select scenarios from the accepted requirements; do not add irrelevant model checks or use shape assertions as the only prediction proof.

## Review and Evidence

Confirm that tests can detect the intended regression, expected values come from the contract, fixtures are isolated, and required negative paths reach the actual boundary. Use named reusable values where repository policy requires them.

After complete approved code/tests, self-review, fixes, and formatting, run the planned checks. Separate exploratory model experiments from software verification and production proof; repeat checks only for a new change, concrete failure, or unresolved question.
