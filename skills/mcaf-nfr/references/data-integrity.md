# Data Integrity

Define the invariants the affected flow must preserve, then verify them through real writes, reads, and failure/recovery paths.

## Relevant Invariants

- Required fields, ranges, precision, valid states, uniqueness, and references.
- Transaction/consistency boundaries and authoritative state ownership.
- Duplicate/reordered messages, concurrent writes, retries, and partial failure where relevant.
- Auditability, authorized changes, retention, backup, and restoration.
- Schema/serializer compatibility and migration order.

Use the owning data model's constraints and validation; do not invent cascade deletion, repair, or reconciliation behavior. Material schema, state, serializer, or destructive migration changes need approval.

Prove valid data survives the real persistence flow, invalid updates are rejected, and failures do not leave forbidden partial state. Record recovery and migration evidence when required.
