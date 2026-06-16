import { AnimTransform, AnimOptions } from './types';
import { calcDuration, makeUpdater } from './internal';

// NOTE: Original CSS uses 3D transforms (perspective, rotateX, rotateY, translateZ).
// ArkUI has limited 3D support — rotateX/rotateY are approximated via rotateZ.
// The visual effect will differ from CSS originals; this is a documented limitation.

// ================================================================
// flip (rotateY approximated via rotateZ)
// ================================================================
export function flip(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 1;
  t0.scaleY = 1;
  t0.rotateZ = -360;

  const t40: AnimTransform = new AnimTransform();
  t40.scaleX = 1;
  t40.scaleY = 1;
  t40.rotateZ = -190;

  const t50: AnimTransform = new AnimTransform();
  t50.scaleX = 1;
  t50.scaleY = 1;
  t50.rotateZ = -170;

  const t80: AnimTransform = new AnimTransform();
  t80.scaleX = 0.95;
  t80.scaleY = 0.95;
  t80.rotateZ = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.rotateZ = 0;

  return [
    { duration: 0, curve: Curve.EaseOut, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 40), curve: Curve.EaseOut, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 50), curve: Curve.EaseIn, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 80), curve: Curve.EaseIn, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.EaseIn, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// flipInX (rotateX approximated via rotateZ + scaleX compression)
// rotateX makes the element appear to narrow as it rotates around X axis.
// We simulate this by reducing scaleX at the "edge-on" angles.
// ================================================================
export function flipInX(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 90;
  t0.scaleX = 0.2;
  t0.opacity = 0;

  const t40: AnimTransform = new AnimTransform();
  t40.rotateZ = -20;
  t40.scaleX = 0.8;

  const t60: AnimTransform = new AnimTransform();
  t60.rotateZ = 10;
  t60.scaleX = 0.95;
  t60.opacity = 1;

  const t80: AnimTransform = new AnimTransform();
  t80.rotateZ = -5;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 0;
  t100.scaleX = 1;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.EaseIn, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 40), curve: Curve.EaseIn, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 60), curve: Curve.EaseIn, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 80), curve: Curve.EaseIn, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.EaseIn, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// flipInY (rotateY approximated via rotateZ + scaleY compression)
// rotateY makes the element appear to narrow as it rotates around Y axis.
// We simulate this by reducing scaleY at the "edge-on" angles.
// ================================================================
export function flipInY(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 90;
  t0.scaleY = 0.2;
  t0.opacity = 0;

  const t40: AnimTransform = new AnimTransform();
  t40.rotateZ = -20;
  t40.scaleY = 0.8;

  const t60: AnimTransform = new AnimTransform();
  t60.rotateZ = 10;
  t60.scaleY = 0.95;
  t60.opacity = 1;

  const t80: AnimTransform = new AnimTransform();
  t80.rotateZ = -5;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 0;
  t100.scaleY = 1;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.EaseIn, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 40), curve: Curve.EaseIn, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 60), curve: Curve.EaseIn, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 80), curve: Curve.EaseIn, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.EaseIn, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// flipOutX (rotateX approximated via rotateZ + scaleX compression, duration × 0.75)
// ================================================================
export function flipOutX(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 0;
  t0.scaleX = 1;

  const t30: AnimTransform = new AnimTransform();
  t30.rotateZ = -20;
  t30.scaleX = 0.8;
  t30.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 90;
  t100.scaleX = 0.2;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 30), curve: Curve.Linear, event: makeUpdater(updater, t30) },
    { duration: calcDuration(dur, 30, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// flipOutY (rotateY approximated via rotateZ + scaleY compression, duration × 0.75)
// ================================================================
export function flipOutY(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.rotateZ = 0;
  t0.scaleY = 1;

  const t30: AnimTransform = new AnimTransform();
  t30.rotateZ = -15;
  t30.scaleY = 0.8;
  t30.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 90;
  t100.scaleY = 0.2;
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 30), curve: Curve.Linear, event: makeUpdater(updater, t30) },
    { duration: calcDuration(dur, 30, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}
