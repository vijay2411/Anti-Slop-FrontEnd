---
name: twenty-first-dev
description: Use when adding small premium component flourishes - glowing buttons, cursor-tracking cards, animated borders, spline/3D hero sections, fancy inputs, micro-interactions, or any "make this one component feel expensive" moment. 21st.dev (21st.dev) is a huge community component library where each component has a copy-prompt button that drops straight into Claude Code. Best used for the last 10% polish, not whole pages.
---

# 21st.dev Component Library

21st.dev is a free repository of React / Tailwind components curated for design quality. Each component has a **copy prompt** button that produces a natural-language prompt Claude executes to reconstruct the component in the user's codebase.

## When to Use

- User wants a single premium element (button, card, form field, cursor-follow hero)
- You need inspiration for what "good" looks like in a category
- Late-stage polish — a component feels flat and you want a richer variant

## When NOT to Use

- Whole-page layouts — 21st.dev components have different aesthetics per contributor; mixing them causes visual inconsistency
- Bundle-sensitive pages — many components bundle GSAP, Spline, Three.js
- User wants something original — copying community components is derivative

## Workflow

1. Go to https://21st.dev and filter by category (Heroes, Buttons, Cards, Inputs, Borders, Backgrounds…).
2. Click the component, click **Copy Prompt**.
3. Paste into Claude Code with: "Integrate this, match our existing `tailwind.config.ts` colors and the project design tokens."
4. **Always adapt colors/typography to project tokens** — raw 21st.dev components bring their author's palette.

## Red Flags

- Hero section with a floating robot + cards with rainbow gradients + a pill button with a different style = stitched-together-asset look. Pick one "hero" element per page.
- Never paste >3 components from 21st.dev into a single page without a normalization pass (`normalize` skill).

## Pairing

- After integration, run `polish` + `normalize` to match project design system.
- Combine with `animate-ui-elements` for animation behavior and `motion-dev-animations` for page-level motion.
