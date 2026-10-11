---
name: mcaf-observability
description: "Instrument or specify logs, metrics, traces, correlation, and actionable alerts for a concrete runtime flow. Use when detection or diagnosis is missing or a change affects operational visibility."
metadata:
  compatibility: "Requires repository access; may update code, dashboards-as-code, alerting docs, or operational guidance."
---

# MCAF: Observability

Read root/local `AGENTS.md`, the full affected runtime flow, existing telemetry, and operator expectations.

## Workflow

1. Define the success, failure, latency, throughput, and dependency states that matter to users or operators.
2. Choose signals and propagate correlation through synchronous calls, messages, retries, and background work as needed.
3. Keep metrics bounded and diagnostics useful: exclude secrets/sensitive payloads, avoid unbounded labels, and distinguish a user-visible failure from infrastructure noise.
4. Give each alert an actionable condition, owner, and response/runbook. Do not create an alert merely because a metric exists.
5. Review instrumentation and tests before planned verification; demonstrate that a relevant failure can be detected and traced through the real flow.

Deliver the scoped instrumentation, dashboard/alert configuration, or operational guidance with observed evidence. New tooling or material topology changes need approval.

## References

- When choosing signals: [overview](references/observability.md) or [logs, metrics, traces](references/log-vs-metric-vs-trace.md).
- For a specific concern: [correlation](references/correlation-id.md), [alerting](references/alerting.md), [practices](references/best-practices.md), or [pitfalls](references/pitfalls.md).
