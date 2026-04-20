---
name: webgpu
description: Use when building GPU-accelerated web visuals - shaders, WebGPU renderers, Three.js TSL (Three.js Shading Language), custom materials, particle systems, post-processing effects, volumetric rendering, or raymarched scenes. Trigger on requests for cinematic hero backgrounds, animated shader art, igloo-style landing pages, or anything that should feel physically simulated rather than CSS-animated.
---

# WebGPU / Three.js TSL Skill

Packaged guide for producing WebGPU-powered visuals with Three.js and TSL (Three.js Shading Language — node-based shaders written in JS instead of GLSL strings).

## What's Inside

The full reference lives at `skills/webgpu-threejs-tsl/SKILL.md` inside this skill directory. It covers:

- `WebGPURenderer` setup + feature detection + WebGL2 fallback
- TSL types, operators, swizzling, math, control flow (`If`, `Loop`, `Fn`)
- Uniforms and time-based animation
- `MeshStandardNodeMaterial`, node-based color/normal/emissive pipelines
- Compute shaders (`computeShader`, storage buffers)
- Post-processing node pipeline
- WGSL interop when raw shader code is needed
- GPU device loss handling

## When to Reach for This

- Hero sections that should feel alive (flowing gradients, fluid sims, particle fields)
- Data-viz or product visualizations with depth / lighting
- Generative art backgrounds
- Any moment where `framer-motion` on DOM elements is not enough

## When NOT to

- Simple UI animations (use motion.dev / animate-ui instead)
- Static pages — the GPU cost is wasted
- Environments where users may have old/integrated GPUs and you cannot afford a fallback branch

Read the nested SKILL.md before writing any WebGPU code.
