import { AnimTransform, AnimOptions } from './types';
import { calcDuration, makeUpdater } from './internal';

// ================================================================
// lightSpeedInRight
// ================================================================
export function lightSpeedInRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 100;
  t0.skewX = -30;
  t0.opacity = 0;

  // CSS at 60% and 80% specifies ONLY skew, not translate.
  // translate should interpolate 100→0 across the full 0%–100% timeline.
  // Explicit translateX at each keyframe to prevent the AnimTransform
  // default of 0 from collapsing translate too early.
  const t60: AnimTransform = new AnimTransform();
  t60.translateX = 40;  // 100 * (1 - 0.6)
  t60.skewX = 20;
  t60.opacity = 1;

  const t80: AnimTransform = new AnimTransform();
  t80.translateX = 20;  // 100 * (1 - 0.8)
  t80.skewX = -5;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.skewX = 0;

  return [
    { duration: 0, curve: Curve.EaseOut, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.EaseOut, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 80), curve: Curve.EaseOut, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.EaseOut, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// lightSpeedInLeft
// ================================================================
export function lightSpeedInLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = -100;
  t0.skewX = 30;
  t0.opacity = 0;

  // CSS at 60% and 80% specifies ONLY skew, not translate.
  // translate should interpolate -100→0 across the full 0%–100% timeline.
  const t60: AnimTransform = new AnimTransform();
  t60.translateX = -40;  // -100 * (1 - 0.6)
  t60.skewX = -20;
  t60.opacity = 1;

  const t80: AnimTransform = new AnimTransform();
  t80.translateX = -20;  // -100 * (1 - 0.8)
  t80.skewX = 5;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.skewX = 0;

  return [
    { duration: 0, curve: Curve.EaseOut, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.EaseOut, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 80), curve: Curve.EaseOut, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.EaseOut, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// lightSpeedOutRight
// NOTE: CSS "from" only sets opacity=1; transform inherits from element state.
// AnimTransform defaults all properties to 0/identity, so t0 resets any prior transform.
// ================================================================
export function lightSpeedOutRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.skewX = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 100;
  t100.skewX = 30;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.EaseIn, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.EaseIn, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// lightSpeedOutLeft
// NOTE: Same as lightSpeedOutRight — t0 resets prior transform to identity.
// ================================================================
export function lightSpeedOutLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.skewX = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = -100;
  t100.skewX = -30;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.EaseIn, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.EaseIn, event: makeUpdater(updater, t100) }
  ];
}
