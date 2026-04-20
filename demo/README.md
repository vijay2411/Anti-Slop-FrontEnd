# ReelKit demos

Two real outputs from the `anti-slop-frontend` skill, built from the same prompt, on different versions of the skill pack. Drop either file into a browser to inspect — no server needed.

## The prompt

Both versions were generated from this exact brief:

> **Overview**
> ReelKit is an AI-powered creative asset library for short-form content creators. It lets any creator forward an Instagram Reel (or import via link) and instantly dissects it into its raw building blocks — video, background music, sound effects, and the creator's own speech — all stored in a searchable personal vault. Every asset can be tagged, organised into mood boards, previewed in isolation, and exported directly to tools like CapCut, Adobe Premiere, or DaVinci Resolve. ReelKit turns passive inspiration into an active, reusable creative arsenal.
>
> **Core Problem**
> Creators constantly save Reels as inspiration but the assets are locked inside the video. When they go to recreate a vibe — a specific BGM energy, a panning transition, a sound effect, a hook delivery style — they have no way to extract it. They end up rewatching the same reel 15 times trying to reverse-engineer it, or hunting for the BGM track on a separate music app. ReelKit collapses that friction entirely.

Plus: *"make me an introductory webpage using the anti-slop skill. Save it in any html and let me see how it looks."*

## The versions

### `reelkit-v1.html`
Built on the first release of `anti-slop-frontend` (5 rules: vibe ref + design system + motion + animated elements + typography). Editorial cinematic dark mode, warm amber-coral accent, motion.dev-driven stagger + scroll reveals, asymmetric editorial grid.

Produced on the original 12-skill pack. No trend research, no multi-device enforcement, no render verification. Still passes the hard blocklist and looks nothing like generic AI SaaS.

### `reelkit-v2.html`
Built on the updated pack with **trend research + adventurous colour + multi-device proof + render verification** layered in (the 13-skill version with `verify-frontend-render`).

Same product, same prompt, harder rules. Compare the two side-by-side to see what each additional rule forces.

## How to view

```bash
open demo/reelkit-v1.html
open demo/reelkit-v2.html
```

Or drag either file into Chrome / Safari / Firefox.

## Caveat

Both demos use vanilla HTML + ES-module imports from CDNs (motion.dev from jsdelivr) so they run without a build step. In a real React / Next.js project the same skill produces JSX components with `motion/react` imports — richer, but not single-file-demoable.
