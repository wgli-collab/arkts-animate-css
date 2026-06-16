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
// zoomIn
// ================================================================
export function zoomIn(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 0.3;
  t0.scaleY = 0.3;
  t0.opacity = 0;

  const t50: AnimTransform = new AnimTransform();
  t50.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 50), curve: Curve.Linear, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// zoomInDown
// ================================================================
export function zoomInDown(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 0.1;
  t0.scaleY = 0.1;
  t0.translateY = -1000;
  t0.opacity = 0;

  const t60: AnimTransform = new AnimTransform();
  t60.scaleX = 0.475;
  t60.scaleY = 0.475;
  t60.translateY = 60;
  t60.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Ease, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.Ease, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// zoomInLeft
// ================================================================
export function zoomInLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 0.1;
  t0.scaleY = 0.1;
  t0.translateX = -1000;
  t0.opacity = 0;

  const t60: AnimTransform = new AnimTransform();
  t60.scaleX = 0.475;
  t60.scaleY = 0.475;
  t60.translateX = 10;
  t60.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.translateX = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Ease, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.Ease, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// zoomInRight
// ================================================================
export function zoomInRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 0.1;
  t0.scaleY = 0.1;
  t0.translateX = 1000;
  t0.opacity = 0;

  const t60: AnimTransform = new AnimTransform();
  t60.scaleX = 0.475;
  t60.scaleY = 0.475;
  t60.translateX = -10;
  t60.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.translateX = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Ease, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.Ease, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// zoomInUp
// ================================================================
export function zoomInUp(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 0.1;
  t0.scaleY = 0.1;
  t0.translateY = 1000;
  t0.opacity = 0;

  const t60: AnimTransform = new AnimTransform();
  t60.scaleX = 0.475;
  t60.scaleY = 0.475;
  t60.translateY = -60;
  t60.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.translateY = 0;
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Ease, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 60), curve: Curve.Ease, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// zoomOut
// ================================================================
export function zoomOut(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.opacity = 1;

  const t50: AnimTransform = new AnimTransform();
  t50.scaleX = 0.3;
  t50.scaleY = 0.3;
  t50.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.opacity = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 50), curve: Curve.Linear, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// zoomOutDown
// ================================================================
export function zoomOutDown(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t40: AnimTransform = new AnimTransform();
  t40.scaleX = 0.475;
  t40.scaleY = 0.475;
  t40.translateY = -60;
  t40.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 0.1;
  t100.scaleY = 0.1;
  t100.translateY = 2000;
  t100.opacity = 0;

  return [
    { duration: calcDuration(dur, 0, 40), curve: Curve.Ease, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// zoomOutLeft
// ================================================================
export function zoomOutLeft(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t40: AnimTransform = new AnimTransform();
  t40.scaleX = 0.475;
  t40.scaleY = 0.475;
  t40.translateX = 42;
  t40.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 0.1;
  t100.scaleY = 0.1;
  t100.translateX = -2000;
  t100.opacity = 0;

  return [
    { duration: calcDuration(dur, 0, 40), curve: Curve.Ease, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// zoomOutRight
// ================================================================
export function zoomOutRight(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t40: AnimTransform = new AnimTransform();
  t40.scaleX = 0.475;
  t40.scaleY = 0.475;
  t40.translateX = -42;
  t40.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 0.1;
  t100.scaleY = 0.1;
  t100.translateX = 2000;
  t100.opacity = 0;

  return [
    { duration: calcDuration(dur, 0, 40), curve: Curve.Ease, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// zoomOutUp
// ================================================================
export function zoomOutUp(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t40: AnimTransform = new AnimTransform();
  t40.scaleX = 0.475;
  t40.scaleY = 0.475;
  t40.translateY = 60;
  t40.opacity = 1;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 0.1;
  t100.scaleY = 0.1;
  t100.translateY = -2000;
  t100.opacity = 0;

  return [
    { duration: calcDuration(dur, 0, 40), curve: Curve.Ease, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}
