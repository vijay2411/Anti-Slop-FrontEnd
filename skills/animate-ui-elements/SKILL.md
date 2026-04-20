---
name: animate-ui-elements
description: Use when individual React components need pre-built, production-ready animation primitives - animated counters, gradient text, marquees, confetti, typewriters, cursors, animated accordions, bouncing cards, flip numbers, liquid buttons. animate-ui.com is a component library where each item IS the animation (as opposed to motion.dev which is the animation engine). Drop-in shadcn-style components with zero animation wiring needed.
---

# animate-ui.com - Per-Element Animation Components

https://animate-ui.com ships pre-animated React components. Think shadcn/ui but every component has motion baked in. Uses `motion/react` + Tailwind under the hood.

## What's in the Library

Browse https://animate-ui.com/components for the full list. Highlights:

- **Text** — gradient, typewriter, counter, rotating, splitting, highlight, shiny
- **Buttons** — ripple, liquid, magnetic, shimmer
- **Backgrounds** — aurora, gradient orbs, bubbles, stars, beams
- **Effects** — confetti, cursor variants, spotlight, particles
- **Containers** — cards with tilt, flip, 3D perspective, magic-bento
- **Icons** — animated lucide variants
- **Primitives** — accordion, tooltip, modal, tabs — all with motion

## Install Pattern

animate-ui uses the shadcn copy-paste model:

```bash
npx animate-ui@latest add counter
```

Components land under `components/animate-ui/`. Edit freely.

## When to Use

- Any element that feels "flat" and needs motion personality.
- Replacing a static counter, static badge, static button, or static heading with its animated cousin.
- Hero accent pieces where you want one wow-element without writing custom motion.

## When NOT to Use

- Utility UI (settings table, form field labels) — keep these calm.
- You already have a component working well — don't swap unless it actually lacks.

## Rules

- **Don't stack 5+ animated elements in the same viewport** — the eye has nowhere to rest. One wow, two supporting, rest quiet.
- **Match project colors** — after `npx animate-ui add X`, open the file and rewire classes to project tokens (or CSS vars).
- **Disable on reduced motion** — wrap in a check (animate-ui components usually respect `prefers-reduced-motion` but verify).
- **Bundle audit** — some components pull in extra deps (confetti needs `canvas-confetti`). Check before installing.

## Pairing

- `motion-dev-animations` — wrap animate-ui components in scroll-reveal / stagger.
- `twenty-first-dev` — when animate-ui doesn't have a matching element, fall back here.
- `polish` / `normalize` skills to reconcile imported tokens with the project's design system.
