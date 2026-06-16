# Contributing

Contributions are welcome — bug reports, feature requests, documentation improvements, and code contributions.

## Getting Started

1. Clone the repo and open it in DevEco Studio
2. The library source is in `library/src/main/ets/`
3. The demo app is in `entry/`

## Development

### Project Structure

```
arkts-animate-css/
├── library/                          # The arkts-animate-css library (HAR)
│   └── src/main/ets/
│       ├── Index.ets                 # Barrel export (97 animation functions)
│       ├── types.ets                 # AnimTransform + AnimOptions
│       ├── attention_seekers.ets     # 12 animations (bounce, flash, pulse, ...)
│       ├── back_animations.ets       # 8 animations (backIn*, backOut*)
│       ├── bouncing_animations.ets   # 10 animations (bounceIn*, bounceOut*)
│       ├── fading_entrances.ets      # 13 animations (fadeIn*)
│       ├── fading_exits.ets          # 13 animations (fadeOut*)
│       ├── flippers.ets              # 5 animations (flip, flipIn*, flipOut*)
│       ├── lightspeed.ets            # 4 animations (lightSpeed*)
│       ├── rotating_animations.ets   # 10 animations (rotateIn*, rotateOut*)
│       ├── sliding_animations.ets    # 8 animations (slideIn*, slideOut*)
│       ├── specials.ets              # 4 animations (hinge, jackInTheBox, roll*)
│       └── zooming_animations.ets    # 10 animations (zoomIn*, zoomOut*)
├── entry/                            # Demo/test application
│   └── src/main/ets/pages/
│       └── Index.ets                 # 101 test cases
├── migration-plan.json               # Per-file migration map
└── README.md
```

### API Pattern

Every animation function follows the same signature:

```typescript
function animationName(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[]
```

When adding a new animation:
1. Follow the existing pattern in the appropriate category file
2. Use `AnimTransform` for property updates
3. Return `KeyframeState[]` with proper `duration`, `delay`, and `curve` per keyframe
4. Export from `Index.ets`

### ArkTS Constraints

All code must comply with HarmonyOS ArkTS strict-mode:
- No `any` / `unknown` types
- No `Symbol()`
- No `delete` operator
- No `for...in` loops
- No spread syntax (`...`)
- No `Function.bind()` / `Function.call()` / `Function.apply()`
- No indexed access on untyped objects

### Before Submitting

- Verify the code compiles in DevEco Studio (`hvigorw assembleHar`)
- Ensure new animations follow the same function signature
- Update `Index.ets` barrel export
- Update `README.md` animation count and category table

## Reporting Issues

Please include:
- HarmonyOS / SDK version
- Minimal reproduction code snippet
- Animation name and expected vs actual keyframe values
- Whether it works in standard animate.css (for behavior regressions)

## License

By contributing, you agree that your contributions will be licensed under the Apache License, Version 2.0.
