---
name: skillui
description: Use when the user wants to replicate, clone, or draw heavy inspiration from a specific existing website (Stripe, Notion, Linear, Vercel, etc.) OR hand Claude a design system extracted from a real site. Runs as a CLI (`npx skillui --url <URL>`) that outputs a `.skill` bundle containing DESIGN.md, ANIMATIONS.md, LAYOUT.md, COMPONENTS.md, INTERACTIONS.md, scroll screenshots, tokens, and bundled Google Fonts - which Claude then reads to produce pixel-accurate UI.
---

# SkillUI - Reverse-Engineer Any Design System

SkillUI is a CLI, not a pure SKILL.md. It crawls a URL / git repo / local project via pure static analysis (no LLM) and produces a Claude-ready skill bundle.

## How to Invoke

```bash
npm install -g skillui
skillui --url https://example.com --mode ultra
```

`--mode ultra` requires Playwright and captures hover/focus diffs + 7-frame scroll journey. Plain mode skips Playwright.

## Outputs (dropped into cwd as a `.skill` folder + ZIP)

| File | Contents |
|---|---|
| `DESIGN.md` | Colors, typography, spacing, border radius, components |
| `ANIMATIONS.md` | CSS keyframes, scroll triggers, GSAP/Lottie/Three.js detection |
| `LAYOUT.md` | Flex/grid, page structure, spacing relationships |
| `COMPONENTS.md` | DOM patterns, HTML fingerprints, class analysis |
| `INTERACTIONS.md` | Hover/focus state diffs |
| `VISUAL_GUIDE.md` | Master reference with screenshots |
| `screens/scroll/` | 7 cinematic scroll screenshots |
| `tokens/*.json` | Colors, spacing, typography as JSON |
| `fonts/` | Google Fonts bundled locally |

## When to Use

- User says "make it look like Stripe / Notion / Linear"
- You need a real design system as a seed instead of inventing one
- Starting from zero with no brand spec but a reference site

## When NOT to Use

- Building something original — reverse-engineering someone else's look kills differentiation
- Cloning a site 1:1 for production use (legal / IP concerns — confirm with user)
- The target site is behind auth — Playwright ultra mode cannot log in

## Handoff Pattern

1. Run `skillui` on the target URL.
2. `cd` into the produced folder.
3. Open Claude Code there — it auto-reads the bundle.
4. Prompt: "Build me a <page type> using this design system."
5. Combine with the `anti-slop-frontend` mega-skill so the output still passes the taste bar.
