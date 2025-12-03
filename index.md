---
layout: default
title: Home
---

# MCAF

**Managed Code Coding AI Framework**

A framework for building software products together with AI coding agents.

---

## Quick Links

- [MCAF Guide](./README.md) - Full framework documentation
- [Documentation Home](./docs/home.md) - Documentation structure and templates

### Templates

- [AGENTS.md Template](./docs/templates/AGENTS.md) - Agent instructions template for your repository
- [Feature Template](./docs/templates/Feature-Template.md) - Feature specification template
- [ADR Template](./docs/templates/ADR-Template.md) - Architecture Decision Record template

---

## What is MCAF?

MCAF defines how to:

- Keep all relevant context in a single repository
- Describe work clearly before coding
- Use integration/API/UI tests, containerized environments, and static analysis as hard gates
- Encode repository-specific rules for AI agents in `AGENTS.md` at the repo root

## Core Elements

| Element | Description |
|---------|-------------|
| **Context** | Code, tests, documentation, and `AGENTS.md` live together in the repository |
| **Verification** | Behaviour and code quality are proven by automated tests and static analysis |
| **Instructions** | `AGENTS.md` defines how AI agents work in this repo and how they learn from feedback |

---

## Getting Started

1. Read the [MCAF Guide](./README.md)
2. Copy `AGENTS.md` template to your repository root
3. Customize the template for your project
4. Set up your documentation structure under `docs/`

---

## License

[CC BY 4.0](./LICENSE) - ManagedCode, Kostiantyn Semenenko
