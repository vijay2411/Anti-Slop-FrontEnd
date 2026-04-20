#!/usr/bin/env bash
# anti-slop-frontend-pack installer
# Installs 13 skills into the chosen agent's skills directory to produce
# rich, intentional frontend output, enforce multi-device + verified
# rendering, and kill AI slop. Supports Claude Code, OpenAI Codex CLI,
# and Google Gemini CLI.
#
# Usage:
#   ./install.sh                         # default target: claude (Claude Code)
#   ./install.sh --target codex          # install to ~/.codex/skills/
#   ./install.sh --target gemini         # install as ~/.gemini/extensions/anti-slop-frontend/
#   ./install.sh --target all            # install to all three harnesses
#   ./install.sh --yes                   # assume yes to all prompts
#   ./install.sh --keep-anthropic        # keep Anthropic's frontend-design
#   ./install.sh -h | --help             # show usage

set -euo pipefail

PACK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_MODE="claude"
ASSUME_YES=0
KEEP_ANTHROPIC=0

# -- arg parsing -------------------------------------------------------------

while [ $# -gt 0 ]; do
  case "$1" in
    --target)
      shift
      TARGET_MODE="${1:-}"
      case "$TARGET_MODE" in
        claude|codex|gemini|all) ;;
        *) echo "Invalid --target: $TARGET_MODE (expected: claude, codex, gemini, all)" >&2; exit 1 ;;
      esac
      ;;
    --target=*)
      TARGET_MODE="${1#--target=}"
      case "$TARGET_MODE" in
        claude|codex|gemini|all) ;;
        *) echo "Invalid --target: $TARGET_MODE (expected: claude, codex, gemini, all)" >&2; exit 1 ;;
      esac
      ;;
    --yes|-y) ASSUME_YES=1 ;;
    --keep-anthropic) KEEP_ANTHROPIC=1 ;;
    -h|--help)
      sed -n '2,15p' "$0"
      exit 0
      ;;
    *) echo "Unknown flag: $1" >&2; exit 1 ;;
  esac
  shift
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

# -- sources.json reader ----------------------------------------------------

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

CUSTOM_SKILLS=(
  anti-slop-frontend
  verify-frontend-render
  motion-dev-animations
  animate-ui-elements
  google-fonts-picker
  twenty-first-dev
  stitch-workflow
  webflow-inspiration
)

WRAPPERS=(skillui webgpu awesome-design-md ui-ux-pro-max taste-skill)

# -- core install (takes a target skills dir) -------------------------------

install_to_dir() {
  local target="$1"
  local label="$2"

  mkdir -p "$target"
  log "[$label] Target directory: $target"

  # Remove Anthropic default (Claude-only — other harnesses don't have it)
  if [ "$label" = "claude" ] && [ "$KEEP_ANTHROPIC" -eq 0 ] && [ -d "$target/frontend-design" ]; then
    if confirm "[$label] Remove Anthropic's default 'frontend-design' skill? (recommended — anti-slop-frontend replaces it)"; then
      rm -rf "$target/frontend-design"
      log "[$label] Removed $target/frontend-design"
    else
      warn "[$label] Kept Anthropic's frontend-design — both may fire on frontend tasks."
    fi
  fi

  # Clone upstream repos
  while IFS=$'\t' read -r name url; do
    [ -z "$name" ] && continue
    local dest="$target/$name"
    if [ -d "$dest/.git" ]; then
      log "[$label] Updating $name (git pull)"
      (cd "$dest" && git pull --ff-only --quiet) || warn "$name: git pull failed — continuing"
    elif [ -d "$dest" ]; then
      warn "[$label] $dest exists but is not a git repo. Skipping clone."
    else
      log "[$label] Cloning $name from $url"
      git clone --depth 1 --quiet "$url" "$dest"
    fi
  done < <(read_sources)

  # Copy custom skills
  for s in "${CUSTOM_SKILLS[@]}"; do
    mkdir -p "$target/$s"
    cp "$PACK_DIR/skills/$s/SKILL.md" "$target/$s/SKILL.md"
    log "[$label] Installed skill: $s"
  done

  # Place wrapper SKILL.md on each cloned repo
  for w in "${WRAPPERS[@]}"; do
    if [ -d "$target/$w" ]; then
      cp "$PACK_DIR/skills/$w/SKILL.md" "$target/$w/SKILL.md"
      log "[$label] Placed wrapper: $w/SKILL.md"
    else
      warn "[$label] Upstream $w not present — wrapper not placed."
    fi
  done
}

# -- gemini extension manifest ----------------------------------------------

write_gemini_manifest() {
  local ext_root="$1"
  cat > "$ext_root/gemini-extension.json" <<'EOF'
{
  "name": "anti-slop-frontend",
  "version": "1.1.0",
  "description": "Stop AI-slop frontend. Routes every frontend task through 13 skills enforcing functional + secure + brownfield-respectful output, rich motion, adventurous colour, multi-device responsive, and browser-rendered verification.",
  "contextFileName": "skills/anti-slop-frontend/SKILL.md"
}
EOF
}

# -- per-target install wrappers --------------------------------------------

install_claude() {
  install_to_dir "$HOME/.claude/skills" "claude"
  echo ""
  log "[claude] Install complete. Restart Claude Code so it rescans ~/.claude/skills/."
}

install_codex() {
  install_to_dir "$HOME/.codex/skills" "codex"
  echo ""
  log "[codex] Install complete. Restart Codex so it rescans ~/.codex/skills/."
  echo "       (Optional: configure per-skill in ~/.codex/config.toml via [[skills.config]] entries.)"
}

install_gemini() {
  local ext_root="$HOME/.gemini/extensions/anti-slop-frontend"
  mkdir -p "$ext_root"
  write_gemini_manifest "$ext_root"
  log "[gemini] Wrote extension manifest: $ext_root/gemini-extension.json"
  install_to_dir "$ext_root/skills" "gemini"
  echo ""
  log "[gemini] Install complete. Restart Gemini CLI."
  echo "       The extension is at $ext_root — Gemini will load it on next startup."
  echo "       Skills activate via the 'activate_skill' tool when the agent matches a task to a skill description."
}

# -- dispatch ----------------------------------------------------------------

case "$TARGET_MODE" in
  claude) install_claude ;;
  codex)  install_codex ;;
  gemini) install_gemini ;;
  all)
    install_claude
    echo ""
    install_codex
    echo ""
    install_gemini
    ;;
esac

echo ""
echo "Skills installed:"
for s in "${CUSTOM_SKILLS[@]}" "${WRAPPERS[@]}"; do
  printf "  - %s\n" "$s"
done
