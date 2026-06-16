import { AnimTransform, AnimKeyframeOptions } from './types';
import { calcDuration, makeUpdater } from './internal';

// ================================================================
// fadeOut
// ================================================================
export function fadeOut(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutDown
// ================================================================
export function fadeOutDown(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 100;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutDownBig
// ================================================================
export function fadeOutDownBig(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 2000;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutLeft
// ================================================================
export function fadeOutLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = -100;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutLeftBig
// ================================================================
export function fadeOutLeftBig(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = -2000;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutRight
// ================================================================
export function fadeOutRight(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 100;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutRightBig
// ================================================================
export function fadeOutRightBig(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 2000;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutUp
// ================================================================
export function fadeOutUp(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = -100;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutUpBig
// ================================================================
export function fadeOutUpBig(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = -2000;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutTopLeft
// ================================================================
export function fadeOutTopLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.translateY = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = -100;
  t100.translateY = -100;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutTopRight
// ================================================================
export function fadeOutTopRight(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.translateY = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 100;
  t100.translateY = -100;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutBottomRight
// ================================================================
export function fadeOutBottomRight(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.translateY = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 100;
  t100.translateY = 100;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// fadeOutBottomLeft
// ================================================================
export function fadeOutBottomLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimKeyframeOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.translateY = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = -100;
  t100.translateY = 100;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}
