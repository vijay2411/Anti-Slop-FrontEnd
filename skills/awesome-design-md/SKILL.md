---
name: awesome-design-md
description: Use when the user names a recognizable brand or product (Stripe, Linear, Vercel, Supabase, Claude, ElevenLabs, Tesla, Ferrari, Notion, Raycast, etc.) and wants UI in that aesthetic - OR asks for a design reference library to pick from. Ships 68+ ready-to-use DESIGN.md files (the Google-Stitch format) extracted from real websites across AI tools, dev tools, fintech, productivity, automotive, and fashion. Drop one into project root, prompt Claude with "build me a page in this style", get pixel-accurate UI.
---

# Awesome DESIGN.md Collection

68+ DESIGN.md files captured from real websites, ready to drop into `./DESIGN.md` at the project root. The Google Stitch DESIGN.md format is a plain-markdown design spec that LLMs parse natively.

## Structure

Located under `design-md/` inside this repo. Categories include:

- **AI & LLM platforms** — Claude, Cohere, ElevenLabs, Mistral, Minimax, Perplexity
- **Developer tools** — Vercel, Stripe, Supabase, Linear, Railway, Raycast
- **Fintech** — Revolut, Coinbase, Wise
- **Productivity** — Notion, Figma, Height
- **Automotive & luxury** — Tesla, BMW, Ferrari, Bugatti, Porsche
- **Fashion / e-commerce** — select retailers

Full list: see `README.md` of this repo or https://getdesign.md/.

## How to Apply

1. Identify the target aesthetic: "make it feel like Linear" / "Stripe vibe" / "Ferrari landing page".
2. Copy the matching file from `design-md/<brand>/DESIGN.md` to the user's project root as `DESIGN.md`.
3. Reference it in the prompt. Any capable agent reads it automatically.
4. Prefer this over skillui when a canonical DESIGN.md already exists (lighter, no crawl needed).

## When to Use

- User names a brand as a reference.
- You want a grounded baseline before applying `taste-skill` for motion + `anti-slop-frontend` for enforcement.

## When NOT to Use

- The user wants something original — do not start from a real brand's spec.
- The requested brand is not in the collection — fall back to `skillui` to generate one.

## Pairing

- `ui-ux-pro-max` for industry rules on top of the chosen brand spec.
- `taste-skill` for motion intensity and hardware-acceleration rules.
- `motion-dev-animations` + `animate-ui-elements` for the actual animation layer.
