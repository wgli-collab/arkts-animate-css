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
// rotateIn
// ================================================================
export function rotateIn(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = -200;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rotateInDownLeft
// ================================================================
export function rotateInDownLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = -45;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rotateInDownRight
// ================================================================
export function rotateInDownRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 45;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rotateInUpLeft
// ================================================================
export function rotateInUpLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 45;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rotateInUpRight
// ================================================================
export function rotateInUpRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = -90;
  t0.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rotateOut
// ================================================================
export function rotateOut(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 200;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rotateOutDownLeft
// ================================================================
export function rotateOutDownLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 45;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rotateOutDownRight
// ================================================================
export function rotateOutDownRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = -45;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rotateOutUpLeft
// ================================================================
export function rotateOutUpLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = -45;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rotateOutUpRight
// ================================================================
export function rotateOutUpRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 0;
  t0.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 90;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}
