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
// bounceIn (duration × 0.75)
// ================================================================
export function bounceIn(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 0.3;
  t0.scaleY = 0.3;
  t0.opacity = 0;

  const t20: AnimTransform = new AnimTransform();
  t20.scaleX = 1.1;
  t20.scaleY = 1.1;

  const t40: AnimTransform = new AnimTransform();
  t40.scaleX = 0.9;
  t40.scaleY = 0.9;

  const t60: AnimTransform = new AnimTransform();
  t60.scaleX = 1.03;
  t60.scaleY = 1.03;
  t60.opacity = 1;

  const t80: AnimTransform = new AnimTransform();
  t80.scaleX = 0.97;
  t80.scaleY = 0.97;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Ease, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 20), curve: Curve.Ease, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 40), curve: Curve.Ease, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 60), curve: Curve.Ease, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 80), curve: Curve.Ease, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// bounceInDown
// ================================================================
export function bounceInDown(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = -3000;
  t0.scaleY = 3;
  t0.opacity = 0;

  const t60: AnimTransform = new AnimTransform();
  t60.translateY = 25;
  t60.scaleY = 0.9;
  t60.opacity = 1;

  const t75: AnimTransform = new AnimTransform();
  t75.translateY = -10;
  t75.scaleY = 0.95;

  const t90: AnimTransform = new AnimTransform();
  t90.translateY = 5;
  t90.scaleY = 0.985;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;
  t100.scaleY = 1;

  return [
    { duration: 0, curve: Curve.Ease, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.Ease, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 75), curve: Curve.Ease, event: makeUpdater(updater, t75) },
    { duration: calcDuration(dur, 75, 90), curve: Curve.Ease, event: makeUpdater(updater, t90) },
    { duration: calcDuration(dur, 90, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// bounceInLeft
// ================================================================
export function bounceInLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = -3000;
  t0.scaleX = 3;
  t0.opacity = 0;

  const t60: AnimTransform = new AnimTransform();
  t60.translateX = 25;
  t60.scaleX = 1;
  t60.opacity = 1;

  const t75: AnimTransform = new AnimTransform();
  t75.translateX = -10;
  t75.scaleX = 0.98;

  const t90: AnimTransform = new AnimTransform();
  t90.translateX = 5;
  t90.scaleX = 0.995;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.scaleX = 1;

  return [
    { duration: 0, curve: Curve.Ease, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.Ease, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 75), curve: Curve.Ease, event: makeUpdater(updater, t75) },
    { duration: calcDuration(dur, 75, 90), curve: Curve.Ease, event: makeUpdater(updater, t90) },
    { duration: calcDuration(dur, 90, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// bounceInRight
// ================================================================
export function bounceInRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 3000;
  t0.scaleX = 3;
  t0.opacity = 0;

  const t60: AnimTransform = new AnimTransform();
  t60.translateX = -25;
  t60.scaleX = 1;
  t60.opacity = 1;

  const t75: AnimTransform = new AnimTransform();
  t75.translateX = 10;
  t75.scaleX = 0.98;

  const t90: AnimTransform = new AnimTransform();
  t90.translateX = -5;
  t90.scaleX = 0.995;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.scaleX = 1;

  return [
    { duration: 0, curve: Curve.Ease, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.Ease, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 75), curve: Curve.Ease, event: makeUpdater(updater, t75) },
    { duration: calcDuration(dur, 75, 90), curve: Curve.Ease, event: makeUpdater(updater, t90) },
    { duration: calcDuration(dur, 90, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// bounceInUp
// ================================================================
export function bounceInUp(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 3000;
  t0.scaleY = 5;
  t0.opacity = 0;

  const t60: AnimTransform = new AnimTransform();
  t60.translateY = -20;
  t60.scaleY = 0.9;
  t60.opacity = 1;

  const t75: AnimTransform = new AnimTransform();
  t75.translateY = 10;
  t75.scaleY = 0.95;

  const t90: AnimTransform = new AnimTransform();
  t90.translateY = -5;
  t90.scaleY = 0.985;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;
  t100.scaleY = 1;

  return [
    { duration: 0, curve: Curve.Ease, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.Ease, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 75), curve: Curve.Ease, event: makeUpdater(updater, t75) },
    { duration: calcDuration(dur, 75, 90), curve: Curve.Ease, event: makeUpdater(updater, t90) },
    { duration: calcDuration(dur, 90, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// bounceOut (duration × 0.75)
// ================================================================
export function bounceOut(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t20: AnimTransform = new AnimTransform();
  t20.scaleX = 0.9;
  t20.scaleY = 0.9;

  const t50: AnimTransform = new AnimTransform();
  t50.scaleX = 1.1;
  t50.scaleY = 1.1;
  t50.opacity = 1;

  const t55: AnimTransform = new AnimTransform();
  t55.scaleX = 1.1;
  t55.scaleY = 1.1;
  t55.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 0.3;
  t100.scaleY = 0.3;
  t100.opacity = 0;

  return [
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 50), curve: Curve.Linear, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 55), curve: Curve.Linear, event: makeUpdater(updater, t55) },
    { duration: calcDuration(dur, 55, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// bounceOutDown
// ================================================================
export function bounceOutDown(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t20: AnimTransform = new AnimTransform();
  t20.translateY = 10;
  t20.scaleY = 0.985;

  const t40: AnimTransform = new AnimTransform();
  t40.translateY = -20;
  t40.scaleY = 0.9;
  t40.opacity = 1;

  const t45: AnimTransform = new AnimTransform();
  t45.translateY = -20;
  t45.scaleY = 0.9;
  t45.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 2000;
  t100.scaleY = 3;
  t100.opacity = 0;

  return [
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 40), curve: Curve.Linear, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 45), curve: Curve.Linear, event: makeUpdater(updater, t45) },
    { duration: calcDuration(dur, 45, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// bounceOutLeft
// ================================================================
export function bounceOutLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t20: AnimTransform = new AnimTransform();
  t20.translateX = 20;
  t20.scaleX = 0.9;
  t20.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = -2000;
  t100.scaleX = 2;
  t100.opacity = 0;

  return [
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// bounceOutRight
// ================================================================
export function bounceOutRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t20: AnimTransform = new AnimTransform();
  t20.translateX = -20;
  t20.scaleX = 0.9;
  t20.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 2000;
  t100.scaleX = 2;
  t100.opacity = 0;

  return [
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// bounceOutUp
// ================================================================
export function bounceOutUp(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t20: AnimTransform = new AnimTransform();
  t20.translateY = -10;
  t20.scaleY = 0.985;

  const t40: AnimTransform = new AnimTransform();
  t40.translateY = 20;
  t40.scaleY = 0.9;
  t40.opacity = 1;

  const t45: AnimTransform = new AnimTransform();
  t45.translateY = 20;
  t45.scaleY = 0.9;
  t45.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = -2000;
  t100.scaleY = 3;
  t100.opacity = 0;

  return [
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 40), curve: Curve.Linear, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 45), curve: Curve.Linear, event: makeUpdater(updater, t45) },
    { duration: calcDuration(dur, 45, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}
