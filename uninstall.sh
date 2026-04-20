#!/usr/bin/env bash
# Reverses install.sh: removes the 13 skills from the chosen harness.
# Does NOT restore Anthropic's frontend-design — reinstall the official
# plugin if you want it back.
#
# Usage:
#   ./uninstall.sh                  # default: claude
#   ./uninstall.sh --target codex
#   ./uninstall.sh --target gemini
#   ./uninstall.sh --target all
#   ./uninstall.sh --yes            # non-interactive

set -euo pipefail

TARGET_MODE="claude"
ASSUME_YES=0

while [ $# -gt 0 ]; do
  case "$1" in
    --target)
      shift
      TARGET_MODE="${1:-}"
      ;;
    --target=*)
      TARGET_MODE="${1#--target=}"
      ;;
    --yes|-y) ASSUME_YES=1 ;;
    -h|--help)
      sed -n '2,11p' "$0"
      exit 0
      ;;
    *) echo "Unknown flag: $1" >&2; exit 1 ;;
  esac
  shift
done

case "$TARGET_MODE" in
  claude|codex|gemini|all) ;;
  *) echo "Invalid --target: $TARGET_MODE (expected: claude, codex, gemini, all)" >&2; exit 1 ;;
esac

confirm() {
  local prompt="$1"
  if [ "$ASSUME_YES" -eq 1 ]; then return 0; fi
  read -r -p "$prompt [y/N] " ans
  [[ "$ans" =~ ^[Yy]$ ]]
}

SKILLS=(
  anti-slop-frontend
  verify-frontend-render
  motion-dev-animations
  animate-ui-elements
  google-fonts-picker
  twenty-first-dev
  stitch-workflow
  webflow-inspiration
  skillui
  webgpu
  awesome-design-md
  ui-ux-pro-max
  taste-skill
)

remove_from_dir() {
  local target="$1"
  local label="$2"
  echo "[$label] About to remove from $target:"
  for s in "${SKILLS[@]}"; do printf "  - %s\n" "$s"; done
  echo ""
  if ! confirm "[$label] Proceed?"; then
    echo "[$label] Aborted."
    return
  fi
  for s in "${SKILLS[@]}"; do
    if [ -d "$target/$s" ]; then
      rm -rf "$target/$s"
      printf "[%s] removed %s\n" "$label" "$s"
    fi
  done
}

remove_gemini_extension() {
  local ext_root="$HOME/.gemini/extensions/anti-slop-frontend"
  if [ ! -d "$ext_root" ]; then
    echo "[gemini] Extension not installed at $ext_root — nothing to do."
    return
  fi
  echo "[gemini] About to remove the entire extension at $ext_root"
  if ! confirm "[gemini] Proceed?"; then
    echo "[gemini] Aborted."
    return
  fi
  rm -rf "$ext_root"
  printf "[gemini] removed %s\n" "$ext_root"
}

case "$TARGET_MODE" in
  claude) remove_from_dir "$HOME/.claude/skills" "claude" ;;
  codex)  remove_from_dir "$HOME/.codex/skills" "codex" ;;
  gemini) remove_gemini_extension ;;
  all)
    remove_from_dir "$HOME/.claude/skills" "claude"
    echo ""
    remove_from_dir "$HOME/.codex/skills" "codex"
    echo ""
    remove_gemini_extension
    ;;
esac

echo ""
echo "Done."
