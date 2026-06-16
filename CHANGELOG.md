# Changelog

## 1.0.0 (2025-06-16)

Initial release — animate.css v4.1.1 ported to HarmonyOS ArkTS.

### Included
- **97 keyframe animations** — all animations from animate.css v4.1.1
- **14 categories** — Attention Seekers, Back Entrances/Exits, Bouncing Entrances/Exits, Fading Entrances/Exits, Flippers, Lightspeed, Rotating Entrances/Exits, Sliding Entrances/Exits, Specials, Zooming Entrances/Exits
- `AnimTransform` class — translate, scale, rotate, opacity, skew properties
- `AnimOptions` interface — duration, delay, iterations, curve, onFinish
- `KeyframeState[]` output — compatible with ArkUI `keyframeAnimateTo()` API
- 101 runtime tests — 100% API coverage

### Omitted (platform constraints)
- CSS `@keyframes` parsing — replaced by function-based API
- CSS property-based configuration — replaced by `AnimOptions`

### Known Limitations
- Does not parse CSS animation strings — all animations are called as functions
- `iterations: -1` for infinite loops must be managed by the caller (ArkUI handles this)
