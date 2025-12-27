# Architecture Overview (Template)

> Save this as: `docs/Architecture/Overview.md`  
> Goal: in ~5 minutes, understand **what exists**, **where it lives**, and **how modules interact**.

## 1) TL;DR (fill this, keep it short)

- **System:**  
- **Where is the code:**  
- **Entry points:**  
- **Dependencies:**  

## 2) Module map (Mermaid)

```mermaid
flowchart LR
  %% Model MODULES + BOUNDARIES, not every class/file.
  %% Replace nodes with your real modules (or services) and label arrows.

  EP[Entry Points]
  A[Module A]
  B[Module B]

  EP --> A
  A --> B
  %% Add dependencies only if they exist:
  %% A --> D[(Data Store)]
  %% A --> X[External Service]
```

## 3) Modules (catalog)

| Module | Responsibility | Entry points | Owns data? | Depends on | Notes |
| --- | --- | --- | --- | --- | --- |
| ModuleName | What it does | HTTP / CLI / jobs / events | Yes/No | DB / modules / services | Notes |

## 4) Dependency rules (must be explicit)

- Allowed dependencies:  
- Forbidden dependencies:  
- Integration style: sync calls / events / shared library  
- Shared code policy:  

## 5) Key decisions (ADRs)

- Link ADRs that define boundaries, dependencies, and cross-cutting patterns.  
- Keep this section link-based. Detailed flows belong in feature docs / ADRs, not in the overview.

- `docs/ADR/ADR-XXXX-some-decision.md` — what it decides, and what it impacts

## 6) Where to go next

- Decisions: `docs/ADR/`  
- Behaviour specs: `docs/Features/`  
- How to run + verify: `docs/Development/`, `docs/Testing/`
