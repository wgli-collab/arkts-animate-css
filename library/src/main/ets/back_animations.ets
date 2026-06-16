import { AnimTransform, AnimOptions } from './types';
import { calcDuration, makeUpdater } from './internal';

// ================================================================
// backInDown
// ================================================================
export function backInDown(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = -1200;
  t0.scaleX = 0.7;
  t0.scaleY = 0.7;
  t0.opacity = 0.7;

  const t80: AnimTransform = new AnimTransform();
  t80.translateY = 0;
  t80.scaleX = 0.7;
  t80.scaleY = 0.7;
  t80.opacity = 0.7;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 80), curve: Curve.Linear, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// backInLeft
// ================================================================
export function backInLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = -2000;
  t0.scaleX = 0.7;
  t0.scaleY = 0.7;
  t0.opacity = 0.7;

  const t80: AnimTransform = new AnimTransform();
  t80.translateX = 0;
  t80.scaleX = 0.7;
  t80.scaleY = 0.7;
  t80.opacity = 0.7;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 80), curve: Curve.Linear, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// backInRight
// ================================================================
export function backInRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 2000;
  t0.scaleX = 0.7;
  t0.scaleY = 0.7;
  t0.opacity = 0.7;

  const t80: AnimTransform = new AnimTransform();
  t80.translateX = 0;
  t80.scaleX = 0.7;
  t80.scaleY = 0.7;
  t80.opacity = 0.7;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 80), curve: Curve.Linear, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// backInUp
// ================================================================
export function backInUp(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 1200;
  t0.scaleX = 0.7;
  t0.scaleY = 0.7;
  t0.opacity = 0.7;

  const t80: AnimTransform = new AnimTransform();
  t80.translateY = 0;
  t80.scaleX = 0.7;
  t80.scaleY = 0.7;
  t80.opacity = 0.7;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 80), curve: Curve.Linear, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// backOutDown
// ================================================================
export function backOutDown(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 0;
  t0.scaleX = 1;
  t0.scaleY = 1;
  t0.opacity = 1;

  const t20: AnimTransform = new AnimTransform();
  t20.translateY = 0;
  t20.scaleX = 0.7;
  t20.scaleY = 0.7;
  t20.opacity = 0.7;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 700;
  t100.scaleX = 0.7;
  t100.scaleY = 0.7;
  t100.opacity = 0.7;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// backOutLeft
// ================================================================
export function backOutLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.scaleX = 1;
  t0.scaleY = 1;
  t0.opacity = 1;

  const t20: AnimTransform = new AnimTransform();
  t20.translateX = 0;
  t20.scaleX = 0.7;
  t20.scaleY = 0.7;
  t20.opacity = 0.7;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = -2000;
  t100.scaleX = 0.7;
  t100.scaleY = 0.7;
  t100.opacity = 0.7;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// backOutRight
// ================================================================
export function backOutRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.scaleX = 1;
  t0.scaleY = 1;
  t0.opacity = 1;

  const t20: AnimTransform = new AnimTransform();
  t20.translateX = 0;
  t20.scaleX = 0.7;
  t20.scaleY = 0.7;
  t20.opacity = 0.7;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 2000;
  t100.scaleX = 0.7;
  t100.scaleY = 0.7;
  t100.opacity = 0.7;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// backOutUp
// ================================================================
export function backOutUp(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 0;
  t0.scaleX = 1;
  t0.scaleY = 1;
  t0.opacity = 1;

  const t20: AnimTransform = new AnimTransform();
  t20.translateY = 0;
  t20.scaleX = 0.7;
  t20.scaleY = 0.7;
  t20.opacity = 0.7;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = -700;
  t100.scaleX = 0.7;
  t100.scaleY = 0.7;
  t100.opacity = 0.7;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}
