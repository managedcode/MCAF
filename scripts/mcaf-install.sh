#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Install MCAF baseline templates + skills into the CURRENT directory (target repo root).

Usage:
  mcaf-install.sh [--force] [--repo <git-url>] [--ref <ref>] [--skills-dir <path>]

Defaults:
  --repo https://github.com/managedcode/MCAF.git
  --ref  main
  --skills-dir .codex/skills

Behaviour:
  - Without --force: do NOT overwrite existing files.
  - With --force: overwrite templates/skills and install missing root files.

Output:
  - docs/templates/*
  - docs/Architecture/Overview.md (from template if missing)
  - <skills-dir>/* (baseline skills)
  - AGENTS.md (from template if missing)
EOF
}

FORCE=0
MCAF_REPO="https://github.com/managedcode/MCAF.git"
MCAF_REF="main"
SKILLS_DIR=".codex/skills"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force)
      FORCE=1
      shift
      ;;
    --repo)
      MCAF_REPO="${2:-}"
      shift 2
      ;;
    --ref)
      MCAF_REF="${2:-}"
      shift 2
      ;;
    --skills-dir)
      SKILLS_DIR="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ ! -d .git ]]; then
  echo "WARNING: .git not found. Make sure you are in the target repo root." >&2
fi

tmp_dir="$(mktemp -d)"
cleanup() { rm -rf "$tmp_dir"; }
trap cleanup EXIT

echo "Cloning MCAF ($MCAF_REF) from $MCAF_REPO ..."
git clone --depth=1 --branch "$MCAF_REF" "$MCAF_REPO" "$tmp_dir/mcaf" >/dev/null

mkdir -p \
  docs/templates \
  docs/Architecture \
  docs/ADR \
  docs/Features \
  "$SKILLS_DIR"

if [[ $FORCE -eq 1 ]]; then
  echo "Copying templates (overwrite enabled) ..."
  cp -R "$tmp_dir/mcaf/docs/templates/." docs/templates/
  echo "Copying skills (overwrite enabled) ..."
  cp -R "$tmp_dir/mcaf/skills/." "$SKILLS_DIR/"
else
  echo "Copying templates (no overwrite) ..."
  cp -R -n "$tmp_dir/mcaf/docs/templates/." docs/templates/ || true
  echo "Copying skills (no overwrite) ..."
  cp -R -n "$tmp_dir/mcaf/skills/." "$SKILLS_DIR/" || true
fi

if [[ ! -f AGENTS.md || $FORCE -eq 1 ]]; then
  echo "Installing root AGENTS.md ..."
  cp docs/templates/AGENTS.md AGENTS.md
else
  echo "Skipping AGENTS.md (already exists)."
fi

if [[ ! -f docs/Architecture/Overview.md || $FORCE -eq 1 ]]; then
  echo "Installing docs/Architecture/Overview.md ..."
  cp docs/templates/Architecture-Template.md docs/Architecture/Overview.md
else
  echo "Skipping docs/Architecture/Overview.md (already exists)."
fi

echo ""
echo "Done."
echo "Next:"
echo "  1) Customize AGENTS.md with REAL commands and rules."
echo "  2) Fill docs/Architecture/Overview.md (modules/boundaries + ADR links)."
echo "  3) Restart your agent so it reloads skills from: $SKILLS_DIR"
echo "  4) Run build/test/format commands from AGENTS.md to verify."
