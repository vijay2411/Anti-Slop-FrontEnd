---
name: taste-skill
description: Use when the user asks for a frontend that should NOT look like generic AI output - "premium", "dark", "cinematic", "make it taste better", "anti-slop", "OLED feel", "magazine-grade", or complains that the current design looks sloppy/AI-generated. Encodes an opinionated design philosophy as hard engineering constraints, with 7 specialized variants covering taste, minimalist, brutalist, soft, stitch, redesign, and output-polish modes.
---

# Taste Skill

A collection of high-agency frontend skills that override LLM defaults. Core baseline: `DESIGN_VARIANCE=8`, `MOTION_INTENSITY=6`, `VISUAL_DENSITY=4`. CSS hardware acceleration is enforced. Component architecture is strict.

## Variants (pick one based on vibe)

All live under `skills/<name>/SKILL.md` inside this repo:

| Variant | When to use |
|---|---|
| **taste-skill** | Default high-agency frontend — premium dark, cinematic motion |
| **minimalist-skill** | Editorial / airy / typography-first / lots of whitespace |
| **brutalist-skill** | Raw, aggressive, unstyled-looking intentional |
| **soft-skill** | Light mode, pastel, friendly consumer products |
| **stitch-skill** | Pair with a Google Stitch DESIGN.md handoff |
| **redesign-skill** | Refactoring an existing ugly UI toward taste |
| **output-skill** | Final polish pass on produced code |
| **gpt-tasteskill** | Variant optimized for GPT-family agents (reference) |

## Non-Negotiable Rules (from the skill)

- Verify every library exists in `package.json` before importing — output the install command if missing. Never hallucinate `framer-motion`, `lucide-react`, `zustand`.
- React / Next.js default. Server Components unless state needs Client.
- Global state + providers → must be inside a `"use client"` wrapper in Next.
- Hardware-accelerated CSS (transform / opacity) — never animate `top`/`left`/`width`.
- No boilerplate 2x2 bento. No purple→pink gradients. No Inter-for-everything.

## When NOT to Use

- Dashboards that need data density — use `ui-ux-pro-max` instead.
- Interfaces where accessibility is the primary concern — `harden` / `audit` skills first.

Read the specific variant's SKILL.md inside `skills/<variant>/` before generating code.
