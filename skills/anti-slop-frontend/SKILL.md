---
name: anti-slop-frontend
description: Use before ANY frontend work - landing pages, components, dashboards, marketing sites, hero sections, forms, modals, cards, navigation, pricing pages, artifacts, or anything rendered in a browser. Also use when the user says "build a UI", "make a page", "design this", "frontend", "website", "app shell", "component", or anything visual. This is the master routing skill that enforces functional + secure code first, respects existing project UI (brownfield mode), vetoes AI slop (purple gradients, Inter-everywhere, 2x2 bento, generic shadcn defaults, safe grey-plus-one-accent palettes, desktop-only layouts, unverified "probably works" claims, security leaks, unauthorized design-system overhauls), and dispatches to the right specialist skills (taste-skill, ui-ux-pro-max, skillui, awesome-design-md, webgpu, verify-frontend-render) plus mandatory trend research, adventurous colour, multi-device responsive, and browser-rendered verification layers.
---

# Anti-Slop Frontend Mega-Skill

**Invoke this FIRST for any frontend request. Before writing a single JSX tag.**

This skill has one job: stop AI-slop frontend from shipping — AND keep the app functional, secure, and respectful of existing project UI. It does that by (a) enforcing non-negotiable safety rules, (b) banning specific default patterns, (c) forcing the specialist skills to do their jobs, and (d) requiring concrete inspiration + verification before claiming done.

---

## THE ABSOLUTE IRON LAW (overrides everything below)

> **1. Functional first. 2. Secure second. 3. Respect existing UI third. 4. Anti-slop aesthetics fourth.**
>
> If rules 1–3 conflict with rules 4+ (the aesthetic rules): **rules 1–3 win. Always. Without discussion.**

A beautiful page that leaks API keys is a catastrophic ship. A beautiful page where the signup form silently fails is a failure. A "modernized" UI that replaced the client's brand system without permission is a breach of trust. These outcomes are worse than generic-looking UI.

**Aesthetics are the icing. Functionality, security, and project respect are the cake. Never serve icing without cake.**

---

## The Aesthetic Iron Law (subordinate to the Absolute Iron Law above)

> **No NEW frontend code ships without: trend research + 1 vibe reference + 1 design system + motion + animated elements + intentional typography + adventurous colour + multi-device proof + rendered verification.**

Nine requirements. None are optional — **for greenfield work**. For brownfield work, see Rule -1 below: these become *additive* rather than prescriptive.

---

## -1. Brownfield vs Greenfield — AUDIT BEFORE DESIGNING

**The single most damaging thing this skill could do is overhaul a live project's UI.** Before Rule 0 and all aesthetic rules, determine the mode.

### Audit checklist (run this FIRST, every time)

Scan the project for signs of existing UI language:

| Signal | What it tells you |
|---|---|
| `tailwind.config.*` with custom `theme.colors` / `fontFamily` | Existing token system — match it |
| `globals.css` / `app.css` with `:root` CSS vars | Existing design tokens — use them |
| `components/ui/` or `components/` with ≥3 components | Existing component library — extend, don't replace |
| `package.json` has `motion` / `framer-motion` / `gsap` / `@react-spring` | Existing motion stack — use the one already there |
| `next/font` already configured in `layout.tsx` or `_app.tsx` | Typography is already picked — don't swap |
| Shadcn `components.json` present | Shadcn system — match its variant patterns |
| Multiple existing pages with consistent look | Brand is set — infer + follow |
| A `DESIGN.md` / `brand.md` in the repo | Explicit design spec — **read it first, follow it** |
| `.figma` file refs / Storybook config | Design handoff — match what's there |

**≥1 signal above ⇒ BROWNFIELD mode.**
**Zero signals ⇒ GREENFIELD mode.**

### BROWNFIELD mode rules (non-negotiable)

1. **Read before writing.** Read the existing tokens (`tailwind.config`, `:root`, design files). Read at least one representative existing page/component. Summarize the existing design language in your response: colour palette, typography, spacing rhythm, motion library, component variants.
2. **Match, don't replace.** Use the tokens and components that already exist. If `--accent: #3366ff` is defined, use `var(--accent)` — do not introduce your own orange. If the project uses `framer-motion`, use `framer-motion` — do not migrate it to `motion/react` unless the user explicitly asks.
3. **Only additive changes.** New sections should adopt the existing voice. A new component should look like a sibling of existing components, not an import from a different product.
4. **Never swap without explicit permission.** Do NOT change the font family. Do NOT repaint the palette. Do NOT swap the motion library. Do NOT reorganize the component directory. If you believe a swap would be beneficial, *ask the user first* — do not unilaterally modernize.
5. **Trend research becomes advisory, not directive.** You may still research current trends, but they inform *subtle* enhancements (a new scroll reveal, a polish on an existing button) — not a redesign.
6. **Enhancement is welcome when prompted.** If the user says "make it more animated", "go bigger", "revamp the hero", "modernize it", then aesthetic Rules 0–9 engage fully and creativity is on.
7. **Default behaviour: conservative.** Ambiguity resolves *toward* matching the existing UI, not overhauling it.

### GREENFIELD mode rules

All aesthetic Rules 0–9 engage fully. Research trends. Pick adventurous palettes. Surprise the user. Make it distinctive.

### How to respond when you've detected brownfield

Before any code, reply with something like:

> "I see this project already has an established UI: [summary of tokens/fonts/motion lib/component patterns observed]. I'll match that style and only add [what the user asked for]. I won't swap the palette, fonts, or motion library unless you ask me to — say 'go ahead and modernize' or 'surprise me' and I'll switch to creative mode."

Then proceed with matching code.

---

## 0. Pre-Flight — Research Current Trends (BEFORE picking anything)

The LLM default is 2022-era web design. Fight that with explicit present-tense research. Do **one** of the following before step 1:

- **WebSearch** for trends in the current month/year: `"web design trends <current month, current year>"`, `"award-winning landing pages <year>"`, or the specific industry (`"fintech landing page trends <year>"`).
- **Visit** at least one of: [awwwards.com](https://www.awwwards.com/websites/), [godly.website](https://godly.website), [siteinspire.com](https://www.siteinspire.com), [lapa.ninja](https://www.lapa.ninja), [land-book.com](https://land-book.com), [httpster.net](https://httpster.net). Pull 2-3 recent winners (last 6 months).
- **Ask the user** for a site they love, recent.

Write a 2-4 line "trend notes" comment at the top of the main page file:

```tsx
// Trends noted (April 2026): asymmetric editorial grids, warm-toned OLED darks,
// variable-weight serif italics mid-sentence, scroll-pinned reveal sequences,
// colour pairs with one unexpected hue (lime+plum, peach+navy, acid+teal).
// Vibe ref: <URL>
```

"Trends I half-remember from training data" does **not** count. The research must be timestamped and specific.

### Dependency receipt — MANDATORY before the first line of code

Before any import, state out loud:

```
DEPENDENCIES
├── Runtime libs:    [name] — [source: package.json ✓ / npm install X / CDN URL]
├── Design tokens:   [--var-name] — [defined in :root block / next/font setup]
├── External assets: [font / icon / CDN URL]
└── Banned checked:  framer-motion ✗ (not used), Inter-default ✗ (not used)
```

Every item needs a verified source. If you can't source it, stop and install it (or swap). This alone prevents ~40% of "it's broken" reports.

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

## 7. Mandatory Adventurous Colour (surprise the user)

**The "safe" palette IS the slop.** Slate + one accent = slop. A single blue brand token + grey UI = slop. The current design zeitgeist is variadic and unexpected.

### Rules

- **Minimum 3 hues beyond neutrals.** One primary accent + one secondary accent (in a different hue family) + one supporting accent or highlight. Not all from the same Tailwind shade family.
- **Pair one expected hue with one unexpected hue.** The unexpected hue is the fingerprint.
  - Expected + unexpected: navy + peach, charcoal + acid-lime, warm-black + plum, cream + cobalt, forest + terracotta, bone + electric-blue.
- **Variable palette, not gradient.** Use 3-5 distinct hues across the page (in cards, sections, illustrations, chart colours) — not one gradient running through everything.
- **Pull colours from trend research (Rule 0).** If awwwards winners this month lean toward `#d4ff3a` + `#3a1f5c`, that's a signal — try it.
- **Reject "brand colour + grey" as a starting point.** That's 2019. Modern brand systems ship with a *palette*, not a pair.

### Forbidden "safe" moves

- Slate-900 bg + blue-500 accent + nothing else → 2021 SaaS slop
- Single gradient (from-X to-Y) stamped on every heading → template aesthetic
- All 5 accent colours from the same hue family (all blues, all oranges) → monochrome boredom
- Any use of `purple-500 → pink-500` or `blue-500 → purple-500` → THE AI tell

### The "surprise me" mode

If the user hasn't specified colours, **actively pick something surprising** — not predictable. Run this test on your proposed palette:

> If I listed my 5 colour hex values to a designer who hadn't seen the product, would they guess "AI-generated landing page"?

If yes, throw it out. Try again.

### Colour moves that are currently modern (April 2026 — re-research each session)

- Warm-black + single acid pop (lime-yellow, hot coral, electric blue)
- "Multihue dark mode" — the base isn't grey, it's slightly-tinted (warm black, cold black, purple-black, forest-black)
- Sunset palettes: peach → magenta → deep purple (intentional, not from-pink-500)
- High-contrast editorial: cream + charcoal + single accent (no mid-tones)
- Risograph-inspired: 2-3 saturated spot colours + paper grain texture
- "Tech magazine" look: near-black + neon + muted pastel accents

Confirm your picks via Rule 0 research before committing.

---

## 8. Mandatory Multi-Device Responsive

**Desktop-only UI is half-shipped.** Every frontend output must be explicitly responsive.

### Minimum breakpoints (3)

| Breakpoint | Width | Treatment |
|---|---|---|
| Mobile | < 640px | Single column, hamburger / drawer nav, hero shrunk, touch targets ≥ 44px |
| Tablet | 640–1024px | 2-column where useful, nav may still collapse, spacing tighter than desktop |
| Desktop | > 1024px | Full layout as designed |

### Hard rules

- **No fixed widths > 100vw.** Ever.
- **No horizontal scroll** on any breakpoint (hiding overflow on body is a bandaid — find the offending element).
- **Body text ≥ 16px on mobile** (prevents iOS auto-zoom on input focus). Display text can scale with `clamp()`.
- **Interactive elements ≥ 44×44px on mobile.** Buttons, links in nav, form inputs, tap targets.
- **Nav pattern for mobile is explicit.** Hamburger, drawer, bottom-bar, or progressive disclosure — not "the same links just squished".
- **Hero visual gets a mobile-specific version** when the desktop one is wide/landscape-only. Reflow or swap.
- **Every absolute-positioned decoration (floating pills, badges, orbs) is tested narrow** — the #1 cause of mobile overflow.
- **Motion is preserved on mobile** but `prefers-reduced-motion` is honoured.
- **Test via Playwright MCP resize at 375 / 768 / 1440** (see `verify-frontend-render` skill).

### Red flags

- You wrote the page with `max-width: 1240px` and never touched a media query → slop
- You set `overflow-x: hidden` on `<body>` → you're hiding the bug, not fixing it
- Your nav has 5+ links visible at desktop but you didn't write a mobile menu → half-shipped
- Your hero has a floating image at `right: -50px` that hangs off the right edge at `width < 800px` → overflow bomb

---

## 9. Mandatory Render Verification

**The code that "should work" and the code that "does work" are not the same.** Before claiming any frontend task complete:

> **INVOKE `verify-frontend-render` SKILL.**

That skill runs a 3-phase hard check: dependency receipt (already part of Rule 0), post-write structural self-audit, and a Playwright MCP browser render pass that catches missing libraries, undefined CSS vars, overflow bugs, silent console errors, and elements that never mounted. **Do not say "here's the page" until `verify-frontend-render` has passed.**

If Playwright MCP is unavailable, admit it and ask the user to open the file and report console + screenshot. Do **not** claim unverified work is done.

---

## 10. Functional + Secure ALWAYS (the Absolute Iron Law, enumerated)

**This rule is above all aesthetic rules.** A page that looks beautiful but leaks secrets, breaks forms, crashes on submit, or opens XSS holes is a catastrophic failure. Treat this section with the highest regard.

### Functional correctness — non-negotiable

- **Forms submit.** Every `<form>` has a handler or `action`. Every button with an intent has an `onClick` / link.
- **No dead buttons.** If a CTA says "Start your vault", it must route somewhere real (or an explicit placeholder with a TODO commented for the user).
- **Loading states.** Any async operation shows a loading indicator. Never a frozen UI.
- **Error states.** Any async operation handles failure visibly — not just `console.error`.
- **Empty states.** Lists / search results / tables handle the zero-results case.
- **Keyboard nav.** `Tab` order works, `Enter`/`Space` activate buttons, `Esc` closes modals, focus trap inside modals.
- **Form validation.** Required fields validated client-side for UX *and* server-side for safety.
- **Navigation.** Every route in nav resolves to something (no 404-on-click).
- **State persistence.** If data is entered, survive route changes / page refresh where reasonable.

### Security — non-negotiable

- [ ] **No secrets in client code.** Grep the diff for obvious API-key patterns (`sk_`, `pk_live`, `api_key`, `AKIA`, `AIza`, `Bearer `, `password =`, `SECRET_`). If found: stop. Move to env var. Never commit.
- [ ] **No unsafe raw-HTML injection.** React's raw-HTML prop (the `dangerouslySet` one) must always be paired with a sanitizer like DOMPurify. Never pass raw user content to it.
- [ ] **No dynamic-code execution.** Avoid `eval`, dynamic function constructors, and `setTimeout` with a string argument. All are XSS vectors.
- [ ] **External links** have `rel="noopener noreferrer"` when `target="_blank"`.
- [ ] **Env var hygiene.** Server-only secrets are NEVER prefixed `NEXT_PUBLIC_` / `VITE_` / `REACT_APP_`. Any such prefix leaks the value to the browser bundle.
- [ ] **User-generated content** is escaped before rendering. React escapes by default — but not inside raw-HTML injection, inline event handlers, or `href={userContent}` (check for `javascript:` URIs).
- [ ] **Auth gates actually gate.** Don't rely on CSS `display: none` to hide admin UI from a non-admin — they can View Source. Check auth state + don't render.
- [ ] **No PII in URLs.** Emails, tokens, IDs in URL params get logged in analytics, referer headers, browser history.
- [ ] **No sensitive tokens in `localStorage`.** Prefer httpOnly cookies for session tokens. localStorage is XSS-accessible.
- [ ] **Third-party scripts** (CDNs, analytics) — version-pinned, from trusted sources, ideally with SRI hashes (`integrity="sha384-..."`).
- [ ] **File uploads** validate MIME type *and* file size *and* ownership, server-side. Never trust the client.
- [ ] **CSRF protection** on any mutation endpoint that uses cookies for auth (SameSite=Strict or explicit tokens).
- [ ] **Rate limiting** on public endpoints (auth, search, contact forms) — server-side.
- [ ] **Destructive actions** require confirmation (delete, pay, send). `confirm()` is the floor; a typed-name modal is better.
- [ ] **Error messages** don't leak internals ("SQL error at line 42" → NO; "Something went wrong, try again" → yes).
- [ ] **`.env*` files** are in `.gitignore`. Double-check before committing.
- [ ] **Console-log hygiene.** Remove debug `console.log` calls that print user data or tokens before shipping.

### Accessibility is functional (not aesthetic)

Accessibility isn't a "nice to have" — it's functionality for ~15% of users who need it and a courtesy (+ legal requirement in many jurisdictions) for everyone:

- [ ] Every interactive element has an accessible name (`aria-label`, `<label for>`, visible text)
- [ ] Every `<img>` has `alt` text (empty `alt=""` is fine for decorative)
- [ ] Colour contrast: body text ≥ 4.5:1, large text ≥ 3:1, UI components ≥ 3:1 against background
- [ ] Focus-visible states are visible (never `outline: none` without a replacement)
- [ ] Motion respects `prefers-reduced-motion`
- [ ] Form inputs have associated labels (not placeholder-as-label)
- [ ] Heading order is semantic (`h1` → `h2` → `h3`, no skipping)
- [ ] `<button>` for actions, `<a>` for navigation — not divs with `onClick`

### On conflict with aesthetic rules

If a security rule and an aesthetic rule collide:
- Security wins. Always.
- Example: "Animate counter from 0→200" vs "counter shows balance pulled from URL ?balance=200 param" — do NOT trust the URL value as authoritative balance. Show loading, fetch from server.
- Example: "Bento grid with a user testimonial" vs "testimonial content could contain HTML from user submissions" — escape on display, never inject raw HTML from user content.

### Red flags — STOP and fix immediately

- You're about to commit a `.env`, `secrets.json`, or any file with a real key
- You wrote React raw-HTML injection with unescaped user content
- You wrote `localStorage.setItem('token', jwt)` where jwt is a session token
- You prefixed a secret env var with `NEXT_PUBLIC_`
- You're showing an error message that includes a database query or stack trace
- You added a "Delete all" button without any confirmation
- You have a navigation item that links nowhere (or to `#`)

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
| "Brand colour + grey" as entire palette | Monochrome = 2019 (Rule 7 violation) |
| Single gradient stamped on every heading | Template aesthetic (Rule 7) |
| All accents from same hue family (all blues / all oranges) | Variadic palette required (Rule 7) |
| Desktop-only UI — no mobile breakpoint ever written | Half-shipped (Rule 8) |
| `overflow-x: hidden` on `<body>` | Hiding the bug instead of fixing (Rule 8) |
| Fixed-width element that clips at 375px | Mobile overflow bomb (Rule 8) |
| Nav collapses to nothing at mobile (no hamburger/drawer) | Unusable on phone (Rule 8) |
| Touch target smaller than 44×44 on mobile | Fails WCAG + feels broken (Rule 8) |
| Body text < 16px on mobile inputs | Triggers iOS zoom-on-focus (Rule 8) |
| Claimed "done" without invoking verify-frontend-render | No evidence = not done (Rule 9) |
| "Probably renders fine" reasoning without a screenshot | Unverified = unshipped (Rule 9) |
| Overhauled existing UI without user permission | Brownfield breach (Rule -1) |
| Swapped existing font / colour tokens / motion lib unprompted | Brownfield breach (Rule -1) |
| Ignored existing `components/ui/` library, rolled fresh components | Brownfield breach (Rule -1) |
| Applied aesthetic Rules 0-9 creatively to an established product | Brownfield breach (Rule -1) |
| Committed a `.env` / secrets / API key to git | Security failure (Rule 10) |
| Raw-HTML injection of user content without sanitizer | XSS hole (Rule 10) |
| `NEXT_PUBLIC_` / `VITE_` / `REACT_APP_` prefix on a secret | Secret leaked to browser (Rule 10) |
| Session tokens in `localStorage` | XSS-exfiltrable (Rule 10) |
| Error message leaks stack trace / SQL / internal path | Info disclosure (Rule 10) |
| Dead button / broken form / nav link to `#` shipped | Functional failure (Rule 10) |
| Missing alt text / aria labels on interactive elements | Accessibility failure (Rule 10) |
| `outline: none` on focus without replacement | Keyboard-users locked out (Rule 10) |

If a draft contains any of the above, rewrite before showing the user.

---

## Workflow (do these IN ORDER)

```
-1. Audit project: BROWNFIELD or GREENFIELD? Summarize existing design language if brownfield.
-1b. Apply Rule 10 — Functional + Secure is baseline, not optional. Keep it in mind at every step.

── If BROWNFIELD ──
   a. Match existing tokens / fonts / motion lib / components. Do not swap.
   b. Only additive changes unless user said "modernize" / "revamp" / "surprise me".
   c. Skip Rules 0, 1, 3 (typography), 7 (colour) prescriptively — use what's there.
   d. Still apply Rules 8 (responsive) + 9 (verify) + 10 (functional/secure).
   e. Report the match strategy to the user before coding.

── If GREENFIELD ──
   0.  Research current trends (WebSearch or awwwards/godly/land-book) → trend notes comment
   0b. Write dependency receipt → every lib / token / asset has a verified source
   1.  Parse vibe → pick ONE of {awesome-design-md, skillui, ui-ux-pro-max, taste-skill, stitch-workflow}
   2.  Pull vibe reference (webflow-inspiration or brand URL) → comment it at top of file
   3.  Pick typography via google-fonts-picker → wire via next/font/google
   4.  Pick an ADVENTUROUS colour palette (Rule 7) — 3+ hues, one unexpected
   5.  Scaffold JSX background component → absolute inset-0 -z-10
   6.  Write layout with motion.dev primitives for entrance + scroll
   7.  Install ≥1 animate-ui element for the hero feature
   8.  Write mobile + tablet + desktop styles as you go (Rule 8) — not as an afterthought

── Always (both modes) ──
   9.  Audit against Rule 10 — functional + secure + a11y checklist
   10. Run mental pass against the Hard Blocklist below
   11. INVOKE verify-frontend-render — 3 phases including security + (if brownfield) drift check. No exceptions.
   12. Only after verify-frontend-render passes: invoke polish + normalize + critique
```

---

## Sub-Skill Directory (for reference)

| Task | Skill |
|---|---|
| **Verify render before claiming done** | **`verify-frontend-render` (MANDATORY final step)** |
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
| "I don't need to research trends, I know what looks good" | Your training data is stale. Research the current month. |
| "A safe palette is professional" | Safe = generic. Generic = AI slop. Variadic. |
| "One accent colour is cleaner" | One accent = 2019 SaaS. Pair expected + unexpected. |
| "Mobile is a stretch goal" | Half your users are on mobile. Desktop-only = half-shipped. |
| "I'll add responsive later" | Retrofit responsive = broken responsive. Design mobile-first or mobile-aware from step 1. |
| "overflow-x: hidden on body fixes mobile scroll" | It hides the bug. The element is still overflowing. Find and fix it. |
| "The user can resize and check" | That's your job. Use Playwright MCP to resize at 375/768/1440. |
| "The code looks right, it'll probably render" | Probably is not shipped. Invoke verify-frontend-render. |
| "It's just static HTML, what can break" | Missing CSS vars, absolute elements escaping, fonts failing silently — all of these. Verify. |
| "The existing UI looks AI-slop, I should fix it" | **NO.** You were hired to build feature X, not redesign. Ask first. |
| "The user will love the modernization" | You don't know that. Their brand / users / stakeholders may have rejected it already. Ask first. |
| "I'll just swap `framer-motion` for `motion`, it's better" | The project chose framer-motion deliberately or by convention. Don't swap without permission. |
| "The old font is ugly, I'll use Instrument Serif" | **NO.** Match what's there. Don't touch typography without permission. |
| "Security is the backend team's job" | Client-side is part of the attack surface. XSS, secret leaks, open redirects all ship from frontend. |
| "Dangerous HTML injection is fine here, the content is trusted" | User content is never trusted. Sanitize anyway. |
| "This is a prototype, security can wait" | Prototypes leak. The `.env` you commit today haunts you forever. |
| "Alt text / aria-label slows me down" | ~15% of users depend on it. It's functionality. Not optional. |
| "`outline: none` looks cleaner" | Keyboard users are now lost. Add a visible focus-visible replacement. |

---

## Red Flags — if ANY of these appear in your draft, delete and restart the section

- You typed `from-purple-500`
- You typed `Inter` or `font-inter` as the only font
- You scaffolded 3+ identical cards in a grid
- You used `hover:opacity-X` as the only interaction
- You used `<hr />` as a section divider
- You wrote a gradient background directly in JSX instead of as a component
- You haven't picked ONE design system source yet
- You skipped Rule 0 trend research
- You didn't write a dependency receipt
- Your palette is `bg + single-blue-accent + grey` with no third hue
- You wrote zero media queries
- You used `overflow-x: hidden` on `<body>` instead of finding the overflowing element
- You said "it should work" or "here's the page" without invoking `verify-frontend-render`
- Your nav has 5+ desktop links and no mobile pattern
- You ran an aesthetic overhaul on an existing project without asking permission
- You changed the font family / colour tokens / motion library in a brownfield project without permission
- You skipped reading `tailwind.config` / `globals.css` / existing `components/` before coding
- You wrote raw-HTML injection of user content without a sanitizer
- You put a secret env var with `NEXT_PUBLIC_` / `VITE_` / `REACT_APP_` prefix
- You stored an auth token in `localStorage`
- You shipped a button with no handler, or a nav link to `#`
- You set `outline: none` on focus without a visible replacement
- You're about to commit a `.env` / `secrets.json` / key file

---

**Non-negotiable. Cannot be rationalized away. Functional + secure + respectful OR don't ship. Ship with taste AND verify OR don't ship.**
