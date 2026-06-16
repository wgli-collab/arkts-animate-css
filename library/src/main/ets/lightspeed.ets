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

  const t60: AnimTransform = new AnimTransform();
  t60.translateX = 0;
  t60.skewX = 20;
  t60.opacity = 1;

  const t80: AnimTransform = new AnimTransform();
  t80.translateX = 0;
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

  const t60: AnimTransform = new AnimTransform();
  t60.translateX = 0;
  t60.skewX = -20;
  t60.opacity = 1;

  const t80: AnimTransform = new AnimTransform();
  t80.translateX = 0;
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
