# Project Memory (MCAF)

> Purpose: store **stable, repeatable context** about how we build software in this repo (taste, standards, constraints).  
> Keep it short and useful. No secrets. No one-off task instructions.

## The 7 Questions (profile)

Answer these once and keep them current. This is the fastest way for a new agent/engineer to “get” how you work.

1. **What are we building and for whom?** (product + users + non-goals)  
   - Answer:
2. **What is our quality bar?** (what cannot ship)  
   - Answer:
3. **How do we make decisions?** (ADRs, who decides, when)  
   - Answer:
4. **How do we design?** (architecture principles, boundaries, patterns)  
   - Answer:
5. **How do we build?** (workflow, branching, reviews, release discipline)  
   - Answer:
6. **How do we test?** (TDD/BDD, levels, what to mock, what never to mock)  
   - Answer:
7. **What does “done” mean here?** (Definition of Done, docs, verification evidence)  
   - Answer:

## Code (taste + standards)

- Readability rules:
- Naming rules:
- Error handling rules:
- Performance rules:
- “Never do this” list:

## Testing (taste + standards)

- TDD policy (when mandatory / exceptions):
- Test levels policy (integration/API/UI vs unit):
- Assertions policy (what a “meaningful test” means here):
- Flakiness policy (what to do when tests are flaky):

## Documentation (taste + standards)

- Doc tone (what “good” looks like here):
- ADR policy (what requires an ADR, how strict):
- Feature doc policy (when required, what must be included):
- Diagram policy (Mermaid expectations):

## Architecture (principles + constraints)

- Boundaries and layering rules:
- Dependency rules:
- Cross-cutting patterns (logging, config, errors, auth, caching):

## Patterns (approved defaults)

- API style:
- Data model style:
- Concurrency / idempotency:
- Observability:

## Ideas (explicitly tentative)

> Keep this list short. Promote ideas to ADRs/features when they become real.

- TODO

## Glossary (project-specific terms)

- TODO

## Out of scope

- Secrets, keys, tokens, credentials.
- One-off task instructions (“just for this PR”).
- Architecture decisions (use `docs/ADR/*`).
- Feature behaviour and flows (use `docs/Features/*`).
