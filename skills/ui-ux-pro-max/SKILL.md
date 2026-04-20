---
name: ui-ux-pro-max
description: Use when designing or refactoring a real product UI and you need industry-specific design intelligence - SaaS dashboards, landing pages, admin panels, e-commerce, portfolios, mobile apps, or any page where style/color/typography/component choices must match the product category rather than generic AI defaults. Covers 161 product types, 50+ styles, 161 color palettes, 57 font pairings, 99 UX guidelines, 25 chart types across React, Next.js, Vue, Svelte, SwiftUI, React Native, Flutter, Tailwind, shadcn/ui, HTML/CSS.
---

# UI/UX Pro Max

Design-intelligence database. Given a product description, it returns: pattern + style + colors + typography + effects + anti-patterns specific to that industry.

## Primary Skill

`.claude/skills/ui-ux-pro-max/SKILL.md` — the main reasoning engine. Read this first when starting any real design work.

## Sub-Skills

Located under `.claude/skills/` inside this repo:

- **design** — full-page design decisions
- **design-system** — tokens, scales, component rules
- **ui-styling** — visual language (glassmorphism, brutalism, bento, etc.)
- **brand** — brand identity + voice translation into UI
- **banner-design** — marketing banners and hero imagery
- **slides** — presentation / keynote layouts

## When to Use

- Any time the user gives a product description ("SaaS for teachers", "fintech onboarding") — pull the matching reasoning rules before writing code.
- When you're about to default to "generic SaaS with shadcn" — stop and consult the palette/style DB.
- For stack-specific guidance (the DB knows different rules for Flutter vs React).

## When NOT to Use

- Pure copywriting changes (use `clarify` skill).
- One-element tweaks that do not touch design language.

Always combine with `taste-skill` for anti-slop enforcement and with `anti-slop-frontend` mega-skill for motion + background + element choices.
