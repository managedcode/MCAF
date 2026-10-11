# Portability

Name the platforms/environments the product actually supports and the behavior that must remain equivalent. Portability does not imply a cloud, language, container, or orchestration migration.

## Inspect

- Runtime/native dependencies, CPU/OS assumptions, filesystem paths, encoding, culture, and byte order.
- Packaging, configuration, permissions, credentials, and deployment prerequisites.
- Serialization/persistence compatibility and migration requirements.
- Startup, real integration flows, performance constraints, and supported-tooling availability.

Verify the affected behavior on the required target environments or state the unverified target explicitly. New runtime/platform dependencies, deployment topology, and serialization changes need user approval.
