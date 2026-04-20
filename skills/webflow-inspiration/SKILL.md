---
name: webflow-inspiration
description: Use during the initial vibe-gathering phase of any landing page / marketing site - before picking fonts, colors, or motion. The Made-in-Webflow CSS-animations gallery (https://webflow.com/made-in-webflow/css-animations) is a living catalog of real, shipped, hand-crafted animated sites that DON'T look AI-generated. Pull 1-3 sites as vibe references, extract what makes them distinctive, then brief the taste-skill / ui-ux-pro-max with that context.
---

# Webflow Inspiration (Made-in-Webflow)

https://webflow.com/made-in-webflow/css-animations is a moderated gallery of sites built by human designers. They are the antithesis of AI-slop: specific, opinionated, experimental, sometimes weird.

## Why This Matters

Without a vibe reference, the LLM defaults to the average of its training data = slop. With 1-3 concrete human-made references, it has a target aesthetic to aim at.

## Workflow

1. **Pick 1-3 sites** from the Made-in-Webflow CSS-animations gallery that match the user's product.
2. **Describe what makes each distinctive** in plain language:
   - "scroll-pinned hero with text that masks through a photo"
   - "card that rotates in 3D when the cursor enters, tilt angle tied to cursor position"
   - "section transitions are horizontal, not vertical"
   - "color palette is exactly two colors, high contrast"
3. **Feed those descriptions** into the design brief before invoking `taste-skill` / `ui-ux-pro-max`.
4. **Reimplement in JSX**, not Webflow's generated code. Use `motion-dev-animations` for the motion layer, `animate-ui-elements` for the element primitives, `webgpu` for anything shader-driven.

## Rules

- **Never copy a site 1:1** — pull the one distinctive thing, not the whole layout.
- **Prefer sites that do ONE unusual thing well** over sites that do many generic things.
- **Track the URL** in a comment at the top of the main page file so the user can see the reference:

```tsx
// Vibe ref: https://webflow.com/made-in-webflow/website/<name>
// We're taking: [scroll-pinned mask + horizontal section transitions]
```

## When NOT to Use

- Internal tool UI — vibe references are for marketing / consumer surfaces.
- User gave a brand spec already (Linear, Stripe, etc.) — use `awesome-design-md` / `skillui` instead.

## Alternatives

- https://godly.website — curated design gallery, heavier on art direction
- https://httpster.net — eclectic, experimental
- https://siteinspire.com — more conservative

Webflow is the default because its CSS-animations category guarantees motion is present and considered.
