#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Install MCAF baseline templates + skills into the CURRENT directory (target repo root).

Usage:
  mcaf-install.sh [--force] [--repo <git-url>] [--ref <ref>] [--skills-dir <path>] [--no-git|--prefer-git]

Defaults:
  --repo https://github.com/managedcode/MCAF.git
  --ref  main
  --skills-dir .codex/skills

Behaviour:
  - Without --force: do NOT overwrite existing files.
  - With --force: overwrite templates/skills and install missing root files.
  - Default: prefer downloading a GitHub archive (no git required), fallback to git if needed.
  - Use --prefer-git to force git clone (useful for private repos).
  - Use --no-git to force archive download (GitHub only).

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
NO_GIT=0
PREFER_GIT=0

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
    --no-git)
      NO_GIT=1
      shift
      ;;
    --prefer-git)
      PREFER_GIT=1
      shift
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

if [[ $NO_GIT -eq 1 && $PREFER_GIT -eq 1 ]]; then
  echo "Cannot use --no-git and --prefer-git together." >&2
  exit 2
fi

tmp_dir="$(mktemp -d)"
cleanup() { rm -rf "$tmp_dir"; }
trap cleanup EXIT

has_cmd() { command -v "$1" >/dev/null 2>&1; }

normalized_repo="${MCAF_REPO%.git}"
GITHUB_OWNER=""
GITHUB_REPO=""
if [[ "$normalized_repo" =~ ^https://github.com/([^/]+)/([^/]+)$ ]]; then
  GITHUB_OWNER="${BASH_REMATCH[1]}"
  GITHUB_REPO="${BASH_REMATCH[2]}"
elif [[ "$normalized_repo" =~ ^git@github.com:([^/]+)/([^/]+)$ ]]; then
  GITHUB_OWNER="${BASH_REMATCH[1]}"
  GITHUB_REPO="${BASH_REMATCH[2]}"
fi

is_github=0
if [[ -n "$GITHUB_OWNER" && -n "$GITHUB_REPO" ]]; then
  is_github=1
fi

can_use_git=0
if has_cmd git; then
  can_use_git=1
fi

can_use_archive=0
if [[ $is_github -eq 1 ]] && (has_cmd curl || has_cmd wget) && has_cmd tar; then
  can_use_archive=1
fi

mode="auto"
if [[ $NO_GIT -eq 1 ]]; then
  mode="archive"
elif [[ $PREFER_GIT -eq 1 ]]; then
  mode="git"
fi

download_to() {
  local url="$1"
  local out="$2"
  if has_cmd curl; then
    curl -fsSL "$url" -o "$out"
  elif has_cmd wget; then
    wget -qO "$out" "$url"
  else
    return 1
  fi
}

fetch_archive() {
  local ref="$1"
  local dest_dir="$2"
  local archive_url="https://codeload.github.com/${GITHUB_OWNER}/${GITHUB_REPO}/tar.gz/${ref}"
  local archive_path="$tmp_dir/mcaf.tar.gz"
  mkdir -p "$dest_dir"
  if ! download_to "$archive_url" "$archive_path"; then
    return 1
  fi
  tar -xzf "$archive_path" -C "$dest_dir"
  local top_dir
  top_dir="$(find "$dest_dir" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  if [[ -z "$top_dir" ]]; then
    return 1
  fi
  echo "$top_dir"
}

MCAF_SRC_DIR=""
if [[ "$mode" == "git" ]]; then
  if [[ $can_use_git -ne 1 ]]; then
    echo "Missing dependency: git is required with --prefer-git." >&2
    exit 1
  fi
  echo "Cloning MCAF ($MCAF_REF) from $MCAF_REPO ..."
  git clone --depth=1 --branch "$MCAF_REF" "$MCAF_REPO" "$tmp_dir/mcaf" >/dev/null
  MCAF_SRC_DIR="$tmp_dir/mcaf"
elif [[ "$mode" == "archive" ]]; then
  if [[ $can_use_archive -ne 1 ]]; then
    if [[ $is_github -ne 1 ]]; then
      echo "Archive download only supported for GitHub repos. Use --prefer-git." >&2
    else
      echo "Missing dependency: curl/wget + tar are required for --no-git." >&2
    fi
    exit 1
  fi
  echo "Downloading MCAF archive ($MCAF_REF) from $MCAF_REPO ..."
  if ! MCAF_SRC_DIR="$(fetch_archive "$MCAF_REF" "$tmp_dir/src")"; then
    echo "Archive download failed." >&2
    exit 1
  fi
else
  if [[ $can_use_archive -eq 1 ]]; then
    echo "Downloading MCAF archive ($MCAF_REF) from $MCAF_REPO ..."
    if ! MCAF_SRC_DIR="$(fetch_archive "$MCAF_REF" "$tmp_dir/src")"; then
      if [[ $can_use_git -eq 1 ]]; then
        echo "Archive download failed; falling back to git clone ..."
        git clone --depth=1 --branch "$MCAF_REF" "$MCAF_REPO" "$tmp_dir/mcaf" >/dev/null
        MCAF_SRC_DIR="$tmp_dir/mcaf"
      else
        echo "Archive download failed and git is unavailable." >&2
        exit 1
      fi
    fi
  elif [[ $can_use_git -eq 1 ]]; then
    echo "Cloning MCAF ($MCAF_REF) from $MCAF_REPO ..."
    git clone --depth=1 --branch "$MCAF_REF" "$MCAF_REPO" "$tmp_dir/mcaf" >/dev/null
    MCAF_SRC_DIR="$tmp_dir/mcaf"
  else
    echo "Missing dependency: need either git or (curl/wget + tar for GitHub archives)." >&2
    exit 1
  fi
fi

mkdir -p \
  docs/templates \
  docs/Architecture \
  docs/ADR \
  docs/Features \
  "$SKILLS_DIR"

if [[ $FORCE -eq 1 ]]; then
  echo "Copying templates (overwrite enabled) ..."
  cp -R "$MCAF_SRC_DIR/docs/templates/." docs/templates/
  echo "Copying skills (overwrite enabled) ..."
  cp -R "$MCAF_SRC_DIR/skills/." "$SKILLS_DIR/"
else
  echo "Copying templates (no overwrite) ..."
  cp -R -n "$MCAF_SRC_DIR/docs/templates/." docs/templates/ || true
  echo "Copying skills (no overwrite) ..."
  cp -R -n "$MCAF_SRC_DIR/skills/." "$SKILLS_DIR/" || true
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
