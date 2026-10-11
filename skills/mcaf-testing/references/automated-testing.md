# Automated Testing

Tests provide evidence for accepted behavior. They do not replace source inspection, sound design, or complete implementation.

## Test Design

- Design meaningful regressions from requirements before implementation; they must detect the original defect.
- Use isolated tests for non-trivial local logic, integration for real boundary interaction, API for public contracts, and UI/E2E for visible flows.
- Prove the user or caller-visible result, required state changes, and forbidden side effects.
- Cover required positive, negative, edge, and failure paths without inventing unrelated scenarios.
- Use real dependencies, containers, test instances, or sandboxes under repository policy; do not hide integration defects with doubles.
- Review fixtures, assertions, expectations, isolation, and cleanup before execution. Flaky tests require a cause and repair.

## Verification Timing

TDD and the Ralph Loop remain valid. Write and review the complete approved code and tests, fix findings, and format before one planned verification phase. Use a separate red-phase or baseline only for a concrete question or explicit requirement.

Run focused coverage and all required broader gates. Fix the complete cause before repeating affected checks; a new change, failure, or unresolved question must justify the rerun. Follow explicit instructions to run or defer checks.

## Coverage

Apply the active `AGENTS.md` thresholds. MCAF's baseline expects at least 80% changed-production line coverage and 70% branch coverage where supported, with 90% line coverage for critical flows/public contracts and explicit success/failure assertions. Repository or module coverage must not regress without an approved written exception.

Numbers identify gaps; they do not replace scenario proof. Documentation-only edits need relevant docs checks rather than new tests that merely match wording.
