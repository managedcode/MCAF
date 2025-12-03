# Feature: {{FeatureName}}

Status: {{Draft / In Progress / Implemented / Deprecated}}  
Owner: {{Owner or team}}  
Created: {{YYYY-MM-DD}}  
Links: {{Issues / tickets}}

---

## Purpose

{{Short description of the business problem and value.}}

---

## Scope

### In scope

- {{Item}}

### Out of scope

- {{Item}}

---

## Business Rules

- {{Rule 1}}
- {{Rule 2}}
- {{Rule 3}}

---

## User Flows

### Primary flows

1. {{Flow name}}  
   - Actor: {{User / Service}}  
   - Trigger: {{Trigger}}  
   - Steps: {{Short list}}  
   - Result: {{Outcome}}

### Edge cases

- {{Edge case}} → {{Expected behaviour}}

---

## System Behaviour

- Entry points: {{API endpoints / UI / events / scheduled jobs}}  
- Reads from: {{DB / service / cache}}  
- Writes to: {{DB / service / queue}}  
- Side effects / emitted events: {{List}}  
- Idempotency: {{Yes/No, conditions}}  
- Error handling: {{Rules and user-facing messages}}  
- Security / permissions: {{AuthZ rules}}  
- Feature flags / toggles: {{Name and defaults}}  
- Performance / SLAs: {{If relevant}}  
- Observability: {{Logs / metrics / traces that must exist}}

---

## Diagrams

```mermaid
{{Mermaid diagram for main flow}}
```

---

## Verification (Mandatory: describe how to test)

### Test environment

- Environment / stack: {{local compose / staging / cloud env}}  
- Data and reset strategy: {{Seed data, fixtures, migration steps}}  
- External dependencies: {{Real / sandbox / fake services required}}

### Test commands

- build: `{{build command from AGENTS.md}}`
- test: `{{test command from AGENTS.md}}`
- analyze: `{{analyze command from AGENTS.md}}`

### Test flows

**Positive scenarios**

| ID | Description | Level (Unit / Int / API / UI) | Expected result | Data / Notes |
| --- | --- | --- | --- | --- |
| POS-001 | {{Happy path}} | {{Integration}} | {{Outcome observed via public interface}} | {{Data / fixtures}} |

**Negative scenarios**

| ID | Description | Level (Unit / Int / API / UI) | Expected result | Data / Notes |
| --- | --- | --- | --- | --- |
| NEG-001 | {{Validation failure}} | {{API}} | {{Error response / code}} | {{Invalid input example}} |

**Edge cases**

| ID | Description | Level (Unit / Int / API / UI) | Expected result | Data / Notes |
| --- | --- | --- | --- | --- |
| EDGE-001 | {{Boundary condition}} | {{Integration}} | {{Expected behaviour at boundary}} | {{Data / timing notes}} |

### Test mapping

- Integration tests: {{Project / namespace / classes}}  
- API tests: {{Project / suites}}  
- UI / E2E tests: {{Project / suites}}  
- Unit tests: {{Project / namespaces}}  
- Static analysis: {{Tools / configs to run}}

### Non-functional checks (if applicable)

- Performance / load: {{Tool, threshold, command}}  
- Security / privacy: {{Threats to verify}}  
- Observability: {{Log / metric assertions}}

---

## Definition of Done

- Behaviour matches rules and flows in this document.  
- All test flows above are covered by automated tests (Integration / API / UI as applicable).  
- Static analysis passes with no new unresolved issues.  
- Test and build commands listed above run clean in local and CI environments.  
- Documentation updated: this feature doc, related ADRs, Testing / API / Architecture docs, `AGENTS.md` if rules or patterns changed.  
- Feature flags / migrations rolled out or cleaned up.

---

## References

- ADRs: {{Links to docs/ADR/*}}  
- API: {{Links to docs/API/*}}  
- Architecture: {{Links to docs/Architecture/*}}  
- Testing: {{Links to docs/Testing/*}}  
- Code: {{Main modules / namespaces}}
