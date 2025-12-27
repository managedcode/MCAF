#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Fetch the latest MCAF templates + skills into a snapshot folder (safe for updating existing repos).

Usage:
  mcaf-upstream-snapshot.sh [--repo <git-url>] [--ref <ref>] [--out <dir>] [--skills-dir <path>]

Defaults:
  --repo https://github.com/managedcode/MCAF.git
  --ref  main
  --out  .mcaf/upstream/<timestamp>/
  --skills-dir .codex/skills

Notes:
  - Run this from the TARGET repo root.
  - This does NOT overwrite your current docs/templates or skills dir.
EOF
}

MCAF_REPO="https://github.com/managedcode/MCAF.git"
MCAF_REF="main"
OUT_DIR=""
SKILLS_DIR=".codex/skills"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --repo)
      MCAF_REPO="${2:-}"
      shift 2
      ;;
    --ref)
      MCAF_REF="${2:-}"
      shift 2
      ;;
    --out)
      OUT_DIR="${2:-}"
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

if [[ -z "$OUT_DIR" ]]; then
  ts="$(date +%Y%m%d-%H%M%S)"
  OUT_DIR=".mcaf/upstream/$ts"
fi

if [[ ! -d .git ]]; then
  echo "WARNING: .git not found. Make sure you are in the target repo root." >&2
fi

tmp_dir="$(mktemp -d)"
cleanup() { rm -rf "$tmp_dir"; }
trap cleanup EXIT

echo "Cloning MCAF ($MCAF_REF) from $MCAF_REPO ..."
git clone --depth=1 --branch "$MCAF_REF" "$MCAF_REPO" "$tmp_dir/mcaf" >/dev/null

mkdir -p "$OUT_DIR"
git -C "$tmp_dir/mcaf" rev-parse HEAD > "$OUT_DIR/mcaf.commit"

mkdir -p "$OUT_DIR/docs"
cp -R "$tmp_dir/mcaf/docs/templates" "$OUT_DIR/docs/"
mkdir -p "$OUT_DIR/$SKILLS_DIR"
cp -R "$tmp_dir/mcaf/skills/." "$OUT_DIR/$SKILLS_DIR/"

echo ""
echo "Upstream snapshot written to: $OUT_DIR"
echo "Commit: $(cat "$OUT_DIR/mcaf.commit")"
echo ""
echo "Review diffs:"
echo "  diff -ruN docs/templates \"$OUT_DIR/docs/templates\" | less"
echo "  diff -ruN \"$SKILLS_DIR\" \"$OUT_DIR/$SKILLS_DIR\" | less"
