# Getting Started with MCAF

A practical guide to implementing MCAF in your repository.

---

## Quick Start

Get MCAF running in your repository:

1. Create documentation structure in `docs/`
2. Copy `AGENTS.md` template to repository root
3. Define `build`, `test`, `format` commands
4. Set up test environment for integration tests
5. Configure CI pipeline

---

## Step 1: Documentation Structure

Create folders under `docs/`:

- `Features/` — feature specifications with test flows
- `ADR/` — Architecture Decision Records
- `Testing/` — test strategy and execution guides
- `Development/` — local setup and workflow

Optional folders as needed:

- `API/` — endpoint documentation
- `Architecture/` — system diagrams
- `Operations/` — deployment and monitoring

Start small. Add folders as your project grows.

---

## Step 2: Configure AGENTS.md

Copy the AGENTS.md template to your repository root.

Customize:

1. Replace `{{ProjectName}}` and `{{Stack}}` with your values
2. Add project-specific rules in Section 2
3. Define actual commands in Section 7
4. Add team preferences in Section 8

Commands section example:

```markdown
- build: `dotnet build`
- test: `dotnet test`
- format: `dotnet format`
```

Update this file whenever you discover new patterns or receive feedback.

---

## Step 3: Write Feature Docs

Before implementing a feature, create a doc in `docs/Features/`.

Include:

- Feature name and purpose
- Business rules and constraints
- Main flow description
- Test flows (positive, negative, edge cases)
- Definition of Done

Feature docs should be precise enough that:

- A human can implement and verify the feature
- An AI agent can derive code and tests without inventing behaviour

---

## Step 4: Set Up Integration Tests

Integration tests are the backbone of MCAF.

Principles:

- Use real dependencies, not mocks
- Internal systems (database, cache, queues) run in containers
- Test environment starts from documented scripts
- Same commands work locally and in CI

For .NET projects, consider:

- Aspire for container orchestration
- TUnit or xUnit for test framework
- WebApplicationFactory for API tests
- Playwright for UI tests

The specific tools matter less than the principle: test real behaviour with real dependencies.

---

## Step 5: Configure CI

CI pipeline should:

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

<details>
<summary>Does MCAF work with any programming language?</summary>

Yes. MCAF is language-agnostic. Define your `build`, `test`, `format` commands for your stack.
</details>

<details>
<summary>Do I need all documentation folders?</summary>

Start with `Features/`, `ADR/`, and `Development/`. Add others as needed.
</details>

<details>
<summary>What if my team doesn't have a dedicated QA?</summary>

Developers take the QA perspective. The point is ensuring test coverage, not having a specific role.
</details>

<details>
<summary>Why avoid mocking internal services?</summary>

Mocks hide integration bugs. Real containers catch issues that mocks miss.
</details>

<details>
<summary>How much test coverage is enough?</summary>

Every significant behaviour needs at least one integration/API/UI test. Focus on workflows, not percentages.
</details>

<details>
<summary>Which AI agents work with MCAF?</summary>

Any AI coding assistant that can read files. Point them to `AGENTS.md`.
</details>

<details>
<summary>How does the agent learn my preferences?</summary>

Update `AGENTS.md` when you give feedback. Chat is not memory — the file is.
</details>

<details>
<summary>Can I adopt MCAF gradually?</summary>

Yes. Start with `AGENTS.md` and one feature doc. Add structure as you go.
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
