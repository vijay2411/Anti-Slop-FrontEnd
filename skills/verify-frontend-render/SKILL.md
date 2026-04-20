---
name: verify-frontend-render
description: Use AFTER generating any frontend code and BEFORE claiming the work is done - trigger on phrases like "here's the page", "I've built it", "it's ready", "try it out", "take a look", or before closing any frontend-related task. Forces a 3-phase hard check - pre-flight dependency declaration, post-write structural self-audit, and browser render verification via Playwright MCP (console errors, network 4xx/5xx, accessibility snapshot, full-page screenshot). Blocks "done" claims until every check passes. Catches missing libraries, broken imports, undefined CSS vars, positioning failures, elements that never rendered, silent console errors, and motion that failed to load.
---

# Verify Frontend Render

**Invoke this BEFORE you claim any frontend task is complete. Before you say "here it is". Before you show the user anything.**

## The Iron Law

> **No "done" without verification. No verification without rendering. No rendering without a dependency receipt.**

If you wrote frontend code and haven't (1) declared and verified every import + CSS token, (2) rendered it in a browser, (3) checked console + network + a11y snapshot — then it is **not** done. Say so explicitly. Never claim success on unverified UI.

## Why this skill exists

Repeated real-world failures when UIs ship unverified:
- A library was imported but never installed → build crashes
- A `var(--accent)` used but never defined in `:root` → element invisible
- An absolute-positioned element without a positioned ancestor → flies off-screen
- A flex item missing `min-width: 0` → text overflows its column
- Motion.dev import path wrong → animations silently don't play
- A section conditional never rendered → whole feature missing
- Console errors swallowed → user sees blank page

Every one of these is catchable in <2 minutes. None are catchable by "looks right to me".

---

## Phase 1 — Pre-Flight Dependency Receipt (BEFORE the first line of code)

Before writing any frontend code, state — visibly in your output — a **dependency receipt**:

```
DEPENDENCIES
├── Runtime libs:
│   ├── motion (12.x)             — npm install motion
│   ├── lucide-react (latest)      — already in package.json ✓
│   └── clsx (2.x)                 — already in package.json ✓
├── Design tokens (CSS vars):
│   ├── --accent, --accent-hi      — defined in :root block of globals.css
│   ├── --f-display, --f-body      — wired via next/font/google
│   └── --bg, --text, --text-2     — defined in :root
├── External assets:
│   ├── Google Fonts: Instrument Serif + Inter Tight — <link> in head
│   └── No CDN scripts
└── Banned/forbidden: framer-motion (not used), Inter as default (not used)
```

**Every item must have a verified source.** If you cannot say where a dep comes from, stop. Either install it (output the `npm install` command) or swap for something sourceable.

Common failure: "I'll just `import { motion } from 'motion/react'` — it's usually there." **No.** Check `package.json`. If absent, `npm install motion` first.

---

## Phase 2 — Post-Write Structural Self-Audit (INLINE, before opening a browser)

Run this checklist against the code you just wrote. One line per check, mark ✓ or ✗.

### Imports & deps
- [ ] Every `import` statement resolves to a `package.json` entry OR a valid relative path
- [ ] Every `<script src>` / `<link href>` URL is valid (https or relative)
- [ ] No `framer-motion` imports (must be `motion` / `motion/react`)

### CSS
- [ ] Every className referenced in JSX/HTML has a matching CSS rule (grep to confirm)
- [ ] Every `var(--foo)` used is defined in `:root` or a scoped parent
- [ ] Every Tailwind class used is valid (no made-up utilities)

### Layout invariants
- [ ] Every flex child with text truncation / ellipsis has `min-width: 0` on itself
- [ ] Every absolute-positioned element has a `position: relative/absolute/fixed` ancestor
- [ ] Grid `grid-template-columns` column count matches child `grid-column: span N` sums (no overflow)
- [ ] No element animates `top` / `left` / `width` / `height` (transforms only)
- [ ] Every `aspect-ratio` is paired with a sensible `max-width` or `width` constraint

### Motion
- [ ] Every `motion.X` component has both initial AND animate states (or is intentionally static)
- [ ] `AnimatePresence` wraps any conditionally-mounted component
- [ ] `prefers-reduced-motion` media query is present OR `useReducedMotion()` is checked
- [ ] Motion library is imported from `motion` / `motion/react`, not `framer-motion`

### Content completeness
- [ ] Every section in the design spec is present in the output
- [ ] Every interactive element (CTA, form, nav) has a working handler or href
- [ ] No lorem-ipsum or TODO placeholders

### Multi-device responsive invariants
- [ ] At least 3 breakpoints handled: mobile (`<640px`), tablet (`640-1024px`), desktop (`>1024px`)
- [ ] No element has a fixed width that exceeds `100vw` at any breakpoint
- [ ] No horizontal scroll on any breakpoint (`overflow-x: hidden` on body is a smell, not a fix — find the offender)
- [ ] Body font-size ≥ 15px on mobile (≥ 16px preferred — prevents iOS zoom-on-focus)
- [ ] All interactive elements (buttons, links, inputs, tap targets) are ≥ 44×44px on mobile
- [ ] Nav has a mobile pattern (hamburger / drawer / bottom-bar) — not just desktop links that disappear
- [ ] Images use `srcset` / `sizes` OR are SVG OR have explicit `width`/`height` to prevent CLS
- [ ] Grids / flex containers have sensible mobile fallbacks (no 4-column grid fighting a 375px screen)
- [ ] Absolute / fixed positioned elements tested at narrow widths — common overflow source
- [ ] Text doesn't truncate important content on mobile (CTA labels, nav items, prices)
- [ ] Form inputs use correct `inputmode` / `autocomplete` for mobile keyboards

**Any ✗ → fix before Phase 3. Do not proceed.**

---

## Phase 3 — Browser Render (via Playwright MCP)

### If Playwright MCP is available

Tools prefixed `mcp__plugin_playwright_playwright__browser_*`. Run this sequence:

1. **Serve the page.** For a built project: `npm run dev` (or similar) in a background shell; capture the URL. For a static HTML file: use `file:///absolute/path/to/file.html`.
2. **Navigate:** `browser_navigate(url)`
3. **Wait for mount:** `browser_wait_for({ text: "<a piece of expected text>" })` so motion/hydration can settle
4. **Console check:** `browser_console_messages()` — **any error or warning must be resolved or explicitly waived with a stated reason** before claiming done
5. **Network check:** `browser_network_requests()` — scan for 4xx / 5xx on fonts, CSS, JS, images
6. **Structural check:** `browser_snapshot()` — get the accessibility tree; verify every expected section (hero, nav, features, CTA, footer, etc.) is present with expected text
7. **Visual check:** `browser_take_screenshot({ fullPage: true })` — describe what you see in 5-8 bullets. Compare against the spec. Call out anything misaligned, clipped, or visually off.
8. **Count checks:** `browser_evaluate("() => ({ tracks: document.querySelectorAll('.track').length, sections: document.querySelectorAll('section').length })")` — confirm counts match what you wrote
9. **Interactive spot-check (optional but strong):** hover a CTA, click a nav link, scroll to a section; confirm motion fires and no errors appear in console
10. **Multi-device sweep (MANDATORY):** resize the viewport and re-verify at each breakpoint:
    - `browser_resize({ width: 375, height: 812 })` — iPhone portrait. Re-run console + snapshot + screenshot. Confirm no horizontal scroll, no clipped text, nav has mobile treatment, touch targets look tappable.
    - `browser_resize({ width: 768, height: 1024 })` — iPad portrait. Re-run the same checks.
    - `browser_resize({ width: 1440, height: 900 })` — standard desktop. Re-run.
    - **Any breakpoint that shows an issue must be fixed before claiming done.** "Works on desktop" is half-verification.

### If Playwright MCP is NOT available

Say so explicitly, like this:

> "I cannot verify the rendered page because Playwright MCP is not installed. I ran Phase 1 + Phase 2 and found N issues (list them or say 'none'). I cannot confirm there are no runtime errors, layout bugs, or missing elements. Please (a) install the Playwright plugin, or (b) open the file and send back: console output + a screenshot + anything visually off."

Do NOT claim the work is done. "Probably works" is not a shippable state.

---

## Failure Recovery Protocol

| Symptom | Root cause | Fix pattern |
|---|---|---|
| Console: `Failed to resolve module` | Missing dep | Add `npm install X`, re-verify |
| Console: `Cannot read properties of undefined` | Reference before mount / missing provider | Add guard, fix order, wrap provider |
| Network: 404 on font / css / image | Wrong URL / path / typo | Fix path, re-verify |
| Network: 403 on Google Fonts | Missing `crossorigin` on preconnect | Add it |
| Snapshot missing expected section | Conditional never true / render gated | Check the condition / data |
| Screenshot: element off-screen | Absolute positioning without ancestor | Add `position: relative` to parent |
| Screenshot: text wraps/overlaps | Missing `min-width: 0` on flex child | Add it |
| Screenshot: element stretches oddly | Parent `align-items: stretch` on a child with explicit size | Set `align-self: center` or change parent |
| Motion doesn't play | Import wrong / JS not loaded / reduced-motion on | Check import, check console, check OS setting |
| Page blank white | JS threw before paint | Console errors are the answer |
| Only partial render | Hydration mismatch | Check SSR/CSR consistency |
| Mobile: horizontal scroll bar appears | Element exceeds viewport width | Find offender via `document.querySelectorAll('*').forEach(el => el.scrollWidth > document.documentElement.clientWidth && console.log(el))` |
| Mobile: text clipped / cut off | `overflow: hidden` without `text-overflow: ellipsis` or flex child missing `min-width: 0` | Add truncation or fix flex |
| Mobile: CTA buttons too small to tap | Height or padding insufficient | Enforce ≥ 44px tap target |
| Mobile: input zooms the page on focus (iOS) | Font-size < 16px on input | Bump input font-size to 16px on mobile |
| Tablet: 3-column grid looks cramped | No tablet breakpoint | Add `@media (max-width: 1024px)` rule |
| Desktop: content line-length > 80 chars | Missing `max-width` on text containers | Add `max-width: 65ch` to body text |

Every fix triggers **re-verify from Phase 2**. No partial fixes → one pass.

---

## Red Flags — STOP immediately if you catch yourself thinking

- "The code looks right, it'll probably render"
- "I'll skip the screenshot, the user can check"
- "Motion.dev always works, no need to verify the import"
- "shadcn imports are standard, no need to audit"
- "It's just static HTML, nothing can break"
- "The Phase 2 checklist is for big projects, mine is simple"
- "The user will test it anyway"
- "I've done this pattern before"

**All of these have failed in shipped code.** They are rationalizations. Run the verification.

---

## Rationalization Table

| Excuse | Reality |
|---|---|
| "It would have errored at build if something was missing" | Imports can resolve at build but fail at runtime. Static HTML has no build. Verify. |
| "Playwright takes too long" | Three minutes vs a user seeing a broken page. The math is obvious. |
| "I'll just say 'try it out'" | That offloads your job to the user. Do your job. |
| "The last one worked, this one will too" | Each page has unique state. Verify each. |
| "I'm confident the CSS vars are defined" | Confidence is not verification. Grep. |
| "The screenshot won't show the bug anyway" | Console will. Run it. |

---

## The Minimum Viable Verification (if you truly have only 2 minutes)

Cannot skip Phase 2. Ever.

Phase 3 minimum:
- `browser_navigate`
- `browser_console_messages` — **zero errors**
- `browser_take_screenshot` — describe what you see, flag anything off

If even that is impossible, admit it in output. Don't fake verification.

---

## Bottom Line

**"Here's your page" is a promise. Back it up with evidence.**

The evidence is: (1) a dependency receipt, (2) a passed structural checklist, (3) a clean console, (4) a described screenshot. No exceptions.
