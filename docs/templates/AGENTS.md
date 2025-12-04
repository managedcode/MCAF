# AGENTS.md

<!-- CUSTOMIZE (remove after): project name and stack -->
{{ProjectName}} — {{Stack}}

Follows [MCAF](https://mcaf.managed-code.com/)

---

## Conversations (Self-Learning)

Learn the user's habits, preferences, and working style. Extract rules from conversations, save to "## Rules to follow", and generate code according to the user's personal rules.

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

<!-- CUSTOMIZE (remove after): your build/test/format commands -->

- build: `dotnet build`
- test: `dotnet test`
- format: `dotnet format`

### Task Delivery (ALL TASKS)

<!-- CUSTOMIZE (remove after): your task workflow -->

- Read assignment, inspect code and docs before planning
- Write multi-step plan before implementation
- Implement code and tests together
- Run tests in layers: new → related suite → broader regressions
- After all tests pass: run format, then build
- Summarize changes and test results before marking complete

### Documentation (ALL TASKS)

<!-- CUSTOMIZE (remove after): your docs location -->

- All docs live in `docs/` (or `.wiki/`)
- Update feature docs when behaviour changes
- Update ADRs when architecture changes
- Templates: `docs/templates/ADR-Template.md`, `docs/templates/Feature-Template.md`

### Testing (ALL TASKS)

<!-- CUSTOMIZE (remove after): your test structure -->

- Every behaviour change needs automated tests
- Prefer integration/API/UI tests over unit tests
- No mocks for internal systems (DB, queues, caches) — use containers
- Mocks only for external third-party systems
- Never delete or weaken a test to make it pass

### Autonomy

- Start work immediately — no permission seeking
- Questions only for architecture blockers not covered by ADR
- Report only when task is complete

### Code Style

<!-- CUSTOMIZE (remove after): your language/framework -->

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

<!-- CUSTOMIZE (remove after) -->

- Changing public API contracts
- Adding new dependencies
- Modifying database schema
- Deleting code files

---

## Preferences

### Likes

<!-- CUSTOMIZE (remove after) -->

### Dislikes

<!-- CUSTOMIZE (remove after) -->
