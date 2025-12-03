# Getting Started with MCAF

A practical guide to implementing MCAF in your repository.

---

## Quick Start Checklist

Get MCAF running in your repository in 5 steps:

- [ ] Create `docs/` folder with `Features/`, `ADR/`, `Testing/`, `Development/`
- [ ] Copy `AGENTS.md` template to your repository root
- [ ] Define `build`, `test`, `format`, `analyze` commands in `AGENTS.md`
- [ ] Set up containerized test environment (Docker Compose or equivalent)
- [ ] Configure static analyzers and add to CI pipeline

---

## Step-by-Step Implementation

### Step 1: Set Up Documentation Structure

Create the following folders:

```
your-repo/
├── docs/
│   ├── Features/       # Feature specifications
│   ├── ADR/            # Architecture Decision Records
│   ├── Testing/        # Test strategy and flows
│   ├── Development/    # Setup and workflow guides
│   ├── API/            # API documentation (if applicable)
│   └── Architecture/   # System diagrams and boundaries
├── AGENTS.md           # AI agent instructions
└── README.md           # Project overview
```

### Step 2: Configure AGENTS.md

Copy the AGENTS.md template and customize:

1. Replace `{{ProjectName}}` and `{{Stack}}` with your values
2. Add project-specific rules in Section 2
3. Define your actual `build`, `test`, `format`, `analyze` commands in Section 7
4. Add team preferences in Section 8

Example commands section:

```markdown
## 7. Commands

- build: `npm run build`
- test: `npm test`
- format: `npm run format`
- analyze: `npm run lint`
```

### Step 3: Create Your First Feature Doc

Before implementing a feature, create `docs/Features/feature-name.md`:

```markdown
# Feature: User Authentication

## Purpose
Allow users to sign in with email and password.

## Business Rules
- Email must be valid format
- Password minimum 8 characters
- Lock account after 5 failed attempts

## Main Flow
1. User enters email and password
2. System validates credentials
3. System creates session and returns token

## Test Flows

### Positive
- Valid credentials → returns token
- Remember me checked → extended session

### Negative
- Invalid email format → validation error
- Wrong password → authentication error
- Locked account → account locked error

## Definition of Done
- [ ] All test flows pass
- [ ] API documentation updated
- [ ] No new analyzer warnings
```

### Step 4: Set Up Test Environment

Create `docker-compose.test.yml` for dependencies:

```yaml
version: '3.8'
services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_DB: test
      POSTGRES_USER: test
      POSTGRES_PASSWORD: test
    ports:
      - "5432:5432"

  redis:
    image: redis:7
    ports:
      - "6379:6379"
```

Document in `docs/Development/setup.md`:

```markdown
# Local Development Setup

## Prerequisites
- Docker and Docker Compose
- Node.js 18+

## Start Test Environment
docker-compose -f docker-compose.test.yml up -d

## Run Tests
npm test
```

### Step 5: Configure CI Pipeline

Example GitHub Actions workflow:

```yaml
name: CI
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_DB: test
          POSTGRES_USER: test
          POSTGRES_PASSWORD: test
        ports:
          - 5432:5432

    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '18'

      - run: npm ci
      - run: npm run build
      - run: npm test
      - run: npm run lint
```

---

## Working with AI Agents

### Delegated Mode (Agent does most work)

Best for:
- Bug fixes with clear reproduction steps
- Features with complete documentation
- Routine refactoring

Workflow:
1. Write feature doc with test flows
2. Point agent to the feature doc
3. Agent implements and tests
4. You review and merge

### Collaborative Mode (Working together)

Best for:
- Complex features
- Architectural changes
- New integrations

Workflow:
1. Discuss approach with agent
2. Agent drafts, you guide
3. Iterate on implementation
4. Review together

### Consultative Mode (Agent advises)

Best for:
- Security-sensitive code
- Learning new codebase
- Design exploration

Workflow:
1. Ask agent to explain current code
2. Discuss options and trade-offs
3. You implement
4. Agent reviews

---

## FAQ

### General

**Q: Does MCAF work with any programming language?**

A: Yes. MCAF is language-agnostic. The principles apply to any stack. You just need to define your specific `build`, `test`, `format`, and `analyze` commands.

**Q: Do I need all the documentation folders?**

A: Start with `Features/`, `ADR/`, and `Development/`. Add others as needed. The structure adapts to your project size.

**Q: What if my team doesn't have a dedicated QA?**

A: Developers take the QA perspective. The point is ensuring test coverage, not having a specific role.

### Testing

**Q: Why avoid mocking internal services?**

A: Mocks can hide integration bugs. Real containers catch issues that mocks miss. If you can't test without mocks, it's often a design smell.

**Q: How much test coverage is enough?**

A: Every significant behaviour needs at least one integration/API/UI test. Focus on workflows, not percentages.

**Q: What about unit tests?**

A: Use them for complex internal logic. But don't rely solely on unit tests for behaviour verification.

### AI Agents

**Q: Which AI agents work with MCAF?**

A: Any AI coding assistant that can read files. Claude, GPT, Copilot, Cursor — all work. Point them to `AGENTS.md`.

**Q: How does the agent learn my preferences?**

A: Update `AGENTS.md` when you give feedback. The agent reads it before each task. Chat isn't memory — the file is.

**Q: Can the agent merge code?**

A: No. Humans always make the final merge decision. The agent prepares, you approve.

### Adoption

**Q: Can I adopt MCAF gradually?**

A: Yes. Start with `AGENTS.md` and one feature doc. Add structure as you go.

**Q: How do I get my team on board?**

A: Start with one project. Show results. The framework proves itself through predictable, tested code.

---

## Common Mistakes

### 1. Writing code before docs

**Wrong:** Jump into coding, document later.

**Right:** Write feature doc with test flows first. Then implement.

### 2. Mocking everything

**Wrong:** Mock database, cache, queues for "fast" tests.

**Right:** Use real containers. Catch real integration issues.

### 3. Treating AGENTS.md as static

**Wrong:** Set up once, never update.

**Right:** Update after every significant feedback or pattern discovery.

### 4. Skipping the plan step

**Wrong:** Start coding immediately for "simple" changes.

**Right:** Even small changes benefit from explicit planning.

### 5. Ignoring analyzer warnings

**Wrong:** Suppress warnings to make CI green.

**Right:** Fix warnings or document explicit exceptions.

---

## Example Project Structure

A complete MCAF-compliant repository:

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
│   └── e2e/
├── docker-compose.test.yml
├── AGENTS.md
└── README.md
```

---

## Next Steps

1. Copy templates from [Templates](/templates)
2. Read the full [MCAF Guide](/) for detailed specifications
3. Set up your first feature using the workflow above
4. Iterate and improve your `AGENTS.md` as you learn

---

*Need help? Open an issue on [GitHub](https://github.com/managedcode/MCAF).*
