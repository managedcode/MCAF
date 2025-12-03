# ADR-{{Number}}: {{Short Title}}

Status: {{Proposed / Accepted / Implemented / Rejected / Superseded}}  
Date: {{YYYY-MM-DD}}  
Owner: {{Owner or team}}  
Related Features: {{Links to docs/Features/*}}  
Supersedes: {{ADR-XXXX or N/A}}  
Superseded by: {{ADR-YYYY or N/A}}

> Usage: draft here first. Once accepted, save a copy as `docs/ADR/ADR-{{Number}}-{{short-kebab-title}}.md` (English, kebab-case) and keep the template unchanged.

---

## Context

{{Current situation, constraints, problems.}}

---

## Decision

{{Short, direct statement of the chosen option.}}

Key points:

- {{Point 1}}
- {{Point 2}}

---

## Alternatives considered

### {{Option A}}

- Pros: {{List}}  
- Cons: {{List}}  
- Rejected because: {{Reason}}

### {{Option B}}

- Pros: {{List}}  
- Cons: {{List}}  
- Rejected because: {{Reason}}

---

## Consequences

### Positive

- {{Benefit}}

### Negative / risks

- {{Risk}}  
- Mitigation: {{How to handle it}}

---

## Impact

### Code

- Affected modules / services: {{List}}  
- New boundaries / responsibilities: {{Description}}  
- Feature flags / toggles: {{Names, defaults, removal plan}}

### Data / configuration

- Data model / schema changes: {{List or N/A}}  
- Config changes: {{Keys, defaults, secrets handling}}  
- Backwards compatibility: {{Strategy}}

### Documentation

- Feature docs to update: {{Links}}  
- Testing docs to update: {{Links}}  
- Architecture docs to update: {{Links}}  
- Notes for `AGENTS.md`: {{New rules or patterns}}

---

## Verification (Mandatory: describe how to test this decision)

### Objectives

- {{What behaviour / qualities the decision must prove}}

### Test environment

- Environment: {{Local compose / staging / prod-like}}  
- Data and reset strategy: {{Seed data, migrations, rollback plan}}  
- External dependencies: {{Real / sandbox / fake services required}}

### Test commands

- build: `{{build command from AGENTS.md}}`  
- test: `{{test command from AGENTS.md}}`  
- analyze: `{{analyze command from AGENTS.md}}`

### New or changed tests

| ID | Scenario | Level (Unit / Int / API / UI) | Expected result | Notes / Data |
| --- | --- | --- | --- | --- |
| {{TST-001}} | {{Happy path / negative / edge}} | {{Integration}} | {{Observable outcome}} | {{Fixtures / seed data}} |

### Regression and analysis

- Regression suites to run: {{Which suites must stay green}}  
- Static analysis: {{Tools / configs that must pass}}  
- Monitoring during rollout: {{Logs / metrics / alerts to watch}}

---

## Rollout and migration

- Migration steps: {{Steps}}  
- Backwards compatibility: {{Strategy}}  
- Rollback: {{How to revert}}

---

## References

- Issues / tickets: {{Links}}  
- External docs / specs: {{Links}}  
- Related ADRs: {{Links}}

---

## Filing checklist

- [ ] File saved under `docs/ADR/ADR-{{Number}}-{{short-kebab-title}}.md` (not in `docs/templates/`).
- [ ] Status reflects real state (`Proposed`, `Accepted`, `Rejected`, `Superseded`).
- [ ] Links to related features, tests, and ADRs are filled in.
