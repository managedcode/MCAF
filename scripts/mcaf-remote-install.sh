#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Remote install MCAF templates + skills into a target repo directory.

Usage:
  curl -fsSL https://raw.githubusercontent.com/managedcode/MCAF/main/scripts/mcaf-remote-install.sh | \
    bash -s -- [options]

Options:
  --dir <path>         Target directory (default: current directory)
  --skills-dir <path>  Skills directory (default: .codex/skills)
  --agent <name>       Agent preset: codex or claude (sets skills dir)
  --repo <git-url>     MCAF repo (default: https://github.com/managedcode/MCAF.git)
  --ref <ref>          Git ref (default: main)
  --no-git             Force archive download (no git clone)
  --prefer-git         Force git clone (useful for private repos)
  --force              Overwrite existing files
  -h|--help            Show this help
EOF
}

FORCE=0
MCAF_REPO="https://github.com/managedcode/MCAF.git"
MCAF_REF="main"
SKILLS_DIR=".codex/skills"
TARGET_DIR="."
AGENT=""
SKILLS_DIR_SET=0
NO_GIT=0
PREFER_GIT=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dir)
      TARGET_DIR="${2:-}"
      shift 2
      ;;
    --skills-dir)
      SKILLS_DIR="${2:-}"
      SKILLS_DIR_SET=1
      shift 2
      ;;
    --agent)
      AGENT="${2:-}"
      shift 2
      ;;
    --repo)
      MCAF_REPO="${2:-}"
      shift 2
      ;;
    --ref)
      MCAF_REF="${2:-}"
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
    --force)
      FORCE=1
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

if [[ -z "$TARGET_DIR" ]]; then
  echo "Missing value for --dir" >&2
  exit 2
fi

if [[ $NO_GIT -eq 1 && $PREFER_GIT -eq 1 ]]; then
  echo "Cannot use --no-git and --prefer-git together." >&2
  exit 2
fi

resolve_agent_skills_dir() {
  local agent="$1"
  case "$agent" in
    codex|Codex|CODEX)
      echo ".codex/skills"
      ;;
    claude|Claude|CLAUDE)
      echo ".claude/skills"
      ;;
    *)
      return 1
      ;;
  esac
}

if [[ -n "$AGENT" && $SKILLS_DIR_SET -eq 0 ]]; then
  if ! SKILLS_DIR="$(resolve_agent_skills_dir "$AGENT")"; then
    echo "Unknown agent: $AGENT (expected codex or claude)" >&2
    exit 2
  fi
fi

if [[ -z "$AGENT" && $SKILLS_DIR_SET -eq 0 ]]; then
  if [[ -t 1 && -r /dev/tty ]]; then
    printf "Select agent for skills install:\n  1) Codex (.codex/skills)\n  2) Claude (.claude/skills)\nChoice [1]: " > /dev/tty
    agent_choice=""
    read -r agent_choice < /dev/tty || true
    case "$agent_choice" in
      2|c|C|claude|Claude|CLAUDE)
        SKILLS_DIR=".claude/skills"
        ;;
      ""|1|c|C|codex|Codex|CODEX)
        SKILLS_DIR=".codex/skills"
        ;;
      *)
        SKILLS_DIR=".codex/skills"
        ;;
    esac
  fi
fi

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

tmp_dir="$(mktemp -d)"
cleanup() { rm -rf "$tmp_dir"; }
trap cleanup EXIT

installer_url="https://raw.githubusercontent.com/managedcode/MCAF/${MCAF_REF}/scripts/mcaf-install.sh"
installer_path="$tmp_dir/mcaf-install.sh"

if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$installer_url" -o "$installer_path"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$installer_path" "$installer_url"
else
  echo "Missing dependency: curl or wget is required." >&2
  exit 1
fi

chmod +x "$installer_path"

install_args=(--repo "$MCAF_REPO" --ref "$MCAF_REF" --skills-dir "$SKILLS_DIR")
if [[ $FORCE -eq 1 ]]; then
  install_args+=(--force)
fi
if [[ $NO_GIT -eq 1 ]]; then
  install_args+=(--no-git)
fi
if [[ $PREFER_GIT -eq 1 ]]; then
  install_args+=(--prefer-git)
fi

"$installer_path" "${install_args[@]}"
