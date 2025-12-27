# AGENTS.md

> TEMPLATE NOTE: Copy this file to the repository root as `AGENTS.md`, then **replace every `TODO:` and every `...`** with real, repo-specific values.  
> Delete this note once the file is customized.

Project: TODO
Stack: TODO

Follows [MCAF](https://mcaf.managed-code.com/)

---

## Conversations (Self-Learning)

Learn the user's habits, preferences, and working style. Extract rules from conversations, save to "## Rules to follow", and generate code according to the user's personal rules.

**Update requirement (core mechanism):**

Before doing ANY task, evaluate the latest user message.  
If you detect a new rule, correction, preference, or change → update `AGENTS.md` first.  
Only after updating the file you may produce the task output.  
If no new rule is detected → do not update the file.

**When to extract rules:**

- prohibition words (never, don't, stop, avoid) or similar → add NEVER rule
- requirement words (always, must, make sure, should) or similar → add ALWAYS rule
- memory words (remember, keep in mind, note that) or similar → add rule
- process words (the process is, the workflow is, we do it like) or similar → add to workflow
- future words (from now on, going forward) or similar → add permanent rule

**Preferences → add to Preferences section:**

- positive (I like, I prefer, this is better) or similar → Likes
- negative (I don't like, I hate, this is bad) or similar → Dislikes
- comparison (prefer X over Y, use X instead of Y) or similar → preference rule

**Corrections → update or add rule:**

- error indication (this is wrong, incorrect, broken) or similar → fix and add rule
- repetition frustration (don't do this again, you ignored, you missed) or similar → emphatic rule
- manual fixes by user → extract what changed and why

**Strong signal (add IMMEDIATELY):**

- swearing, frustration, anger, sarcasm → critical rule
- ALL CAPS, excessive punctuation (!!!, ???) → high priority
- same mistake twice → permanent emphatic rule
- user undoes your changes → understand why, prevent

**Ignore (do NOT add):**

- temporary scope (only for now, just this time, for this task) or similar
- one-off exceptions
- context-specific instructions for current task only

**Rule format:**

- One instruction per bullet
- Tie to category (Testing, Code, Docs, etc.)
- Capture WHY, not just what
- Remove obsolete rules when superseded

---

## Rules to follow (Mandatory, no exceptions)

### Commands

- build: `...`
- test: `...`
- format: `...`
- analyze: `...` (delete if not used)
- coverage: `...` (delete if not used)

### Task Delivery (ALL TASKS)

- Always start from the **architecture map** in `docs/Architecture/Overview.md`:
  - confirm the Mermaid module/boundary diagram exists (if missing → create/update it first)
  - identify the impacted boundary/module(s) and entry points
  - follow the links to the relevant ADR(s) and Feature doc(s) (do not read everything)
- Read assignment, then inspect only the relevant docs/code before planning
- Write multi-step plan before implementation
- Implement code and tests together
- If `build` is separate from `test`, run `build` before `test`
- Run tests in layers: new → related suite → broader regressions
- After tests pass: run format
- After format: run build (final check)
- Summarize changes and test results before marking complete
- Always run required builds and tests yourself; do not ask the user to execute them (explicit user directive).

### Documentation (ALL TASKS)

- All docs live in `docs/` (or `.wiki/`)
- Global architecture entry point: `docs/Architecture/Overview.md` (read first)
- When creating docs from `docs/templates/*`:
  - copy the template, then remove every `TEMPLATE ONLY` note
  - replace all placeholder text (`TODO:`, `...`, “FeatureName”, “ADR-XXXX”, etc.)
  - real docs must not contain template instructions or placeholder scaffolding
- Update feature docs when behaviour changes
- Update ADRs when architecture changes
- Diagrams are mandatory in docs:
  - `docs/Architecture/Overview.md`: at least one Mermaid module/boundary map
  - `docs/Features/*`: at least one Mermaid diagram for the main flow
  - `docs/ADR/*`: at least one Mermaid diagram for the decision

### Testing (ALL TASKS)

- Prefer TDD for new behaviour and bugfixes: write a failing test first, then implement the smallest change to make it pass, then refactor safely.
- Every behaviour change needs sufficient automated tests to cover its cases; one is the minimum, not the target
- Each public API endpoint has at least one test; complex endpoints have tests for different inputs and errors
- Integration tests must exercise real flows end-to-end, not just call endpoints in isolation
- Prefer integration/API/UI tests over unit tests
- No mocks for internal systems (DB, queues, caches) — use containers
- Mocks only for external third-party systems
- Never delete or weaken a test to make it pass
- Each test verifies a real flow or scenario, not just calls a function — tests without meaningful assertions are forbidden
- Check code coverage to see which functionality is actually tested; coverage is for finding gaps, not a number to chase

### Autonomy

- Start work immediately — no permission seeking
- Questions only for architecture blockers not covered by ADR
- Report only when task is complete

### Advisor stance (ALL TASKS)

- Stop being agreeable: be direct and honest; no flattery, no validation, no sugar-coating.
- Challenge weak reasoning; point out missing assumptions and trade-offs.
- If something is underspecified/contradictory/risky — say so and list what must be clarified.
- Never guess or invent. If unsure, say “I don’t know” and propose how to verify.
- Quality and security first: tests + static analysis are gates; treat security regressions as blockers.

### Code Style

- Style rules: `.editorconfig`
- No magic literals — extract to constants, enums, config

### Critical (NEVER violate)

- Never commit secrets, keys, connection strings
- Never mock internal systems in integration tests
- Never skip tests to make PR green
- Never force push to main
- Never approve or merge (human decision)

### Boundaries

**Always:**

- Read AGENTS.md and docs before editing code
- Run tests before commit

**Ask first:**

- Changing public API contracts
- Adding new dependencies
- Modifying database schema
- Deleting code files

---

## Preferences

### Likes

### Dislikes
