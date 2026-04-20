# Anti-Slop Frontend

> **Stop Claude (and every other coding agent) from shipping purple-gradient, Inter-everywhere, 2×2-bento-card AI slop — while keeping the app functional, secure, and respectful of existing project UI.**

A skills pack — works with **Claude Code**, **OpenAI Codex CLI**, and **Google Gemini CLI** — that replaces default frontend-design behavior with a curated stack of **13 skills** (one mega-router + one render verifier + 11 specialists) enforcing rich, intentional, motion-driven, multi-device, *verified* interfaces.

### Install

Clone once, then pick your harness:

```bash
git clone https://github.com/vijay2411/Anti-Slop-FrontEnd.git
cd Anti-Slop-FrontEnd

./install.sh                      # Claude Code (default)
./install.sh --target codex       # OpenAI Codex CLI
./install.sh --target gemini      # Google Gemini CLI
./install.sh --target all         # install to all three
```

Next frontend request you give the agent, the mega-skill fires first and walks the design the right way.

---

## The difference

**Without this pack** — generic SaaS: purple→pink gradient, Inter for everything, 3 identical feature cards in a bento, `hover:opacity-80`, no motion, no personality.

**With this pack** — every frontend task is gated by an *Absolute Iron Law*:

> **1. Functional first. 2. Secure second. 3. Respect existing UI third. 4. Anti-slop aesthetics fourth.**

### Brownfield vs greenfield — mode auto-detected

- **Brownfield** (project already has a UI): the pack audits `tailwind.config`, `globals.css`, existing `components/`, fonts, motion library — then *matches* the existing style. Only additive changes. Never swaps tokens, fonts, or libraries without explicit permission. Creativity engages only when the user says "modernize" / "revamp" / "surprise me".
- **Greenfield** (new / empty project): the full creative pipeline fires — trend research, adventurous palette, motion, variadic animation, etc.

### Security + functionality baseline (always on)

Non-negotiable checks every build runs before shipping:
- ✅ **No secrets in client code** — API keys, tokens, passwords grep'd out of the diff
- ✅ **No XSS vectors** — raw-HTML injection requires a sanitizer, no dynamic code evaluation
- ✅ **Env-var hygiene** — secrets never prefixed `NEXT_PUBLIC_` / `VITE_` / `REACT_APP_`
- ✅ **Auth gates actually gate** — not just CSS-hidden admin UI
- ✅ **Functional correctness** — forms submit, buttons route, loading + error + empty states, keyboard nav
- ✅ **Accessibility** — aria labels, alt text, focus-visible, semantic headings, WCAG contrast, reduced-motion respected

### Creative pipeline (greenfield, or brownfield with user permission)

- ✅ **Trend research** before anything else (WebSearch + awwwards / godly / land-book pass)
- ✅ **Dependency receipt** — every lib, token, and asset sourced before the first line of code
- ✅ A **vibe reference** (from Made-in-Webflow, a named brand, or a Stitch mockup)
- ✅ A **design system source** (industry-matched palette from 161 options, not default)
- ✅ **Adventurous colour** — 3+ hues with one unexpected pairing, never "brand colour + grey"
- ✅ **Motion** (`motion.dev` scroll reveals, stagger, spring physics)
- ✅ **Animated elements** (from animate-ui.com or 21st.dev)
- ✅ **Intentional typography** (Google Fonts picked for vibe, **never Inter by default**)
- ✅ **Multi-device proof** — mobile (375), tablet (768), desktop (1440) all verified
- ✅ **Rendered verification** via Playwright MCP — console clean, snapshot complete, screenshot inspected

...and the mega-skill auto-rejects drafts containing any of 40+ specific slop, security, or drift patterns.

See two real outputs — same product prompt, built on different versions of the pack — in [`demo/`](./demo/): [`reelkit-v1.html`](./demo/reelkit-v1.html) (5-rule release) vs [`reelkit-v2.html`](./demo/reelkit-v2.html) (updated pack with trend research + adventurous colour + multi-device + render verification). See [`demo/README.md`](./demo/README.md) for the exact prompt and side-by-side notes.

---

## What's in the pack

### The mega-skill
**`anti-slop-frontend`** — Fires on any frontend request. Routes by vibe to the right specialist, enforces 5 non-negotiables, hard-blocks 14 slop patterns, ships a rationalization table so the agent can't excuse its way around the rules.

### The verifier (MANDATORY final step)
**`verify-frontend-render`** — Runs a 3-phase hard check after code generation, BEFORE claiming done: (1) dependency receipt, (2) post-write structural self-audit (imports / CSS vars / responsive invariants / flex guards / grid math), (3) Playwright MCP browser pass — navigate, wait, console check, network check, accessibility snapshot, full-page screenshot, resize to 375/768/1440 and re-verify. Blocks "here's the page" claims until every check passes.

### Reference skills (authored here, MIT-licensed)
| Skill | What it covers |
|---|---|
| `motion-dev-animations` | motion.dev primitives — scroll reveals, stagger, layout, JSX backgrounds |
| `animate-ui-elements` | Per-element animation components from animate-ui.com |
| `google-fonts-picker` | Typography picker with vibe-to-font mapping (banishes Inter-as-default) |
| `twenty-first-dev` | Premium-component polish flourishes from 21st.dev |
| `stitch-workflow` | Google Stitch handoff for multi-variant mockups |
| `webflow-inspiration` | Sourcing vibe from Made-in-Webflow CSS-animations gallery |

### Upstream skills (cloned at install time, each retains its own license)
| Skill | Author | Role |
|---|---|---|
| `skillui` | [@amaancoderx](https://github.com/amaancoderx/skillui) | Reverse-engineer any website into a Claude-ready design bundle |
| `webgpu` | [@dgreenheck](https://github.com/dgreenheck/webgpu-claude-skill) | Three.js WebGPU / TSL shader visuals |
| `awesome-design-md` | [VoltAgent](https://github.com/VoltAgent/awesome-design-md) | 68+ ready DESIGN.md files from real brands |
| `ui-ux-pro-max` | [@nextlevelbuilder](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | 161 product types × 50+ styles × 161 palettes reasoning engine |
| `taste-skill` | [@Leonxlnx](https://github.com/Leonxlnx/taste-skill) | Opinionated anti-slop design philosophy (7 variants) |

---

## How the mega-skill decides

```
User: "build me a landing page for X"
         │
         ▼
   anti-slop-frontend fires
         │
         ├── Named real brand? ───────→ awesome-design-md / skillui
         ├── Described a product? ────→ ui-ux-pro-max (industry lookup)
         ├── "Premium / cinematic"? ──→ taste-skill
         └── No reference at all? ────→ stitch-workflow (pick variants visually first)
         │
         ▼
   Require vibe reference (Made-in-Webflow link in a code comment)
         │
         ▼
   Pick typography via google-fonts-picker (NO Inter default)
         │
         ▼
   Scaffold JSX background (animated blobs / shaders / aurora)
         │
         ▼
   motion.dev primitives for entrance + scroll
         │
         ▼
   At least one animate-ui.com / 21st.dev element
         │
         ▼
   Audit against 14-pattern blocklist → reject + rewrite on any hit
         │
         ▼
   Ship
```

---

## Install

### Prereqs
- macOS or Linux (Windows: WSL works)
- `git`
- Python 3 (optional — there's a grep fallback for `sources.json` parsing)
- Claude Code installed, with `~/.claude/skills/` accessible

### From git (recommended)
```bash
git clone https://github.com/vijay2411/Anti-Slop-FrontEnd.git
cd Anti-Slop-FrontEnd
./install.sh --target <claude|codex|gemini|all>
```

### From zip
```bash
unzip Anti-Slop-FrontEnd.zip
cd Anti-Slop-FrontEnd
./install.sh --target <claude|codex|gemini|all>
```

### Flags
```bash
./install.sh                      # default: claude (Claude Code)
./install.sh --target codex       # OpenAI Codex CLI
./install.sh --target gemini      # Google Gemini CLI
./install.sh --target all         # all three
./install.sh --yes                # assume yes to all prompts
./install.sh --keep-anthropic     # keep Anthropic's frontend-design alongside (Claude only)
./install.sh --help               # show usage
```

### What the installer does (per-target)

| Target | Install path | Extra |
|---|---|---|
| `claude` | `~/.claude/skills/<skill>/SKILL.md` | Prompts to remove Anthropic's default `frontend-design` |
| `codex` | `~/.codex/skills/<skill>/SKILL.md` | Restart Codex after install |
| `gemini` | `~/.gemini/extensions/anti-slop-frontend/skills/<skill>/SKILL.md` | Writes `gemini-extension.json` manifest; restart Gemini CLI |

For every target the installer:
1. Clones the 5 upstream repos into the skills directory
2. Copies our 8 custom SKILL.md files (mega + verifier + 6 reference)
3. Drops wrapper `SKILL.md` files on top of each cloned repo so the agent can discover them (they bury their real SKILL.md in subpaths)

### Verify it's working
Open any Claude Code session and say:

> Build me a landing page for a new note-taking app.

The `anti-slop-frontend` skill should fire first — before any code — and walk you through vibe / typography / motion choices. If it doesn't, restart your Claude Code client so it rescans `~/.claude/skills/`.

### Uninstall
```bash
./uninstall.sh                       # default: claude
./uninstall.sh --target codex        # Codex
./uninstall.sh --target gemini       # removes the whole Gemini extension dir
./uninstall.sh --target all          # all three
./uninstall.sh --yes                 # non-interactive
```
Removes all 13 skill directories from the chosen target. Does **not** restore Anthropic's `frontend-design` — reinstall the `claude-plugins-official` marketplace plugin for that.

---

## The 26-pattern slop blocklist

The mega-skill rejects any draft containing:

- Purple → pink gradient backgrounds (the #1 AI-tell)
- Inter / Geist as only font without intentional pick
- 2×2 or 3×3 bento card grid for features
- Glassmorphism + sparkline + border-accent combo
- `text-transparent bg-clip-text bg-gradient-to-r from-X to-Y` on every heading
- Card with emoji icon + lorem-ipsum-feel description
- `hover:scale-105 transition-all` as the only interaction
- Static CSS keyframes where motion.dev would be richer
- Animating `top/left/width/height` (use transforms)
- Solid-color page backgrounds
- No `prefers-reduced-motion` respect
- Shadcn components pasted unmodified with default colors
- Lucide icons at default stroke + size everywhere
- `<hr />` as section separators
- "Brand colour + grey" as entire palette (monochrome = 2019)
- Single gradient stamped on every heading
- All accents from same hue family (all blues / all oranges)
- Desktop-only UI — no mobile breakpoint ever written
- `overflow-x: hidden` on `<body>` to mask mobile overflow
- Fixed-width element that clips at 375px
- Nav collapses to nothing at mobile (no hamburger/drawer)
- Touch target smaller than 44×44 on mobile
- Body text < 16px on mobile inputs (triggers iOS zoom)
- Claimed "done" without invoking `verify-frontend-render`
- "Probably renders fine" reasoning without a screenshot

---

## FAQ

**Will this work with Codex / Gemini / Cursor / Cline?**
Claude Code, Codex, and Gemini are all first-class supported via `./install.sh --target <harness>`. The SKILL.md format is an open standard ([agentskills.io](https://agentskills.io/specification)) and identical across all three. For Cursor / Cline / Windsurf (rule-based rather than skill-based), copy the mega-skill body into `.cursor/rules/anti-slop.md` (or `.clinerules`) manually — the routing logic translates cleanly.

**The mega-skill feels too aggressive — can I tone it down?**
Edit `~/.claude/skills/anti-slop-frontend/SKILL.md`. Soften the "non-negotiable" framing if you like. The aggressiveness is the feature.

**Does this add anything to my project bundle size?**
Zero. Skills are Claude-side instructions, not runtime code. Your bundle only grows if *you* install `motion`, an `animate-ui` component, etc.

**Can I use only some of these skills?**
Yes. Either remove the directories you don't want after install, or comment out entries in the `CUSTOM_SKILLS` / `WRAPPERS` arrays in `install.sh` before running.

**Windows?**
WSL works. Native PowerShell port not bundled — PRs welcome.

**Does it auto-update?**
Not yet. Re-run `./install.sh` from a fresh `git pull` to update (upstream repos get `git pull`ed in place).

---

## Credits

- **Impeccable** — spiritual predecessor; the anti-pattern-driven approach. Ships with Anthropic's official plugins.
- **@amaancoderx** — `skillui`
- **@dgreenheck** — `webgpu-claude-skill`
- **VoltAgent** — `awesome-design-md`
- **@nextlevelbuilder** — `ui-ux-pro-max-skill`
- **@Leonxlnx** — `taste-skill`
- **motion.dev**, **animate-ui.com**, **21st.dev**, **Made-in-Webflow**, **Google Stitch**, **Google Fonts** — underlying tools the reference skills wrap.

Inspired by [this YouTube breakdown of the top 10 Claude Code frontend skills](https://youtu.be/Q9ty3eopOPs), then taken further.

---

## License

MIT. See [LICENSE](./LICENSE). Upstream repos retain their own licenses — this pack does not redistribute their code; `install.sh` clones them fresh at install time.

## Contributing

Issues, PRs, new skill proposals all welcome. To add a skill, copy the format of any existing `skills/<name>/SKILL.md` — YAML frontmatter with `name` + `description` (starts with "Use when…"), then body. Submit via PR.

---

**Ship with taste or don't ship.**
