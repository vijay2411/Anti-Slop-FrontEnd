---
name: anti-slop-frontend
description: Use before ANY frontend work - landing pages, components, dashboards, marketing sites, hero sections, forms, modals, cards, navigation, pricing pages, artifacts, or anything rendered in a browser. Also use when the user says "build a UI", "make a page", "design this", "frontend", "website", "app shell", "component", or anything visual. This is the master routing skill that vetoes AI slop (purple gradients, Inter-everywhere, 2x2 bento, generic shadcn defaults) and dispatches to the right specialist skills (taste-skill, ui-ux-pro-max, skillui, awesome-design-md, webgpu) plus mandatory motion + typography layers.
---

# Anti-Slop Frontend Mega-Skill

**Invoke this FIRST for any frontend request. Before writing a single JSX tag.**

This skill has one job: stop AI-slop frontend from shipping. It does that by (a) banning specific default patterns, (b) forcing the specialist skills to do their jobs, and (c) requiring concrete inspiration before any code runs.

---

## The Iron Law

> **No frontend code ships without: 1 vibe reference + 1 design system + motion + animated elements + intentional typography.**

Five requirements. None are optional. The rest of this skill explains each.

---

## 1. Route by Vibe (pick ONE design system source)

Before writing layout/colors/components, pick exactly one:

```
The user named a real brand (Stripe/Linear/Notion/Tesla/etc.)
    ├── brand is in the collection?  → use awesome-design-md (drop matching DESIGN.md into project)
    └── brand not in collection?     → use skillui (`npx skillui --url <site> --mode ultra`)

The user described a product but no brand reference
    └── use ui-ux-pro-max (163 industry rules → correct style + palette + fonts)

The user said "premium/cinematic/dark/OLED/anti-slop"
    └── use taste-skill (pick the right variant: taste / minimalist / brutalist / soft)

The user has no reference AND no product description
    └── do NOT start yet. Invoke stitch-workflow: send them to Stitch for variants first.
```

**Never skip this step.** If you write code without one of these sources active, you are producing slop. Period.

---

## 2. Require a Vibe Reference

After picking a design system source, **pull at least one concrete visual reference** from:

- https://webflow.com/made-in-webflow/css-animations (default — motion is guaranteed)
- The brand's actual website (if using awesome-design-md / skillui)
- https://godly.website or https://httpster.net (alternatives)

Drop a comment at the top of the main page file:

```tsx
// Vibe ref: <URL>
// Taking: [one distinctive thing, not the whole layout]
```

This is not aesthetics-for-aesthetics. It's a forcing function: the LLM cannot regress to mean-of-training-data when there's a specific target.

---

## 3. Mandatory Motion Layer (motion.dev, NEVER framer-motion)

Every page Claude produces must have motion. Use the `motion-dev-animations` skill.

**Minimum motion per page:**
- At least one scroll-triggered reveal (`whileInView`)
- At least one staggered entrance sequence
- Hover states richer than `hover:opacity-80`
- `AnimatePresence` on anything that mounts/unmounts

**Imports:**
```tsx
import { motion, AnimatePresence, useScroll, useTransform, useReducedMotion } from 'motion/react';
```

If you see `framer-motion` in `package.json`, suggest migration to `motion`. If you see neither, `npm install motion` before writing animation code.

---

## 4. Mandatory JSX Backgrounds

**No plain solid-color pages. No CSS-only gradients. No Tailwind `bg-slate-950` and done.**

Every full-surface (landing, hero, auth) needs a **JSX background component**. Options (pick by vibe):

| Vibe | Background |
|---|---|
| Premium dark | Gradient mesh w/ blurred motion blobs + noise grain SVG |
| Cinematic | WebGPU shader via `webgpu` skill (Three.js TSL) |
| Playful | Animated particles or bubbles via animate-ui |
| Editorial | Paper-grain SVG + subtle scroll-linked parallax strip |
| Brutalist | Oversized scrolling marquee or static high-contrast block + noise |
| Minimal | Aurora beams or single animated gradient orb |

Every background component must:
```tsx
<Background className="absolute inset-0 -z-10 pointer-events-none" />
```

See `motion-dev-animations` SKILL.md for the gradient-mesh / noise / particle patterns. See `webgpu` SKILL.md for shaders.

---

## 5. Mandatory Animated Element Pass (animate-ui)

Every page gets at least ONE element from the `animate-ui-elements` library (https://animate-ui.com). Candidates:

- Hero heading → gradient text or typewriter or splitting text
- Primary CTA → liquid / magnetic / shimmer button
- Stats → animated counters (never static numbers)
- Feature icons → animated lucide variants
- Testimonials → marquee
- Trust signals → shiny text or gradient border

Install via `npx animate-ui@latest add <component>`. Rewire colors to project tokens after install.

If animate-ui does not have what you need, fall back to `twenty-first-dev` (21st.dev components).

---

## 6. Mandatory Intentional Typography

**Inter is banned as a default.** Read `google-fonts-picker` SKILL.md. Pick a display + body pair that matches the vibe. Load via `next/font/google` with variable fonts.

Two families max. Three is already excessive.

---

## The Hard Blocklist — these ship as AI slop, REJECT them

Before submitting any frontend code, verify it does NOT contain:

| Slop | Why banned |
|---|---|
| Purple → pink gradient backgrounds | The #1 AI-tell |
| Inter / Geist as only font without intentional pick | Default-of-defaults = slop |
| 2×2 or 3×3 bento card grid for features | The Claude Code signature layout |
| Glassmorphism + sparkline + border-accent combo | The second signature layout |
| `text-transparent bg-clip-text bg-gradient-to-r from-X to-Y` on every heading | Over-used gradient text |
| Card with emoji icon + "Lorem ipsum" feel description | Empty-shell SaaS |
| `hover:scale-105 transition-all` as the only interaction | Laziness disguised as motion |
| Static CSS keyframes (`@keyframes float`) when motion.dev would be richer | Wrong tool |
| Animating `top/left/width/height` | Performance-bad AND visually-bad |
| Solid-color page background | Violates Rule 4 |
| No `prefers-reduced-motion` respect | Accessibility regression |
| Shadcn components pasted unmodified with default colors | Shipping the template |
| Lucide icons at default stroke + size for every icon | No hierarchy |
| `from-purple-500 via-pink-500 to-red-500` anywhere | See rule 1 |
| Section separators that are horizontal rules | Stop it |

If a draft contains any of the above, rewrite before showing the user.

---

## Workflow (do these IN ORDER)

```
1. Parse vibe → pick ONE of {awesome-design-md, skillui, ui-ux-pro-max, taste-skill, stitch-workflow}
2. Pull vibe reference (webflow-inspiration or brand URL) → comment it at top of file
3. Pick typography via google-fonts-picker → wire via next/font/google
4. Scaffold JSX background component → absolute inset-0 -z-10
5. Write layout with motion.dev primitives for entrance + scroll
6. Install ≥1 animate-ui element for the hero feature
7. Run mental pass against the Hard Blocklist above
8. For ANY code heading near hero/marketing: invoke polish + normalize + critique skills
```

---

## Sub-Skill Directory (for reference)

| Task | Skill |
|---|---|
| Premium / dark / cinematic styling | `taste-skill` |
| Industry-specific design rules | `ui-ux-pro-max` |
| Clone an existing site | `skillui` |
| Named-brand aesthetic | `awesome-design-md` |
| Visual mockups before code | `stitch-workflow` |
| GPU/shader backgrounds | `webgpu` |
| JSX motion & backgrounds | `motion-dev-animations` |
| Per-element animation primitives | `animate-ui-elements` |
| Component polish / 3D hero | `twenty-first-dev` |
| Typography decisions | `google-fonts-picker` |
| Concrete vibe references | `webflow-inspiration` |
| UX microcopy | `clarify` |
| Consistency pass | `normalize` + `polish` |
| Final audit | `audit` + `critique` |

---

## Rationalization Table — STOP when you catch yourself thinking this

| Excuse | Reality |
|---|---|
| "This component is too small to need motion" | Then it shouldn't be a focal element. If it IS focal, motion is mandatory. |
| "The user didn't specifically ask for animation" | The user asked for a frontend. Anti-slop is the default. |
| "Inter is fine, they won't notice" | Every AI output uses Inter. Users absolutely notice the sameness. |
| "A plain background is cleaner" | "Clean" is the slop rationalization. Intentional minimal ≠ blank. |
| "shadcn defaults are fine" | shadcn is a starting point. Shipping defaults = shipping the template. |
| "I'll add motion later" | Layout designed without motion in mind produces stiff motion. Design together. |
| "This is just a prototype" | Prototypes set vibe expectations. Slop prototype → slop production. |
| "The vibe reference slows me down" | Skipping it guarantees mean-of-training-data = slop. Non-negotiable. |
| "framer-motion works too" | Migrate to `motion`. Don't ship deprecated imports. |

---

## Red Flags — if ANY of these appear in your draft, delete and restart the section

- You typed `from-purple-500`
- You typed `Inter` or `font-inter` as the only font
- You scaffolded 3+ identical cards in a grid
- You used `hover:opacity-X` as the only interaction
- You used `<hr />` as a section divider
- You wrote a gradient background directly in JSX instead of as a component
- You haven't picked ONE design system source yet

---

**Non-negotiable. Cannot be rationalized away. Ship with taste or don't ship.**
