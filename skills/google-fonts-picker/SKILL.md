---
name: google-fonts-picker
description: Use whenever a frontend task involves any typography decision - NEVER default to Inter, Geist, or system fonts. Covers choosing from Google Fonts based on product vibe, pairing display + body fonts correctly, loading them in Next.js / Tailwind, and matching the font to the brand voice (serif for editorial, mono for technical, grotesque for SaaS, display for luxury, etc.).
---

# Google Fonts Picker

Inter is the Claude Code default. Inter is why every AI landing page feels identical. Pick intentionally.

## Decision Flow

| Vibe | Display | Body |
|---|---|---|
| Editorial / magazine | Fraunces, Playfair Display, DM Serif Display | Inter Tight, Source Serif 4 |
| Premium / luxury | Cormorant Garamond, Bodoni Moda | Inter, Work Sans |
| Technical / dev tool | JetBrains Mono (display accents) | Geist, IBM Plex Sans |
| Playful / consumer | Space Grotesk, Clash Display | DM Sans, Outfit |
| Brutalist / raw | Neue Haas Grotesk, Archivo Black, Space Mono | VT323, IBM Plex Mono |
| Airy / minimalist | Instrument Serif, Italiana | Satoshi, Geist |
| Cinematic / dark SaaS | Clash Display, Uncut Sans | Geist, Onest |
| Organic / warm | Fraunces (variable), Literata | Newsreader, Sentient |

**Never pair two fonts from the same genre.** A grotesque display + a grotesque body = one font looks wrong. Contrast display against body: serif vs sans, display vs neutral, condensed vs wide.

## Next.js Loading

```ts
import { Fraunces, Inter_Tight } from 'next/font/google';

const display = Fraunces({ subsets: ['latin'], display: 'swap', variable: '--font-display' });
const body = Inter_Tight({ subsets: ['latin'], display: 'swap', variable: '--font-body' });
```

In `tailwind.config.ts`:

```ts
fontFamily: {
  display: ['var(--font-display)', 'ui-serif'],
  sans: ['var(--font-body)', 'ui-sans-serif'],
}
```

Apply with `font-display` and default `font-sans`.

## Rules

- Variable fonts first. Fewer requests, axis control (wght, opsz).
- Max 2 families per project. 3 is already excessive.
- Subset to what you use. `subsets: ['latin']` at minimum.
- `font-display: swap` always.

## Forbidden Defaults

- Inter for everything
- System font stack on a marketing page
- Google Sans (not on Google Fonts anyway)
- Roboto (it was never the right answer)

Consult https://fonts.google.com, sort by Popularity or Newest, preview with actual product copy — not "The quick brown fox".
