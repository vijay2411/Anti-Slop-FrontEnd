# Anti-Slop Frontend

> **Stop Claude (and every other coding agent) from shipping purple-gradient, Inter-everywhere, 2×2-bento-card AI slop.**

A Claude Code skills pack that replaces Anthropic's default `frontend-design` with a curated stack of **13 skills** — one mega-router + one render verifier + 11 specialists — that enforce rich, intentional, motion-driven, multi-device, *verified* interfaces.

```bash
git clone https://github.com/vijay2411/Anti-Slop-FrontEnd.git
cd Anti-Slop-FrontEnd
./install.sh
```

That's it. Next frontend request you give Claude, the mega-skill fires first and walks the design the right way.

---

## The difference

**Without this pack** — generic SaaS: purple→pink gradient, Inter for everything, 3 identical feature cards in a bento, `hover:opacity-80`, no motion, no personality.

**With this pack** — every frontend task requires:
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

...and the mega-skill auto-rejects drafts containing any of 26 specific slop patterns.

See a real output in [`demo/reelkit.html`](./demo/reelkit.html) — open it in any browser.

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
./install.sh
```

### From zip
```bash
unzip Anti-Slop-FrontEnd.zip
cd Anti-Slop-FrontEnd
./install.sh
```

### Flags
```bash
./install.sh                   # interactive (default) — prompts before removing Anthropic's default
./install.sh --yes             # assume yes to all prompts
./install.sh --keep-anthropic  # keep Anthropic's frontend-design alongside ours
./install.sh --help            # show usage
```

### What the installer does
1. Prompts to remove Anthropic's default `frontend-design` skill (recommended — our mega-skill replaces it).
2. Clones the 5 upstream repos into `~/.claude/skills/`.
3. Copies our 7 custom SKILL.md files into `~/.claude/skills/`.
4. Drops wrapper `SKILL.md` files on top of each cloned repo so Claude can discover them (they bury their real SKILL.md in subpaths).

### Verify it's working
Open any Claude Code session and say:

> Build me a landing page for a new note-taking app.

The `anti-slop-frontend` skill should fire first — before any code — and walk you through vibe / typography / motion choices. If it doesn't, restart your Claude Code client so it rescans `~/.claude/skills/`.

### Uninstall
```bash
./uninstall.sh          # interactive
./uninstall.sh --yes    # non-interactive
```
Removes all 12 skill directories. Does **not** restore Anthropic's `frontend-design` — reinstall the `claude-plugins-official` marketplace plugin for that.

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

**Will this work with Codex / Cursor / Cline?**
The SKILL.md format is an open standard ([agentskills.io](https://agentskills.io/specification)). Wrappers target Claude Code's `~/.claude/skills/`. For Codex, symlink or copy into `~/.agents/skills/`. For others, check their docs.

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
