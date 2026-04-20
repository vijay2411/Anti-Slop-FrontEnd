#!/usr/bin/env bash
# Reverses install.sh: removes the 12 skills this pack installed.
# Does NOT restore Anthropic's frontend-design - reinstall the official plugin if you want it back.

set -euo pipefail

TARGET="$HOME/.claude/skills"
ASSUME_YES=0

for arg in "$@"; do
  case "$arg" in
    --yes|-y) ASSUME_YES=1 ;;
  esac
done

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

echo "About to remove from $TARGET:"
for s in "${SKILLS[@]}"; do printf "  - %s\n" "$s"; done
echo ""

if ! confirm "Proceed?"; then
  echo "Aborted."
  exit 0
fi

for s in "${SKILLS[@]}"; do
  if [ -d "$TARGET/$s" ]; then
    rm -rf "$TARGET/$s"
    printf "removed %s\n" "$s"
  fi
done

echo "Done. To restore Anthropic's frontend-design, reinstall the claude-plugins-official marketplace plugin."
