/**
 * Unified transform state for keyframe animation callbacks.
 * All properties have defaults matching CSS initial values:
 * translate=0, scale=1, rotate=0, opacity=1, skew=0.
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
 * duration: total animation duration in milliseconds (required).
 * delay: start delay in milliseconds (default 0).
 * iterations: repeat count (default 1, use -1 for infinite).
 * curve: timing curve (default Curve.Ease).
 * onFinish: callback invoked when animation completes.
 */
export interface AnimOptions {
  duration: number;
  delay?: number;
  iterations?: number;
  curve?: Curve;
  onFinish?: () => void;
}
