# Observability Practices

- Correlate meaningful work across calls, messages, retries, and background processing; see [correlation IDs](correlation-id.md).
- Capture success/failure, rates, latency, and relevant saturation at their owning boundaries.
- Use bounded metric dimensions; keep request/user IDs in diagnostic context rather than metric labels.
- Log faults with useful context and controllable levels; avoid duplicated noise and sensitive payloads.
- Monitor dependency failure where it affects the flow. Distinguish process liveness from readiness/degraded service; a downstream outage does not automatically justify restarting every caller.
- Verify that operators can connect a user symptom to the responsible boundary and response.
- Review [pitfalls](pitfalls.md) only when the current instrumentation exhibits that risk.

Instrument the accepted flow completely, then review and verify the signals. Adding telemetry is not proof that detection or diagnosis works.
