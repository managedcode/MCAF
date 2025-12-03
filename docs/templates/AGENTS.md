# AGENTS.md

<!-- CUSTOMIZE: BEGIN -->
<!-- TODO: Replace {{ProjectName}} and {{Stack}} with real values, then delete this comment and the CUSTOMIZE markers. -->
{{ProjectName}} — {{Stack}}
<!-- CUSTOMIZE: END -->

Rules that must be applied whenever you change code in this repository.  
Load and follow these rules for every task.

---

## 1. Self-Learning

### 1.1 Purpose

- Learn from feedback, code, and docs.
- Turn stable patterns into rules in this file as soon as they appear.
- Keep behaviour consistent across tasks.
- Do not rely on chat history; use code and documentation in this repository.

### 1.2 Feedback Signals

Treat user messages as signals:

- **Directive** — explicit instructions: "never do this", "always do that", "you must...".
- **Preference** — style/taste: "I like...", "I dislike...", "too verbose", "too short".
- **Evaluation** — quality judgement: "good", "bad", "clean", "messy", "wrong".
- **Process** — workflow / Definition of Done: "we always...", "the workflow is...".
- **Correction** — explicit "this is wrong": "don't do this again", "you ignored...".
- **Emotional** — anger, sarcasm, passive aggression, swearing; signals an important expectation was broken.
- **Pattern** — repeated feedback that must become a rule.

Do not turn “only for this task” comments into global rules.

### 1.3 Rule Extraction

After each significant interaction:

1. Collect statements that match the signals in 1.2.
2. Decide scope: specific file / feature / component → scoped rule; otherwise → global rule.
3. Classify:
   - directive / process → main rules (sections 2–6)
   - preference / evaluation → Maintainer Preferences (section 7)
   - correction / emotional → update an existing rule or add a new one
4. Normalize: one bullet, one behaviour, one scope, clear "must / must not".
5. Update this file immediately.
6. Store new rules accordingly:
   - **project rules** → section 2  
   - **global/process rules** → sections 3–7  
   - **maintainer preferences** → section 8  
   - **scoped rules** → bullet with explicit “Applies to: <file/feature>”.

Use the updated rules from now on.

### 1.4 Learning From Code and History

- Before changing anything, read existing code and tests in the area.
- Identify patterns in naming, structure, validation, error handling, logging, and test design.
- If patterns match the docs → follow them.
- If patterns conflict:
  - do not invent a new style;
  - choose the cleaner option that matches docs and these rules.
- When bugs, regressions, or repeated comments reveal a pattern:
  - fix the code;
  - add a rule so the problem does not repeat.

---

## 2. Project Rules

Project-specific mandatory rules for this repository.  
Use this for architecture-wide constraints, domain rules, critical warnings, constraints that always apply.

<!-- CUSTOMIZE: BEGIN -->
<!-- TODO: Replace these and then delete this comment and the CUSTOMIZE markers. -->
-
<!-- CUSTOMIZE: END -->

---

## 3. Development Flow

Use this flow for every non-trivial change.

1. **Read the task**  
   Understand expected behaviour, inputs, outputs, constraints.

2. **Read context**  
   - relevant Feature / ADR / Architecture / Testing docs  
   - existing code and tests in the affected area

3. **Plan**  
   Identify:
   - files to modify  
   - tests to add or update:
     - positive scenarios  
     - negative scenarios  
     - edge cases  
   - docs to update

4. **Write tests and code**  
   - write failing tests first  
   - tests must cover complete workflows  
   - implement code until all new tests pass  
   - follow established patterns and rules

5. **Run tests in layers**  
   1. new and modified tests  
   2. related feature / module / service tests  
   3. full solution tests

6. **Update documentation**  
   - update `docs/Features/*` when behaviour changes  
   - update or create `docs/ADR/*` for decisions  
   - update `docs/Testing/*` when test flows change  
   - update any other relevant docs  

Documentation must match the code.

7. **Static analysis and formatting**  
   - run formatter and static analyzers  
   - fix warnings that do not conflict with explicit rules  
   - re-run tests if needed

8. **Rule compliance check**  
   - review your diff  
   - verify changes follow this file and the docs  
   - if changes require rule updates, update this file first

---

## 4. Testing Discipline

- Every behaviour change must be covered by automated tests.
- Tests must validate complete workflows end-to-end:
  - from input/entry point  
  - through processing  
  - to final observable result  
- Tests assert behaviour, not implementation details.
- Always cover:
  - positive scenarios  
  - negative scenarios  
  - edge cases  
- For internal systems (DB, queues, caches) use real test infra or official containers.  
  Mocks only for third-party external systems.
- Follow the test execution order from the Development Flow section.
- Never weaken or silence tests just to make them pass.

---

## 5. Constants and Magic Values

Magic literals that encode meaning are forbidden.

Examples when used directly:

- URLs, paths  
- tokens, identifiers, keys  
- status strings, important messages  
- numeric codes, thresholds, limits  

Rules:

- extract into constants, enums, config, or dedicated types  
- use descriptive names  
- keep single sources of truth  
- replace repeated literals  
- never introduce new magic values

---

## 6. Documentation and ADR

- Documentation must reflect current behaviour and architecture.
- After changes:
  - update `docs/Features/*`  
  - update or create `docs/ADR/*`  
  - update `docs/Testing/*`  
  - update any other impacted docs  
- Outdated docs are treated as bugs.

---

## 7. Commands

This section is the source of truth for commands the agent should use.

<!-- CUSTOMIZE: BEGIN -->
<!-- TODO: Replace these commands with actual project commands, then delete this comment and the CUSTOMIZE markers. -->
- build: `dotnet build`
- test: `dotnet test`
- format: `dotnet format`
<!-- CUSTOMIZE: END -->

Rules:

- use only these commands or documented wrappers  
- formatting and analysis are part of Definition of Done  
- always build before tests  
- when commands change, update this section

---

## 8. Maintainer Preferences

### 8.1 Likes
<!-- CUSTOMIZE: BEGIN -->
<!-- TODO: Replace these and then delete this comment and the CUSTOMIZE markers. -->
-
<!-- CUSTOMIZE: END -->

### 8.2 Dislikes
<!-- CUSTOMIZE: BEGIN -->
<!-- TODO: Replace these and then delete this comment and the CUSTOMIZE markers. -->
-
<!-- CUSTOMIZE: END -->