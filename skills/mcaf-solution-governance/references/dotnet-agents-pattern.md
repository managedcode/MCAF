# .NET AGENTS Pattern

Use this reference when the solution stack is .NET and the root or local `AGENTS.md` needs concrete command and tooling guidance.

## Root AGENTS.md Expectations

Record the real commands, not placeholders:

```text
- `build`: `dotnet build MySolution.sln`
- `test`: `dotnet test MySolution.sln`
- `format`: `dotnet format MySolution.sln --verify-no-changes`
- `analyze`: `dotnet build MySolution.sln -warnaserror`
```

Coverage command depends on the runner model:

- VSTest:

```text
- `coverage`: `dotnet test MySolution.sln --collect:"XPlat Code Coverage"`
```

- Microsoft.Testing.Platform:

```text
- `coverage`: `dotnet test MySolution.sln --coverlet`
```

In `Global Skills`, list:

- `mcaf-testing`
- exactly one of:
  - `mcaf-dotnet-xunit`
  - `mcaf-dotnet-tunit`
  - `mcaf-dotnet-mstest`
- `mcaf-dotnet-quality-ci`
- `mcaf-dotnet-complexity` when complexity gates are active
- `mcaf-ci-cd`
- `mcaf-solid-maintainability`

## .NET Rules Worth Making Explicit

- the repo-root lowercase `.editorconfig` is the source of truth for formatting, naming, style, and analyzer severity.
- `Directory.Build.props` or project files own bulk analysis switches such as `EnableNETAnalyzers`, `AnalysisLevel`, `TreatWarningsAsErrors`, and runner choice.
- The repo must document whether tests run on `VSTest` or `Microsoft.Testing.Platform`.
- Do not mix VSTest-only arguments or `.runsettings` assumptions into Microsoft.Testing.Platform commands.
- `.editorconfig` comments must be standalone lines, not inline suffixes on key-value pairs.

## Local Project AGENTS.md Expectations

For each .NET project or module, record:

- entry points and boundaries
- exact local `build`, `test`, `format`, and `analyze` commands when they differ from the root
- the active test framework
- the active runner model
- the coverage driver if the module runs coverage in isolation

Good `Applicable Skills` examples:

- `mcaf-testing`
- `mcaf-dotnet-xunit`
- `mcaf-dotnet-quality-ci`
- `mcaf-dotnet-complexity`

or:

- `mcaf-testing`
- `mcaf-dotnet-mstest`
- `mcaf-dotnet-quality-ci`

## Why This Matters

Without these choices in `AGENTS.md`, agents guess:

- which CLI switches are valid
- whether `.runsettings` applies
- which coverage package fits the runner
- where analyzer severity actually lives

That guesswork is exactly what MCAF is supposed to remove.
