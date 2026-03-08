---
name: mcaf-dotnet-features
description: "Write modern, version-aware C# for .NET repositories. Use when choosing language features across C# versions, especially C# 13 and C# 14, while staying compatible with the repo's target framework and `LangVersion`."
compatibility: "Requires a C# or .NET repository; respects explicit `LangVersion` and target framework settings."
---

# MCAF: .NET Features

## Trigger On

- the repo wants more modern idiomatic C# code
- a change depends on language-version compatibility
- the team is upgrading or reviewing C# feature usage across versions
- you need to know whether a C# 13 or C# 14 feature is safe to use

## Do Not Use For

- non-C# .NET languages such as F# or VB
- analyzer-only or formatter-only setup with no language feature choice

## Inputs

- target `TFM` or `TFMs`
- explicit `LangVersion`, if any
- current SDK version
- team style rules in `.editorconfig` and `AGENTS.md`

## Workflow

1. Detect the real language ceiling from the repo's target framework and explicit `LangVersion`.
2. Prefer stable features that the current repo actually supports.
3. Use modern syntax when it reduces ceremony, improves correctness, or makes invariants clearer.
4. Do not mass-rewrite a codebase into newer syntax unless the repo wants that churn.
5. Treat preview features as opt-in only. Never assume preview because the current machine has a newer SDK.
6. Pay special attention to C# 13 and C# 14:
   - C# 13 is the stable language for `.NET 9`
   - C# 14 is the stable language for `.NET 10`
7. When feature selection changes architecture, style rules, or generated-code patterns, coordinate with:
   - `mcaf-dotnet`
   - `mcaf-dotnet-analyzer-config`
   - `mcaf-solid-maintainability`
8. After feature-driven refactors, run the repo's .NET quality pass through `mcaf-dotnet`.

## Deliver

- modern C# code that fits the repo's real language version
- fewer obsolete patterns when a newer stable feature is clearer
- no accidental preview or unsupported-language drift

## Validate

- the chosen syntax is supported by the repo's `TFM` and `LangVersion`
- the feature improves clarity, correctness, or maintainability
- preview-only features are used only when the repo explicitly opted in
- style and analyzer rules still agree with the new syntax

## Findings Loop

When this skill is used to run a checker, analyzer, test gate, or verification command:

1. Run the command in read-only or report mode first and collect findings.
2. Return a concise findings list with only actionable items:
   - rule or check id
   - `file:line`
   - one-line fix intent
3. Fix findings in small batches without hiding rules unless the repo already documents an exception.
4. Re-run the same command after each fix batch.
5. Repeat until the gate passes or only explicitly accepted exceptions remain.
6. Keep output trimmed: include counts and the top remaining items only, not raw full logs.

For setup-only requests that do not execute checks, return `status: configured` and the exact commands that should be run later.

## Load References

- read `references/csharp-modern-features.md` first

## Example Requests

- "Make this C# code more modern."
- "Which features can we use on .NET 9?"
- "Review this repo for C# 13 or C# 14 opportunities."
