import { AnimTransform, AnimKeyframeOptions } from './types';
import { calcDuration, makeUpdater } from './internal';

// ================================================================
// fadeIn
// ================================================================
export function fadeIn(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInDown
// ================================================================
export function fadeInDown(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = -100;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInDownBig
// ================================================================
export function fadeInDownBig(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = -2000;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInLeft
// ================================================================
export function fadeInLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = -100;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInLeftBig
// ================================================================
export function fadeInLeftBig(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = -2000;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInRight
// ================================================================
export function fadeInRight(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 100;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInRightBig
// ================================================================
export function fadeInRightBig(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 2000;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInUp
// ================================================================
export function fadeInUp(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 100;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInUpBig
// ================================================================
export function fadeInUpBig(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 2000;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInTopLeft
// ================================================================
export function fadeInTopLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = -100;
  t0.translateY = -100;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInTopRight
// ================================================================
export function fadeInTopRight(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 100;
  t0.translateY = -100;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInBottomLeft
// ================================================================
export function fadeInBottomLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = -100;
  t0.translateY = 100;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeInBottomRight
// ================================================================
export function fadeInBottomRight(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 100;
  t0.translateY = 100;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}
