# Mandatory AGENTS.md Update Safety

Policy ID: `MCAF-GOV-001`

Every customized root or project-local `AGENTS.md` is durable repository policy. Its rules are mandatory, not optional guidance, and an MCAF install or update MUST preserve them.

## Mandatory Invariants

1. **Merge; never replace.** If an `AGENTS.md` already exists, read it completely and merge current MCAF additions into it. MUST NOT overwrite the file with a downloaded template.
2. **Preserve every existing rule.** MUST NOT delete, omit, truncate, summarize away, or silently rewrite an existing rule, section, boundary, command, preference, or exception record.
3. **Never weaken policy.** MUST NOT change `MUST` to `SHOULD` or `MAY`, narrow a rule's scope, reduce its priority, introduce a bypass, or reframe a mandatory rule as advisory.
4. **Preserve the stricter rule.** If incoming MCAF guidance conflicts with an existing repository rule, keep the stricter rule and report the conflict. Do not resolve it by deleting or softening either policy silently.
5. **Read root and local files first.** Before installation or update, inventory and read the root `AGENTS.md` plus every project-local `AGENTS.md`. Update each affected file without weakening its parent policy.
6. **Prove preservation.** Review the final diff and confirm that existing rules remain present and equally or more strict, while new required MCAF rules were added.

## Allowed Customization

On first bootstrap, replace `TODO:` values and `...` placeholders with repository facts and remove explicit template-only notes that instruct the installer to do so.

After customization, removing or weakening a real rule requires an explicit, rule-specific instruction from the repository owner. A generic request to "install", "update", "sync", "clean up", or "use the latest template" is not authorization to discard policy.

## Required Update Flow

1. Locate every root and local `AGENTS.md`.
2. Read every file completely and record the applicable rule hierarchy.
3. Fetch the current template to a separate temporary path; never target an existing `AGENTS.md`.
4. Compare the current template with the repository's customized files.
5. Add missing current requirements and adapt placeholders without deleting existing policy.
6. Resolve overlaps by keeping the stricter formulation.
7. Review the complete diff for deletions, omissions, softened verbs, narrowed scope, and lost commands or boundaries.
8. Report preserved rules, added rules, any explicit conflicts, and verification evidence.

## Forbidden Update Patterns

- downloading a template directly over an existing `AGENTS.md`
- recreating the file from memory or from a shortened summary
- copying only selected sections from the existing file
- deleting local rules because the new root template does not contain them
- treating older customized rules as obsolete without explicit evidence and owner direction
- reducing rule importance to make an implementation, test, or migration easier
