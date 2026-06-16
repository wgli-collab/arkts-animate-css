import { AnimTransform, AnimOptions } from './types';

function calcDuration(totalDuration: number, prevPercent: number, currentPercent: number): number {
  return totalDuration * (currentPercent - prevPercent) / 100;
}

function makeUpdater(
  updater: (transform: AnimTransform) => void,
  transform: AnimTransform
): () => void {
  return (): void => {
    updater(transform);
  };
}

// ================================================================
// hinge (duration × 2)
// ================================================================
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

  const t50: AnimTransform = new AnimTransform();
  t50.rotateZ = -10;

  const t70: AnimTransform = new AnimTransform();
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
