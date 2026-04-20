#!/usr/bin/env bash
# anti-slop-frontend-pack installer
# Installs 12 Claude Code skills into ~/.claude/skills/ to produce rich,
# intentional frontend output and kill AI slop.
#
# Usage:
#   ./install.sh              # interactive — prompts before removing Anthropic's frontend-design
#   ./install.sh --yes        # non-interactive, assume yes to all prompts
#   ./install.sh --keep-anthropic  # keep Anthropic's frontend-design skill alongside ours

set -euo pipefail

PACK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME/.claude/skills"
ASSUME_YES=0
KEEP_ANTHROPIC=0

for arg in "$@"; do
  case "$arg" in
    --yes|-y) ASSUME_YES=1 ;;
    --keep-anthropic) KEEP_ANTHROPIC=1 ;;
    -h|--help)
      sed -n '2,12p' "$0"
      exit 0
      ;;
    *) echo "Unknown flag: $arg" >&2; exit 1 ;;
  esac
done

log()  { printf "\033[1;36m==>\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m[warn]\033[0m %s\n" "$*"; }
err()  { printf "\033[1;31m[err]\033[0m %s\n" "$*" >&2; }

confirm() {
  local prompt="$1"
  if [ "$ASSUME_YES" -eq 1 ]; then return 0; fi
  read -r -p "$prompt [y/N] " ans
  [[ "$ans" =~ ^[Yy]$ ]]
}

# -- preflight ---------------------------------------------------------------

command -v git >/dev/null 2>&1 || { err "git is required."; exit 1; }
command -v python3 >/dev/null 2>&1 || warn "python3 not found - sources.json parsing will use fallback."

mkdir -p "$TARGET"
log "Target directory: $TARGET"

# -- remove Anthropic default if requested ----------------------------------

if [ "$KEEP_ANTHROPIC" -eq 0 ] && [ -d "$TARGET/frontend-design" ]; then
  if confirm "Remove Anthropic's default 'frontend-design' skill? (recommended - anti-slop-frontend replaces it)"; then
    rm -rf "$TARGET/frontend-design"
    log "Removed $TARGET/frontend-design"
  else
    warn "Kept Anthropic's frontend-design - the mega-skill still works but both may fire on frontend tasks."
  fi
fi

# -- clone upstream repos ----------------------------------------------------

read_sources() {
  # Emit "name<TAB>url" pairs from sources.json
  if command -v python3 >/dev/null 2>&1; then
    python3 -c "
import json, sys
with open('$PACK_DIR/sources.json') as f:
    data = json.load(f)
for r in data['repos']:
    print(f\"{r['name']}\t{r['url']}\")
"
  else
    # minimal fallback - tolerates formatting changes in sources.json poorly
    grep -E '"(name|url)"' "$PACK_DIR/sources.json" | \
      sed -E 's/.*"(name|url)": *"([^"]+)".*/\2/' | \
      paste -d '\t' - -
  fi
}

while IFS=$'\t' read -r name url; do
  [ -z "$name" ] && continue
  dest="$TARGET/$name"
  if [ -d "$dest/.git" ]; then
    log "Updating $name (git pull)"
    (cd "$dest" && git pull --ff-only --quiet) || warn "$name: git pull failed - continuing"
  elif [ -d "$dest" ]; then
    warn "$dest exists but is not a git repo. Skipping clone. Back it up manually if you want our wrapper."
  else
    log "Cloning $name from $url"
    git clone --depth 1 --quiet "$url" "$dest"
  fi
done < <(read_sources)

# -- copy our custom skills (mega + reference) ------------------------------

CUSTOM_SKILLS=(
  anti-slop-frontend
  motion-dev-animations
  animate-ui-elements
  google-fonts-picker
  twenty-first-dev
  stitch-workflow
  webflow-inspiration
)

for s in "${CUSTOM_SKILLS[@]}"; do
  mkdir -p "$TARGET/$s"
  cp "$PACK_DIR/skills/$s/SKILL.md" "$TARGET/$s/SKILL.md"
  log "Installed skill: $s"
done

# -- place wrapper SKILL.md on top of each cloned repo ----------------------

WRAPPERS=(skillui webgpu awesome-design-md ui-ux-pro-max taste-skill)

for w in "${WRAPPERS[@]}"; do
  if [ -d "$TARGET/$w" ]; then
    cp "$PACK_DIR/skills/$w/SKILL.md" "$TARGET/$w/SKILL.md"
    log "Placed wrapper: $w/SKILL.md"
  else
    warn "Upstream $w not present - wrapper not placed. Re-run after clone succeeds."
  fi
done

# -- done --------------------------------------------------------------------

log "Install complete."
echo ""
echo "Skills installed:"
for s in "${CUSTOM_SKILLS[@]}" "${WRAPPERS[@]}"; do
  printf "  - %s\n" "$s"
done
echo ""
echo "Open any Claude Code session and run a frontend task. The 'anti-slop-frontend' skill should"
echo "fire first and route to the right specialist. If it doesn't, restart your Claude Code client"
echo "so it re-scans ~/.claude/skills/."
