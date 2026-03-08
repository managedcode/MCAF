#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skills_dir="$repo_root/skills"

required_headers=(
  "## Trigger On"
  "## Value"
  "## Do Not Use For"
  "## Inputs"
  "## Quick Start"
  "## Workflow"
  "## Deliver"
  "## Validate"
  "## Ralph Loop"
  "### Required Result Format"
  "## Load References"
  "## Example Requests"
)

fail_count=0
checked_count=0

for skill_file in "$skills_dir"/mcaf-*/SKILL.md; do
  checked_count=$((checked_count + 1))
  skill_name="$(basename "$(dirname "$skill_file")")"
  local_fail=0

  for header in "${required_headers[@]}"; do
    if ! rg -q "^${header}$" "$skill_file"; then
      echo "[FAIL] $skill_name missing header: $header"
      local_fail=1
    fi
  done

  workflow_steps="$(awk '
    /^## Workflow$/ {sec=1; next}
    /^## / && sec {sec=0}
    sec && /^[0-9]+\./ {c++}
    END{print c+0}
  ' "$skill_file")"

  if [[ "$workflow_steps" -lt 3 ]]; then
    echo "[FAIL] $skill_name has too few workflow steps: $workflow_steps (min: 3)"
    local_fail=1
  fi

  deliver_bullets="$(awk '
    /^## Deliver$/ {sec=1; next}
    /^## / && sec {sec=0}
    sec && /^- / {c++}
    END{print c+0}
  ' "$skill_file")"

  validate_bullets="$(awk '
    /^## Validate$/ {sec=1; next}
    /^## / && sec {sec=0}
    sec && /^- / {c++}
    END{print c+0}
  ' "$skill_file")"

  if [[ "$deliver_bullets" -lt 1 ]]; then
    echo "[FAIL] $skill_name has empty Deliver section"
    local_fail=1
  fi

  if [[ "$validate_bullets" -lt 1 ]]; then
    echo "[FAIL] $skill_name has empty Validate section"
    local_fail=1
  fi

  if ! rg -q "final validation skills" "$skill_file"; then
    echo "[FAIL] $skill_name Ralph Loop is missing final validation skills requirement"
    local_fail=1
  fi

  if [[ "$local_fail" -eq 0 ]]; then
    echo "[OK]   $skill_name"
  else
    fail_count=$((fail_count + 1))
  fi
done

echo
echo "Checked: $checked_count skills"
echo "Failed : $fail_count skills"

if [[ "$fail_count" -ne 0 ]]; then
  exit 1
fi

