# Semgrep

## Open/Free Status

- open source CLI
- free to use locally and with local rules
- hosted platform features may add optional account-based behavior, but the CLI itself is OSS-friendly

## Install

Homebrew:

```bash
brew install semgrep
```

Python:

```bash
python3 -m pip install semgrep
```

## Verify First

Before installing, check whether Semgrep is already available:

```bash
command -v semgrep
python3 -m pip show semgrep
```

## Common Usage

Local scan:

```bash
semgrep scan --config auto
```

CI/platform-linked scan:

```bash
semgrep ci
```

## CI Fit

- good default for OSS-friendly security scanning
- keep local custom rules in repo if you need durable policy

## When Not To Use

- when the team only wants first-party Microsoft or GitHub tooling

## Sources

- [Local scans with Semgrep](https://semgrep.dev/docs/getting-started/cli)
- [Semgrep CLI reference](https://semgrep.dev/docs/cli-reference)
