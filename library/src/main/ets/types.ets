/**
 * Unified transform state for keyframe animation callbacks.
 * All properties have defaults matching CSS initial values:
 * translate=0, scale=1, rotate=0, opacity=1, skew=0.
 *
 * Known Platform Limitations:
 *
 * Percentage-based translations:
 * CSS animate.css uses percentage-based translations (e.g. translate3d(-100%,0,0))
 * relative to the element's own dimensions. ArkTS translateX/translateY use
 * absolute vp (virtual pixel) units. The animation functions use literal numeric
 * values (e.g. -100 for -100%) as reasonable defaults for typical UI elements.
 * For elements significantly larger or smaller than ~100 vp, scale the translate
 * values proportionally: translateEffective = literalValue * (elementSizeVp / 100)
 *
 * 3D Transform Approximation:
 * CSS rotateX/rotateY/rotateZ/perspective have limited support in ArkUI.
 * These are approximated using rotateZ with optional scaleX/scaleY compression
 * (see flippers.ets, attention_seekers.ets). The visual effect will differ.
 *
 * Transform Origin:
 * CSS transform-origin (e.g. right bottom, left center) is not representable
 * in AnimTransform. Animations relying on transform-origin for differentiation
 * (rotateInDownRight vs rotateInUpLeft) will appear identical.
 *
 * Custom Cubic-Bezier Curves:
 * CSS uses custom cubic-bezier timing for specific animations (bounce, zoom*,
 * flip). ArkTS maps to the closest Curve enum (Curve.Ease, Curve.EaseIn, etc.).
 */
export class AnimTransform {
  translateX: number = 0;
  translateY: number = 0;
  scaleX: number = 1;
  scaleY: number = 1;
  rotateZ: number = 0;
  opacity: number = 1;
  skewX: number = 0;
  skewY: number = 0;
}
/**
 * Animation configuration options.
 *
 * Note: delay, iterations, curve, and onFinish are declared for API completeness
 * but are NOT consumed by the individual animation functions. These are intended
 * for the higher-level animation controller (ArkUI keyframeAnimateTo / animateTo)
 * that consumes the returned KeyframeState[]. The animation functions only use
 * duration to compute per-segment durations.
 *
 * duration: total animation duration in milliseconds (required).
 * delay: start delay in milliseconds (default 0).
 * iterations: repeat count (default 1, use -1 for infinite).
 * curve: global timing curve (overridden by per-keyframe curves).
 * onFinish: callback invoked when animation completes.
 */
export interface AnimOptions {
  duration: number;
  delay?: number;
  iterations?: number;
  curve?: Curve;
  onFinish?: () => void;
}
