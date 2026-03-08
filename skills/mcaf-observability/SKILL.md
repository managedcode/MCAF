---
name: mcaf-observability
description: "Design or improve observability for application and delivery flows: logs, metrics, traces, correlation, alerts, and operational diagnostics. Use when a change affects runtime visibility, failure diagnosis, SLOs, or alerting."
compatibility: "Requires repository access; may update code, dashboards-as-code, alerting docs, or operational guidance."
---

# MCAF: Observability

## Trigger On

- a change affects runtime visibility or failure diagnosis
- logs, metrics, traces, or alerts are missing or vague
- the team cannot answer "how will we know this broke?"

## Do Not Use For

- feature behaviour work with no runtime visibility impact
- generic monitoring talk with no concrete flow to instrument

## Inputs

- the critical user or system flow under change
- current logs, metrics, traces, dashboards, and alerts
- operator expectations for diagnosis and response

## Workflow

1. Identify the critical user or system flow that needs visibility.
2. Define what must be observable:
   - success and failure
   - latency and throughput
   - correlation across boundaries
   - actionable alerting
3. Treat observability as part of done, not an afterthought.
4. Load only the references that match the affected runtime concern.

## Deliver

- observability requirements for the changed flow
- updated logging, metrics, traces, or alerting guidance
- clear operator and engineer visibility expectations

## Validate

- a failure can be detected and diagnosed from the chosen signals
- alerts are actionable, not noise
- cross-boundary correlation is possible where the flow needs it
- the observability plan matches user impact and operator needs

## Load References

- read `references/observability.md` first
- open `references/alerting.md`, `references/best-practices.md`, `references/correlation-id.md`, `references/log-vs-metric-vs-trace.md`, or `references/pitfalls.md` only when needed

## Example Requests

- "Add observability requirements for this background worker."
- "We have logs but still cannot debug failures. Fix the plan."
- "Define alerts and traces for this API flow."
