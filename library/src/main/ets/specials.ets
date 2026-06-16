import { AnimTransform, AnimOptions } from './types';
import { calcDuration, makeUpdater } from './internal';

// ================================================================
// hinge (duration × 2)
// ================================================================
// NOTE: CSS sets animation-duration: calc(var(--animate-duration) * 2) for hinge.
// To match web behavior, pass duration * 2.
export function hinge(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 0;

  const t20: AnimTransform = new AnimTransform();
  t20.rotateZ = 80;

  const t40: AnimTransform = new AnimTransform();
  t40.rotateZ = 60;
  t40.opacity = 1;

  const t60: AnimTransform = new AnimTransform();
  t60.rotateZ = 80;

  const t80: AnimTransform = new AnimTransform();
  t80.rotateZ = 60;
  t80.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 700;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.EaseInOut, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 20), curve: Curve.EaseInOut, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 40), curve: Curve.EaseInOut, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 60), curve: Curve.EaseInOut, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 80), curve: Curve.EaseInOut, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.EaseInOut, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// jackInTheBox
// ================================================================
export function jackInTheBox(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 0.1;
  t0.scaleY = 0.1;
  t0.rotateZ = 30;
  t0.opacity = 0;

  // CSS scale interpolates 0.1→1 from 0% to 100%. At 50% ≈ 0.55, at 70% ≈ 0.73.
  const t50: AnimTransform = new AnimTransform();
  t50.scaleX = 0.55;
  t50.scaleY = 0.55;
  t50.rotateZ = -10;

  const t70: AnimTransform = new AnimTransform();
  t70.scaleX = 0.73;
  t70.scaleY = 0.73;
  t70.rotateZ = 3;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.rotateZ = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 50), curve: Curve.Linear, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 70), curve: Curve.Linear, event: makeUpdater(updater, t70) },
    { duration: calcDuration(dur, 70, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rollIn
// ================================================================
export function rollIn(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = -100;
  t0.rotateZ = -120;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.rotateZ = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rollOut
// NOTE: CSS "from" only sets opacity=1; transform inherits from element state.
// AnimTransform defaults all properties to 0/identity, resetting any prior transform.
// ================================================================
export function rollOut(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.rotateZ = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 100;
  t100.rotateZ = 120;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}
