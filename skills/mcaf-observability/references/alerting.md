# Alerting

Alert on a condition that requires a concrete response, with enough evidence to distinguish user impact from harmless noise.

## Define Each Alert

- Relevant user/system flow and accepted service objective.
- Signal, threshold/window, duration, and expected symptom.
- Owner, routing severity, response/runbook, and recovery condition.
- Required context/correlation without secrets or unbounded metric labels.

Use separate urgency for active user-impact failures and capacity/trend work. Account for retries, planned maintenance, and dependency degradation so alerts are actionable. Do not adopt arbitrary exception counts from examples as product requirements.

Verify the signal and failure/recovery condition in an authorized test environment. Review false positives and missing signals when incidents provide new evidence; do not add an alert for every collected metric.
