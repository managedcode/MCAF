#!/usr/bin/env bash

set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
architecture_policy_id="MCAF-ARCH-001"
governance_policy_id="MCAF-GOV-001"
model_tier_policy_id="MCAF-AI-001"
requirements_policy_id="MCAF-REQ-001"
architecture_reference="${repository_root}/skills/mcaf-solution-governance/references/monorepo-vertical-slices.md"
governance_reference="${repository_root}/skills/mcaf-solution-governance/references/agents-update-safety.md"
model_tier_reference="${repository_root}/skills/mcaf-solution-governance/references/model-tier-orchestration.md"
requirements_reference="${repository_root}/skills/mcaf-feature-spec/references/requirements-adr-traceability.md"
failures=0
template_count=0

require_text() {
  local file_path="$1"
  local expected_text="$2"

  if ! grep -Fq -- "${expected_text}" "${file_path}"; then
    printf 'ERROR: %s must contain %q\n' "${file_path#"${repository_root}/"}" "${expected_text}" >&2
    failures=$((failures + 1))
  fi
}

require_text "${architecture_reference}" 'One solution, one repository.'
require_text "${architecture_reference}" 'backend applications, frontend applications, shared contracts, automated tests, infrastructure and deployment assets, and durable documentation MUST live in the same version-control repository'
require_text "${architecture_reference}" 'One canonical slice name.'
require_text "${architecture_reference}" 'Local rules cannot weaken this policy.'
require_text "${architecture_reference}" '## What a Vertical Slice Means for AI Coding'
require_text "${architecture_reference}" '## How to Structure the Solution'

while IFS= read -r template_path; do
  template_count=$((template_count + 1))
  require_text "${template_path}" "${architecture_policy_id}"
  require_text "${template_path}" "${model_tier_policy_id}"
  require_text "${template_path}" "${requirements_policy_id}"
done < <(
  find "${repository_root}/docs/templates" "${repository_root}/skills" \
    -type f \( -name '*template*.md' -o -path '*/docs/templates/*.md' \) \
    | LC_ALL=C sort
)

if ((template_count == 0)); then
  printf 'ERROR: no authoring templates were discovered\n' >&2
  failures=$((failures + 1))
fi

architecture_consumers=(
  "README.md"
  "TUTORIAL.md"
  "skills/mcaf-solution-governance/SKILL.md"
  "skills/mcaf-solution-governance/references/rule-precedence.md"
  "skills/mcaf-solution-governance/references/dotnet-agents-pattern.md"
  "skills/mcaf-architecture-overview/SKILL.md"
  "skills/mcaf-feature-spec/SKILL.md"
  "skills/mcaf-adr-writing/SKILL.md"
  "skills/mcaf-code-review/SKILL.md"
  "skills/mcaf-devex/SKILL.md"
  "skills/mcaf-source-control/SKILL.md"
  "skills/mcaf-source-control/references/source-control.md"
  "skills/mcaf-testing/SKILL.md"
  "skills/mcaf-documentation/SKILL.md"
  "skills/mcaf-documentation/references/documentation.md"
)

for relative_path in "${architecture_consumers[@]}"; do
  require_text "${repository_root}/${relative_path}" "${architecture_policy_id}"
done

require_text "${repository_root}/README.md" '### 2.6 Vertical-Slice Architecture for AI Coding'
require_text "${repository_root}/TUTORIAL.md" '### 2.1 Structure the Solution for AI Coding'
require_text "${repository_root}/README.md" 'src/Backend/Features/Orders/'
require_text "${repository_root}/TUTORIAL.md" 'src/Backend/Features/<SliceName>/'

require_text "${governance_reference}" 'Merge; never replace.'
require_text "${governance_reference}" 'Preserve every existing rule.'
require_text "${governance_reference}" 'Never weaken policy.'
require_text "${governance_reference}" 'Preserve the stricter rule.'

governance_consumers=(
  "README.md"
  "TUTORIAL.md"
  "docs/templates/AGENTS.md"
  "skills/mcaf-solution-governance/SKILL.md"
  "skills/mcaf-solution-governance/references/rule-precedence.md"
  "skills/mcaf-solution-governance/references/project-agents-template.md"
)

for relative_path in "${governance_consumers[@]}"; do
  require_text "${repository_root}/${relative_path}" "${governance_policy_id}"
done

require_text "${repository_root}/TUTORIAL.md" 'update AGENTS.md files by merging; never replace, truncate, summarize, or omit existing rules or sections'
require_text "${repository_root}/TUTORIAL.md" 'if [[ ! -e AGENTS.md ]]; then'

require_text "${model_tier_reference}" 'The strongest suitable large or high-capability model available owns planning and integration'
require_text "${model_tier_reference}" 'least expensive model that is still capable'
require_text "${model_tier_reference}" '## Required Worker Instruction Packet'
require_text "${model_tier_reference}" '## Lead Review Gate'
require_text "${model_tier_reference}" '## Multi-Agent Run Protocol'
require_text "${model_tier_reference}" '## Completion State Contract'
require_text "${model_tier_reference}" '## Platform Adapters'
require_text "${model_tier_reference}" 'Wait and join'

model_tier_consumers=(
  "README.md"
  "TUTORIAL.md"
  "docs/templates/AGENTS.md"
  "docs/templates/CLAUDE.md"
  "skills/mcaf-solution-governance/SKILL.md"
  "skills/mcaf-solution-governance/references/rule-precedence.md"
  "skills/mcaf-solution-governance/references/project-agents-template.md"
  "skills/mcaf-code-review/SKILL.md"
  "skills/mcaf-code-review/references/pull-request-template.md"
  "skills/mcaf-devex/references/onboarding-guide-template.md"
  "skills/mcaf-feature-spec/SKILL.md"
  "skills/mcaf-feature-spec/references/feature-template.md"
  "skills/mcaf-adr-writing/SKILL.md"
  "skills/mcaf-adr-writing/references/adr-template.md"
  "skills/mcaf-feature-spec/references/requirements-adr-traceability.md"
)

for relative_path in "${model_tier_consumers[@]}"; do
  require_text "${repository_root}/${relative_path}" "${model_tier_policy_id}"
done

require_text "${repository_root}/TUTORIAL.md" '### 2.2 Configure Mandatory Model-Tier Orchestration'
require_text "${repository_root}/TUTORIAL.md" 'least expensive capable models with exact instructions'

require_text "${requirements_reference}" 'Every non-trivial feature MUST have an executable feature specification before implementation.'
require_text "${requirements_reference}" '## Feature Requirements Contract'
require_text "${requirements_reference}" '## ADR Implementation Contract'
require_text "${requirements_reference}" '## Required Traceability'
require_text "${requirements_reference}" '## Multi-Agent Gate'

requirements_consumers=(
  "README.md"
  "TUTORIAL.md"
  "docs/templates/AGENTS.md"
  "docs/templates/CLAUDE.md"
  "skills/mcaf-solution-governance/SKILL.md"
  "skills/mcaf-solution-governance/references/rule-precedence.md"
  "skills/mcaf-solution-governance/references/project-agents-template.md"
  "skills/mcaf-feature-spec/SKILL.md"
  "skills/mcaf-feature-spec/references/feature-template.md"
  "skills/mcaf-adr-writing/SKILL.md"
  "skills/mcaf-adr-writing/references/adr-template.md"
  "skills/mcaf-code-review/SKILL.md"
  "skills/mcaf-code-review/references/pull-request-template.md"
  "skills/mcaf-testing/SKILL.md"
  "skills/mcaf-documentation/SKILL.md"
  "skills/mcaf-documentation/references/documentation.md"
  "skills/mcaf-architecture-overview/SKILL.md"
  "skills/mcaf-architecture-overview/references/overview-template.md"
  "skills/mcaf-devex/references/onboarding-guide-template.md"
  "skills/mcaf-devex/SKILL.md"
  "skills/mcaf-source-control/SKILL.md"
  "skills/mcaf-source-control/references/source-control.md"
  "skills/mcaf-solution-governance/references/dotnet-agents-pattern.md"
)

for relative_path in "${requirements_consumers[@]}"; do
  require_text "${repository_root}/${relative_path}" "${requirements_policy_id}"
done

require_text "${repository_root}/skills/mcaf-feature-spec/references/feature-template.md" "## Requirements-to-Implementation Traceability (\`MCAF-REQ-001\`)"
require_text "${repository_root}/skills/mcaf-feature-spec/references/feature-template.md" "## Multi-Agent Execution Contract (\`MCAF-AI-001\`)"
require_text "${repository_root}/skills/mcaf-adr-writing/references/adr-template.md" '## Implementation Contract'
require_text "${repository_root}/skills/mcaf-adr-writing/references/adr-template.md" "## Requirements and Decision Traceability (\`MCAF-REQ-001\`)"
require_text "${repository_root}/TUTORIAL.md" '### 2.3 Require Feature Requirements and ADR Implementation Contracts'

skill_count=0

while IFS= read -r skill_path; do
  skill_count=$((skill_count + 1))

  if ! grep -Eq '^name: mcaf-[a-z0-9-]+$' "${skill_path}"; then
    printf 'ERROR: %s must declare a name with the mcaf- prefix\n' "${skill_path#"${repository_root}/"}" >&2
    failures=$((failures + 1))
  fi

  if grep -Eq '^compatibility:' "${skill_path}"; then
    printf 'ERROR: %s uses the obsolete top-level compatibility key\n' "${skill_path#"${repository_root}/"}" >&2
    failures=$((failures + 1))
  fi
done < <(find "${repository_root}/skills" -mindepth 2 -maxdepth 2 -name SKILL.md | LC_ALL=C sort)

if ((skill_count == 0)); then
  printf 'ERROR: no MCAF skills were discovered\n' >&2
  failures=$((failures + 1))
fi

if ((failures > 0)); then
  printf 'Mandatory policy verification failed with %d error(s).\n' "${failures}" >&2
  exit 1
fi

printf 'Mandatory policy verification passed for %d template(s), %d architecture consumer(s), %d governance consumer(s), %d model-tier consumer(s), %d requirements consumer(s), and %d current mcaf-* skill(s).\n' \
  "${template_count}" "${#architecture_consumers[@]}" "${#governance_consumers[@]}" "${#model_tier_consumers[@]}" "${#requirements_consumers[@]}" "${skill_count}"
