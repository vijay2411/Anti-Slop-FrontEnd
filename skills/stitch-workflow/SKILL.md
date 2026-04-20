---
name: stitch-workflow
description: Use when the user wants to visually prototype a UI with multiple layout variants before Claude writes any code - typical phrases "show me options", "give me three variants", "mock this up visually", "I want to pick between designs". Describes how to hand off to Google Stitch (stitch.withgoogle.com), iterate on variants there, and bring the chosen DESIGN.md + code back into Claude Code for implementation.
---

# Stitch Workflow

Google Stitch is a visual design tool that generates multi-variant mockups + a DESIGN.md spec from a prompt. Use it when you want the human to pick visually before Claude generates code.

## When to Use

- User says "I don't know what it should look like yet"
- User wants A/B/C variants side-by-side
- Early-stage landing page / dashboard where taste is unclear
- User has inspiration screenshots but no spec

## When NOT to Use

- Small component change (faster to just edit)
- Clone of an existing site (use `skillui` or `awesome-design-md` instead)
- User has already locked the design

## Handoff Protocol

1. Tell the user to open https://stitch.withgoogle.com.
2. Have them paste their prompt + any reference screenshots.
3. Stitch produces: DESIGN.md + 3-5 visual variants + component breakdown.
4. User picks a variant, clicks **more → view code** (or exports DESIGN.md).
5. User pastes the code / DESIGN.md into their project.
6. Claude picks up from there — applies `taste-skill`, `motion-dev-animations`, `animate-ui-elements` on top.

## Alternative: Stitch MCP

A Stitch MCP exists but surrenders the visual-picking advantage — the whole point of Stitch is seeing variants in a browser side-by-side. Default to browser handoff unless the user specifically asks for MCP.

## Pairing

- `awesome-design-md` — Stitch natively reads the DESIGN.md format; you can seed Stitch with an existing one from this collection.
- `taste-skill` — run after Stitch's code lands in the project so it doesn't look like a raw Stitch export.
