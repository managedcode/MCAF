# Interoperability

Define the real exchange contract and supported peers instead of prescribing REST, JSON, or a new abstraction by default.

## Contract

- Producer/consumer, protocol, schema, encoding, and serializer settings.
- Authentication, authorization, ownership, and sensitive-data rules.
- Ordering, retries, idempotency, error handling, and version compatibility.
- Required platform/runtime differences and migration expectations.

Test exchanges through the actual adapter and a real test/sandbox peer. Include malformed/unsupported input, dependency failure, and recovery when required. Obtain approval before replacing serializers, formats, APIs/events, dependencies, or compatibility contracts.
