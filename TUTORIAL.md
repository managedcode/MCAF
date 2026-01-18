# Getting Started with MCAF

A practical guide to implementing MCAF in your repository.

## Quick Start

Get MCAF running in your repository:

1. Bootstrap AGENTS.md with AI analysis
2. Create documentation structure in `docs/` (including `docs/Architecture/Overview.md`)
3. Add skills (agent-specific directory)
4. Document existing features
5. Create ADRs for existing decisions
6. Write feature docs before coding (ongoing workflow)
7. Set up test environment
8. Configure CI pipeline

---

## Step 1: Bootstrap AGENTS.md

Download templates from [Templates](/templates):
- **AGENTS.md** — copy to repository root
- **Architecture-Template.md** — use for `docs/Architecture/Overview.md`
- **ADR-Template.md** — use for `docs/ADR/ADR-*.md`
- **Feature-Template.md** — use for `docs/Features/*.md`

The AI agent will analyze your project and fill in the template with actual commands, patterns, and conventions found in your codebase.

**What you get:** A customized AGENTS.md with your tech stack, build commands, code style, and workflow patterns.

**Prompt:**

```
Analyze this project and fill in AGENTS.md:

1. Detect tech stack — language, framework, versions from config files
2. Scan codebase — folders, modules, layers, architecture
3. Read existing code — patterns, conventions, naming styles
4. Check git history — commit message format, branch naming, team patterns
5. Find existing docs — README, comments with rules, ADRs if exist
6. Analyze tests — structure, frameworks, how organized
7. Ensure the workflow is **architecture-first** (no exceptions):
   - always start from `docs/Architecture/Overview.md` to locate modules and boundaries
   - do not add “file creation” logic into `AGENTS.md` (bootstrap creates docs; `AGENTS.md` governs work)

Fill each AGENTS.md section:
- Project name and detected stack
- Commands — actual build/test/format commands
- Task Delivery — workflow based on git patterns
- Testing — rules based on test structure
- Code Style — conventions from existing code
- Boundaries — protected/critical areas

Keep Self-Learning section as-is.
Report what you found.
```

---

## Step 2: Create Documentation Structure

Create a `docs/` folder with subfolders for different types of documentation. This gives AI agents and developers a clear place to find and add documentation.

**What you get:** Organized folder structure ready for feature specs, ADRs, and development guides.

**Prompt:**

```
Create documentation structure for this project:

1. Create docs/ folder with subfolders:
   - docs/Architecture/ — global architecture overview and module boundaries
   - docs/Features/ — for feature specifications
   - docs/ADR/ — for architecture decisions

2. Create docs/Architecture/Overview.md with:
   - At least one Mermaid diagram showing modules and interactions
   - Module catalog (responsibilities + boundaries)
   - Dependency rules (allowed/forbidden)
   - Links to key ADRs/features (keep it link-based; no feature flows in the overview)
   - Use template from docs/templates/Architecture-Template.md if it exists

Report what you created.
```

---

## Step 3: Add Skills (repeatable agent workflows)

Skills are part of MCAF: keep them in-repo so agents and humans share the same workflows, scripts, and standards.

Where to put skills depends on your agent:

- **Codex (OpenAI)**: `.codex/skills/`
- **Claude Code (Anthropic)**: `.claude/skills/`
- **Gemini Code Assist (Google)**: no documented Agent Skills folders (`SKILL.md`) like Codex/Claude; use `AGENTS.md` + docs, and control context with `.aiexclude`/`.gitignore` (Gemini CLI: `.geminiignore`)

Baseline skills in this MCAF repo live under `skills/` (templates). The installer copies them into your chosen skills directory.

One-line remote installer (no local clone required). It will prompt for agent selection; you can also pin it:

```bash
curl -fsSL https://raw.githubusercontent.com/managedcode/MCAF/main/scripts/mcaf-remote-install.sh | bash -s --
```

For Claude Code (no prompt):

```bash
curl -fsSL https://raw.githubusercontent.com/managedcode/MCAF/main/scripts/mcaf-remote-install.sh | bash -s -- --agent claude
```

If you already have this repo locally, run the installer from your repo root:

```bash
bash scripts/mcaf-install.sh
```

Install skills for Claude Code instead:

```bash
bash scripts/mcaf-install.sh --skills-dir .claude/skills
```

**Prompt:**

```
Add skills structure to this project:

1. Create the agent skills directory at repo root:
   - Codex: `.codex/skills/`
   - Claude Code: `.claude/skills/`
2. Add baseline MCAF skills (copy from the MCAF repo and then adapt to your repo):
   - `mcaf-architecture-overview`
   - `mcaf-feature-spec`
   - `mcaf-adr-writing`
   - `mcaf-testing`
   - `mcaf-formatting`
   - `mcaf-skill-curation`
3. Ensure each skill is discoverable:
   - folder name matches `name` (lowercase, digits, hyphens)
   - `description` includes clear trigger contexts (this is what matching uses)
4. Generate an “available skills” block for your agent runtime:
   - include only metadata (name, description, location)
   - prefer a simple XML `<available_skills>` block (easy to copy/paste and parse)
   - generate from your repo (example for Codex): `python3 .codex/skills/mcaf-skill-curation/scripts/generate_available_skills.py .codex/skills --absolute`
5. Validate skills and fix reported issues:
   - (example for Codex) `python3 .codex/skills/mcaf-skill-curation/scripts/validate_skills.py .codex/skills`

Report what you created.
```

---

## Updating an Existing Repo (Templates + Skills)

If your project already uses MCAF and you want to see what changed upstream (without overwriting your customized files), fetch a snapshot first:

```bash
# Run in your repo root:
bash ../MCAF/scripts/mcaf-upstream-snapshot.sh
```

For Claude Code repos (skills in `.claude/skills/`):

```bash
bash ../MCAF/scripts/mcaf-upstream-snapshot.sh --skills-dir .claude/skills
```

Then review and merge what you want (example):

```bash
diff -ruN docs/templates .mcaf/upstream/<timestamp>/docs/templates | less
diff -ruN .codex/skills .mcaf/upstream/<timestamp>/.codex/skills | less
```

After merging, validate skills and regenerate the metadata block:

```bash
python3 .codex/skills/mcaf-skill-curation/scripts/validate_skills.py .codex/skills
python3 .codex/skills/mcaf-skill-curation/scripts/generate_available_skills.py .codex/skills --absolute
```

If you use a different skills directory, replace `.codex/skills` with your chosen path (for example `.claude/skills`).

---

## Step 4: Document Existing Features

Scan the codebase for major features and modules, then create documentation for each. This captures current behavior so AI agents understand what already exists before making changes.

Use [Feature-Template.md](/templates) from templates.

**What you get:** Feature docs in `docs/Features/` describing purpose, flows, components, and tests for each major feature.

**Prompt:**

```
Document existing features in this project:

1. Scan codebase for major features/modules
2. For each feature create docs/Features/{feature-name}.md with:
   - Purpose — what it does
   - Main flows — how it works
   - Components — files/classes involved
   - Tests — what tests exist for it
   - Current behavior — how it behaves now

Use template from docs/templates/Feature-Template.md if exists.
List all features you documented.
```

---

## Step 5: Create ADRs for Existing Decisions

Document architectural decisions that were already made in the project. This prevents AI agents from suggesting changes that conflict with existing architecture.

Use [ADR-Template.md](/templates) from templates.

**What you get:** ADRs in `docs/ADR/` explaining why the database, framework, auth approach, and other technical choices were made.

**Prompt:**

```
Create ADRs for architectural decisions found in this project:

1. Analyze codebase for architectural patterns:
   - Database choice
   - Framework choice
   - Authentication approach
   - API structure
   - Any significant technical decisions

2. For each decision create docs/ADR/{number}-{title}.md with:
   - Status: Accepted (already implemented)
   - Context: Why this decision was needed
   - Decision: What was chosen
   - Consequences: Trade-offs

Use template from docs/templates/ADR-Template.md if exists.
List all ADRs you created.
```

---

## Step 6: Write Feature Docs (Ongoing Workflow)

For new features, write documentation before coding. This is your ongoing workflow after bootstrap.

**What you get:** Clear specification that both humans and AI agents can implement without guessing.

**Include:**

- Feature name and purpose
- Business rules and constraints
- Main flow description
- Test flows (positive, negative, edge cases)
- Definition of Done

Feature docs should be precise enough that:

- A human can implement and verify the feature
- An AI agent can derive code and tests without inventing behaviour

---

## Step 7: Set Up Tests

Integration tests are the backbone of MCAF. Configure your test environment to use real dependencies instead of mocks.

**What you get:** Test infrastructure that catches real integration issues, not just unit-level bugs.

**Principles:**

- Use real dependencies, not mocks
- Internal systems (database, cache, queues) run in containers
- Test environment starts from documented scripts
- Same commands work locally and in CI

For .NET projects, consider:

- Aspire for container orchestration
- TUnit for test framework
- WebApplicationFactory for Integration tests
- Playwright for UI tests

The specific tools matter less than the principle: test real behaviour with real dependencies.

---

## Step 8: Configure CI

Set up CI to run all tests automatically. This ensures every PR is verified before merge.

**What you get:** Automated quality gate that runs build, tests, and static analysis.

**CI pipeline should:**

- Build the solution
- Run all tests (unit, integration, API, UI)
- Run static analysis
- Fail on test failures or violations

Both GitHub Actions and Azure DevOps support containerized test environments.

Docker is available by default on hosted runners.

---

## Working with AI Agents

### Delegated Mode

Agent does most work. Human reviews and merges.

Best for:

- Bug fixes with clear reproduction
- Features with complete documentation
- Routine refactoring

### Collaborative Mode

Agent and human work together throughout.

Best for:

- Complex features
- Architectural changes
- High-risk modifications

### Consultative Mode

Agent advises. Human implements.

Best for:

- Security-sensitive code
- Learning new codebase
- Design exploration

---

## FAQ

<details class="faq-item">
<summary>Does MCAF work with any programming language?</summary>
<div class="faq-answer">
Yes. MCAF is language-agnostic. Define your <code>build</code>, <code>test</code>, <code>format</code> commands for your stack.
</div>
</details>

<details class="faq-item">
<summary>Do I need all documentation folders?</summary>
<div class="faq-answer">
Start with <code>Features/</code>, <code>ADR/</code>, <code>Testing/</code>, and <code>Development/</code>. Add others as needed.
</div>
</details>

<details class="faq-item">
<summary>What if my team doesn't have a dedicated QA?</summary>
<div class="faq-answer">
Developers take the QA perspective. The point is ensuring test coverage, not having a specific role.
</div>
</details>

<details class="faq-item">
<summary>Why avoid mocking internal services?</summary>
<div class="faq-answer">
Mocks hide integration bugs. Real containers catch issues that mocks miss.
</div>
</details>

<details class="faq-item">
<summary>How much test coverage is enough?</summary>
<div class="faq-answer">
Every significant behaviour needs at least one integration/API/UI test. Focus on workflows, not percentages.
</div>
</details>

<details class="faq-item">
<summary>Which AI agents work with MCAF?</summary>
<div class="faq-answer">
Any AI coding assistant that can read files. Point them to <code>AGENTS.md</code>.
</div>
</details>

<details class="faq-item">
<summary>How does the agent learn my preferences?</summary>
<div class="faq-answer">
Update <code>AGENTS.md</code> when you give feedback. Chat is not memory — the file is.
</div>
</details>

<details class="faq-item">
<summary>Can I adopt MCAF gradually?</summary>
<div class="faq-answer">
Yes. Start with <code>AGENTS.md</code> and one feature doc. Add structure as you go.
</div>
</details>

---

## Common Mistakes

### Writing code before docs

Write feature doc with test flows first. Then implement.

### Mocking everything

Use real containers. Catch real integration issues.

### Treating AGENTS.md as static

Update after every significant feedback or pattern discovery.

### Skipping the plan step

Even small changes benefit from explicit planning.

---

## Example Project Structure

```
my-project/
├── .github/
│   └── workflows/
│       └── ci.yml
├── docs/
│   ├── Features/
│   │   ├── user-auth.md
│   │   └── payment-flow.md
│   ├── ADR/
│   │   ├── 001-database-choice.md
│   │   └── 002-auth-strategy.md
│   ├── Testing/
│   │   └── strategy.md
│   ├── Development/
│   │   └── setup.md
│   └── API/
│       └── endpoints.md
├── src/
│   └── ...
├── tests/
│   ├── integration/
│   ├── api/
│   └── ui/
├── AGENTS.md
└── README.md
```

---

## Next Steps

1. Copy templates from [Templates](/templates)
2. Read the full [MCAF Guide](/) for detailed specifications
3. Set up your first feature using this workflow
4. Iterate and improve your `AGENTS.md` as you learn

---

*Need help? Open an issue on [GitHub](https://github.com/managedcode/MCAF).*
