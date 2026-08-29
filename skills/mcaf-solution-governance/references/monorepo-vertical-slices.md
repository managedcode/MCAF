# Mandatory Monorepo and Vertical-Slice Policy

Policy ID: `MCAF-ARCH-001`

This policy is a non-optional MCAF solution invariant. A solution is delivered as one repository and is organized feature-first through consistent, repository-wide vertical slices.

## Mandatory Invariants

1. **One solution, one repository.** All solution-owned backend applications, frontend applications, shared contracts, automated tests, infrastructure and deployment assets, and durable documentation MUST live in the same version-control repository. They are reviewed, versioned, and changed as one solution.
2. **Feature-first everywhere.** Feature-owned implementation MUST be organized by business capability or use case, never primarily by technical layer. Repository-level `Controllers`, `Services`, `Repositories`, or equivalent layer buckets MUST NOT become the owners of feature behaviour.
3. **One canonical slice name.** A feature uses the same stable slice name across backend, frontend, contracts, tests, and documentation. For example, `Orders` MUST NOT become `OrderManagement` in the frontend and `PurchaseTests` in the test tree.
4. **One documented slice shape.** The root `AGENTS.md` and `docs/Architecture.md` MUST define the repository's canonical slice paths and required internal folders. Every feature follows that shape. A surface that does not apply to a feature is marked `N/A` with a reason; it is not silently omitted.
5. **Slices change end to end.** A behaviour change updates the owning slice's backend, frontend, contracts, tests, and documentation together wherever those surfaces are affected.
6. **Local rules cannot weaken this policy.** Project-local `AGENTS.md` files and ADRs may add stricter rules or document a time-bounded migration deviation, but they MUST NOT redefine a split repository or layer-first feature layout as compliant.

## What a Vertical Slice Means for AI Coding

A vertical slice is one end-to-end business capability or use case, such as `Orders`, `InviteMember`, or `ResetPassword`. It owns the behaviour from its user or caller entry point through every affected technical surface: frontend, backend, contracts, persistence or integrations, automated tests, and feature documentation.

Here, "solution" means the complete product delivery boundary in the repository, not only a `.sln` or `.slnx` file and not only the backend application.

The slice is a logical ownership boundary across the solution. It does not require every file to live in one physical directory when frontend, backend, and test toolchains need separate projects. It does require every surface to reuse one canonical slice name and one documented internal shape so an AI agent can find the whole change without guessing.

For AI coding, the slice is the default unit of context, planning, implementation, review, and verification:

1. Start at the slice entry in `docs/Architecture.md`.
2. Read the root `AGENTS.md`, then the nearest local `AGENTS.md` for each affected project.
3. Read `docs/Features/<SliceName>.md` and the linked ADRs.
4. Open only the matching backend, frontend, contract, test, and infrastructure paths.
5. Change and verify every affected surface under the same slice name.
6. Update the architecture map if the slice boundary or its contracts changed.

This makes context deterministic and narrow. The agent can answer "where does this behaviour live?", "which contracts and tests belong to it?", and "what else must change?" without scanning the whole repository or inventing a parallel structure.

Layer-first organization is the opposite ownership model. Top-level feature behaviour split among generic `Controllers/`, `Services/`, `Repositories/`, `Components/`, and `Tests/` buckets forces the agent to reconstruct the feature from unrelated directories. Those folders may exist inside a slice when the stack needs them, but they MUST NOT own features at the repository or project level.

## How to Structure the Solution

1. Define the product boundary: the repository contains the complete solution, not one technical tier.
2. Inventory all solution-owned roots: backend, frontend, contracts, tests, infrastructure, and durable docs.
3. Choose one stable naming and casing convention for `<SliceName>`.
4. Choose either physical colocation or mirrored `Features/<SliceName>/` paths across technical roots.
5. Record the real convention and a slice-to-surface map in root `AGENTS.md` and `docs/Architecture.md`.
6. Give every feature a `docs/Features/<SliceName>.md` source of behaviour and verification truth.
7. Put feature-owned code inside the slice. Move code to shared building blocks only when multiple slices genuinely own the dependency.
8. Add root-level or project-local composition code only for wiring, entry points, and genuinely cross-cutting infrastructure.
9. Require pull requests to name the affected slices and prove that their backend, frontend, contracts, tests, and docs remain aligned.

## Canonical Layout

Prefer physical colocation of executable artifacts when the toolchain supports it, while keeping the canonical durable feature doc under `docs/Features/`:

```text
features/
  <SliceName>/
    Backend/
    Frontend/
    Contracts/
    Tests/
    Infrastructure/
docs/
  Features/
    <SliceName>.md
```

When build systems require separate application or test roots, mirror the same canonical slice name across those roots:

```text
src/Backend/Features/<SliceName>/
src/Frontend/Features/<SliceName>/
src/Contracts/Features/<SliceName>/
tests/Features/<SliceName>/
docs/Features/<SliceName>.md
```

The repository may adapt the root names to its stack, but it MUST choose one convention, record it in `AGENTS.md` and `docs/Architecture.md`, and apply it consistently to every slice. Durable docs continue to follow the repository's canonical `docs/` policy; matching the slice name keeps them part of the same logical vertical slice.

## Allowed Non-Feature Areas

Only artifacts that are genuinely solution-wide may live outside a feature slice:

- application entry points and composition roots
- shared platform or building blocks used by multiple slices
- repository-wide infrastructure and CI configuration
- global architecture, operations, security, and contribution documentation
- generated output excluded from source control

An artifact is not shared merely because placing it in a layer folder is convenient. If only one feature owns it, it belongs to that slice.

## Existing Deviations

An existing split or inconsistent layout is migration debt, not a valid alternative architecture.

A migration ADR MUST name the affected paths, owner, target slice shape, ordered move, verification, and removal date. New work MUST use the target structure and MUST NOT expand the deviation.

## Required Evidence

A repository conforms only when all of the following are visible:

- the root `AGENTS.md` declares `MCAF-ARCH-001` mandatory and records the actual path convention
- `docs/Architecture.md` shows the single repository boundary and a slice-to-surface map
- every feature spec maps backend, frontend, contracts, tests, and docs to one canonical slice name
- project-local `AGENTS.md` files identify the slices they own without weakening the root policy
- pull requests confirm that affected slice surfaces changed together
- automated repository checks prevent required templates from dropping this policy
