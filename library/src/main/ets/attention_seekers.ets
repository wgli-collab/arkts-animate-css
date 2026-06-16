import { AnimTransform, AnimOptions } from './types';
import { calcDuration, makeUpdater } from './internal';

// ================================================================
// bounce
// ================================================================
export function bounce(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 0;
  t0.scaleY = 1;

  const t20: AnimTransform = new AnimTransform();
  t20.translateY = 0;
  t20.scaleY = 1;

  const t40: AnimTransform = new AnimTransform();
  t40.translateY = -30;
  t40.scaleY = 1.1;

  const t43: AnimTransform = new AnimTransform();
  t43.translateY = -30;
  t43.scaleY = 1.1;

  const t53: AnimTransform = new AnimTransform();
  t53.translateY = 0;
  t53.scaleY = 1;

  const t70: AnimTransform = new AnimTransform();
  t70.translateY = -15;
  t70.scaleY = 1.05;

  const t80: AnimTransform = new AnimTransform();
  t80.translateY = 0;
  t80.scaleY = 0.95;

  const t90: AnimTransform = new AnimTransform();
  t90.translateY = -4;
  t90.scaleY = 1.02;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;
  t100.scaleY = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 20), curve: Curve.Ease, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 40), curve: Curve.Ease, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 43), curve: Curve.Ease, event: makeUpdater(updater, t43) },
    { duration: calcDuration(dur, 43, 53), curve: Curve.Ease, event: makeUpdater(updater, t53) },
    { duration: calcDuration(dur, 53, 70), curve: Curve.Ease, event: makeUpdater(updater, t70) },
    { duration: calcDuration(dur, 70, 80), curve: Curve.Ease, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 90), curve: Curve.Ease, event: makeUpdater(updater, t90) },
    { duration: calcDuration(dur, 90, 100), curve: Curve.Ease, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// flash
// ================================================================
export function flash(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.opacity = 1;

  const t25: AnimTransform = new AnimTransform();
  t25.opacity = 0;

  const t50: AnimTransform = new AnimTransform();
  t50.opacity = 1;

  const t75: AnimTransform = new AnimTransform();
  t75.opacity = 0;

  const t100: AnimTransform = new AnimTransform();
  t100.opacity = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 25), curve: Curve.Linear, event: makeUpdater(updater, t25) },
    { duration: calcDuration(dur, 25, 50), curve: Curve.Linear, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 75), curve: Curve.Linear, event: makeUpdater(updater, t75) },
    { duration: calcDuration(dur, 75, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// pulse
// ================================================================
export function pulse(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 1;
  t0.scaleY = 1;

  const t50: AnimTransform = new AnimTransform();
  t50.scaleX = 1.05;
  t50.scaleY = 1.05;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;

  return [
    { duration: 0, curve: Curve.EaseInOut, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 50), curve: Curve.EaseInOut, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 100), curve: Curve.EaseInOut, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// rubberBand
// ================================================================
export function rubberBand(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 1;
  t0.scaleY = 1;

  const t30: AnimTransform = new AnimTransform();
  t30.scaleX = 1.25;
  t30.scaleY = 0.75;

  const t40: AnimTransform = new AnimTransform();
  t40.scaleX = 0.75;
  t40.scaleY = 1.25;

  const t50: AnimTransform = new AnimTransform();
  t50.scaleX = 1.15;
  t50.scaleY = 0.85;

  const t65: AnimTransform = new AnimTransform();
  t65.scaleX = 0.95;
  t65.scaleY = 1.05;

  const t75: AnimTransform = new AnimTransform();
  t75.scaleX = 1.05;
  t75.scaleY = 0.95;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 30), curve: Curve.Linear, event: makeUpdater(updater, t30) },
    { duration: calcDuration(dur, 30, 40), curve: Curve.Linear, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 50), curve: Curve.Linear, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 65), curve: Curve.Linear, event: makeUpdater(updater, t65) },
    { duration: calcDuration(dur, 65, 75), curve: Curve.Linear, event: makeUpdater(updater, t75) },
    { duration: calcDuration(dur, 75, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// shakeX
// ================================================================
export function shakeX(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;

  const t10: AnimTransform = new AnimTransform();
  t10.translateX = -10;

  const t20: AnimTransform = new AnimTransform();
  t20.translateX = 10;

  const t30: AnimTransform = new AnimTransform();
  t30.translateX = -10;

  const t40: AnimTransform = new AnimTransform();
  t40.translateX = 10;

  const t50: AnimTransform = new AnimTransform();
  t50.translateX = -10;

  const t60: AnimTransform = new AnimTransform();
  t60.translateX = 10;

  const t70: AnimTransform = new AnimTransform();
  t70.translateX = -10;

  const t80: AnimTransform = new AnimTransform();
  t80.translateX = 10;

  const t90: AnimTransform = new AnimTransform();
  t90.translateX = -10;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 10), curve: Curve.Linear, event: makeUpdater(updater, t10) },
    { duration: calcDuration(dur, 10, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 30), curve: Curve.Linear, event: makeUpdater(updater, t30) },
    { duration: calcDuration(dur, 30, 40), curve: Curve.Linear, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 50), curve: Curve.Linear, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 60), curve: Curve.Linear, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 70), curve: Curve.Linear, event: makeUpdater(updater, t70) },
    { duration: calcDuration(dur, 70, 80), curve: Curve.Linear, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 90), curve: Curve.Linear, event: makeUpdater(updater, t90) },
    { duration: calcDuration(dur, 90, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// shakeY
// ================================================================
export function shakeY(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateY = 0;

  const t10: AnimTransform = new AnimTransform();
  t10.translateY = -10;

  const t20: AnimTransform = new AnimTransform();
  t20.translateY = 10;

  const t30: AnimTransform = new AnimTransform();
  t30.translateY = -10;

  const t40: AnimTransform = new AnimTransform();
  t40.translateY = 10;

  const t50: AnimTransform = new AnimTransform();
  t50.translateY = -10;

  const t60: AnimTransform = new AnimTransform();
  t60.translateY = 10;

  const t70: AnimTransform = new AnimTransform();
  t70.translateY = -10;

  const t80: AnimTransform = new AnimTransform();
  t80.translateY = 10;

  const t90: AnimTransform = new AnimTransform();
  t90.translateY = -10;

  const t100: AnimTransform = new AnimTransform();
  t100.translateY = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 10), curve: Curve.Linear, event: makeUpdater(updater, t10) },
    { duration: calcDuration(dur, 10, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 30), curve: Curve.Linear, event: makeUpdater(updater, t30) },
    { duration: calcDuration(dur, 30, 40), curve: Curve.Linear, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 50), curve: Curve.Linear, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 60), curve: Curve.Linear, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 70), curve: Curve.Linear, event: makeUpdater(updater, t70) },
    { duration: calcDuration(dur, 70, 80), curve: Curve.Linear, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 90), curve: Curve.Linear, event: makeUpdater(updater, t90) },
    { duration: calcDuration(dur, 90, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// headShake
// ================================================================
export function headShake(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.rotateZ = 0;

  const t6_5: AnimTransform = new AnimTransform();
  t6_5.translateX = -6;
  t6_5.rotateZ = -9;

  const t18_5: AnimTransform = new AnimTransform();
  t18_5.translateX = 5;
  t18_5.rotateZ = 7;

  const t31_5: AnimTransform = new AnimTransform();
  t31_5.translateX = -3;
  t31_5.rotateZ = -5;

  const t43_5: AnimTransform = new AnimTransform();
  t43_5.translateX = 2;
  t43_5.rotateZ = 3;

  const t50: AnimTransform = new AnimTransform();
  t50.translateX = 0;
  t50.rotateZ = 0;

  return [
    { duration: 0, curve: Curve.EaseInOut, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 6.5), curve: Curve.EaseInOut, event: makeUpdater(updater, t6_5) },
    { duration: calcDuration(dur, 6.5, 18.5), curve: Curve.EaseInOut, event: makeUpdater(updater, t18_5) },
    { duration: calcDuration(dur, 18.5, 31.5), curve: Curve.EaseInOut, event: makeUpdater(updater, t31_5) },
    { duration: calcDuration(dur, 31.5, 43.5), curve: Curve.EaseInOut, event: makeUpdater(updater, t43_5) },
    { duration: calcDuration(dur, 43.5, 50), curve: Curve.EaseInOut, event: makeUpdater(updater, t50) }
  ];
}

// ================================================================
// swing
// ================================================================
export function swing(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t20: AnimTransform = new AnimTransform();
  t20.rotateZ = 15;

  const t40: AnimTransform = new AnimTransform();
  t40.rotateZ = -10;

  const t60: AnimTransform = new AnimTransform();
  t60.rotateZ = 5;

  const t80: AnimTransform = new AnimTransform();
  t80.rotateZ = -5;

  const t100: AnimTransform = new AnimTransform();
  t100.rotateZ = 0;

  return [
    // CSS swing has no from/0% keyframe (first at 20%).
    // Add a zero-duration anchor at 0% to establish the starting state.
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, new AnimTransform()) },
    { duration: calcDuration(dur, 0, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 40), curve: Curve.Linear, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 60), curve: Curve.Linear, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 80), curve: Curve.Linear, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// tada
// ================================================================
export function tada(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 1;
  t0.scaleY = 1;
  t0.rotateZ = 0;

  const t10: AnimTransform = new AnimTransform();
  t10.scaleX = 0.9;
  t10.scaleY = 0.9;
  t10.rotateZ = -3;

  const t20: AnimTransform = new AnimTransform();
  t20.scaleX = 0.9;
  t20.scaleY = 0.9;
  t20.rotateZ = -3;

  const t30: AnimTransform = new AnimTransform();
  t30.scaleX = 1.1;
  t30.scaleY = 1.1;
  t30.rotateZ = 3;

  const t40: AnimTransform = new AnimTransform();
  t40.scaleX = 1.1;
  t40.scaleY = 1.1;
  t40.rotateZ = -3;

  const t50: AnimTransform = new AnimTransform();
  t50.scaleX = 1.1;
  t50.scaleY = 1.1;
  t50.rotateZ = 3;

  const t60: AnimTransform = new AnimTransform();
  t60.scaleX = 1.1;
  t60.scaleY = 1.1;
  t60.rotateZ = -3;

  const t70: AnimTransform = new AnimTransform();
  t70.scaleX = 1.1;
  t70.scaleY = 1.1;
  t70.rotateZ = 3;

  const t80: AnimTransform = new AnimTransform();
  t80.scaleX = 1.1;
  t80.scaleY = 1.1;
  t80.rotateZ = -3;

  const t90: AnimTransform = new AnimTransform();
  t90.scaleX = 1.1;
  t90.scaleY = 1.1;
  t90.rotateZ = 3;

  const t100: AnimTransform = new AnimTransform();
  t100.scaleX = 1;
  t100.scaleY = 1;
  t100.rotateZ = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 10), curve: Curve.Linear, event: makeUpdater(updater, t10) },
    { duration: calcDuration(dur, 10, 20), curve: Curve.Linear, event: makeUpdater(updater, t20) },
    { duration: calcDuration(dur, 20, 30), curve: Curve.Linear, event: makeUpdater(updater, t30) },
    { duration: calcDuration(dur, 30, 40), curve: Curve.Linear, event: makeUpdater(updater, t40) },
    { duration: calcDuration(dur, 40, 50), curve: Curve.Linear, event: makeUpdater(updater, t50) },
    { duration: calcDuration(dur, 50, 60), curve: Curve.Linear, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 70), curve: Curve.Linear, event: makeUpdater(updater, t70) },
    { duration: calcDuration(dur, 70, 80), curve: Curve.Linear, event: makeUpdater(updater, t80) },
    { duration: calcDuration(dur, 80, 90), curve: Curve.Linear, event: makeUpdater(updater, t90) },
    { duration: calcDuration(dur, 90, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// wobble
// ================================================================
export function wobble(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.translateX = 0;
  t0.rotateZ = 0;

  const t15: AnimTransform = new AnimTransform();
  t15.translateX = -25;
  t15.rotateZ = -5;

  const t30: AnimTransform = new AnimTransform();
  t30.translateX = 20;
  t30.rotateZ = 3;

  const t45: AnimTransform = new AnimTransform();
  t45.translateX = -15;
  t45.rotateZ = -3;

  const t60: AnimTransform = new AnimTransform();
  t60.translateX = 10;
  t60.rotateZ = 2;

  const t75: AnimTransform = new AnimTransform();
  t75.translateX = -5;
  t75.rotateZ = -1;

  const t100: AnimTransform = new AnimTransform();
  t100.translateX = 0;
  t100.rotateZ = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 15), curve: Curve.Linear, event: makeUpdater(updater, t15) },
    { duration: calcDuration(dur, 15, 30), curve: Curve.Linear, event: makeUpdater(updater, t30) },
    { duration: calcDuration(dur, 30, 45), curve: Curve.Linear, event: makeUpdater(updater, t45) },
    { duration: calcDuration(dur, 45, 60), curve: Curve.Linear, event: makeUpdater(updater, t60) },
    { duration: calcDuration(dur, 60, 75), curve: Curve.Linear, event: makeUpdater(updater, t75) },
    { duration: calcDuration(dur, 75, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// jello
// ================================================================
export function jello(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.skewX = 0;
  t0.skewY = 0;

  const t11_1: AnimTransform = new AnimTransform();
  t11_1.skewX = 0;
  t11_1.skewY = 0;

  const t22_2: AnimTransform = new AnimTransform();
  t22_2.skewX = -12.5;
  t22_2.skewY = -12.5;

  const t33_3: AnimTransform = new AnimTransform();
  t33_3.skewX = 6.25;
  t33_3.skewY = 6.25;

  const t44_4: AnimTransform = new AnimTransform();
  t44_4.skewX = -3.125;
  t44_4.skewY = -3.125;

  const t55_5: AnimTransform = new AnimTransform();
  t55_5.skewX = 1.5625;
  t55_5.skewY = 1.5625;

  const t66_6: AnimTransform = new AnimTransform();
  t66_6.skewX = -0.78125;
  t66_6.skewY = -0.78125;

  const t77_7: AnimTransform = new AnimTransform();
  t77_7.skewX = 0.390625;
  t77_7.skewY = 0.390625;

  const t88_8: AnimTransform = new AnimTransform();
  t88_8.skewX = -0.1953125;
  t88_8.skewY = -0.1953125;

  const t100: AnimTransform = new AnimTransform();
  t100.skewX = 0;
  t100.skewY = 0;

  return [
    { duration: 0, curve: Curve.Linear, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 11.1), curve: Curve.Linear, event: makeUpdater(updater, t11_1) },
    { duration: calcDuration(dur, 11.1, 22.2), curve: Curve.Linear, event: makeUpdater(updater, t22_2) },
    { duration: calcDuration(dur, 22.2, 33.3), curve: Curve.Linear, event: makeUpdater(updater, t33_3) },
    { duration: calcDuration(dur, 33.3, 44.4), curve: Curve.Linear, event: makeUpdater(updater, t44_4) },
    { duration: calcDuration(dur, 44.4, 55.5), curve: Curve.Linear, event: makeUpdater(updater, t55_5) },
    { duration: calcDuration(dur, 55.5, 66.6), curve: Curve.Linear, event: makeUpdater(updater, t66_6) },
    { duration: calcDuration(dur, 66.6, 77.7), curve: Curve.Linear, event: makeUpdater(updater, t77_7) },
    { duration: calcDuration(dur, 77.7, 88.8), curve: Curve.Linear, event: makeUpdater(updater, t88_8) },
    { duration: calcDuration(dur, 88.8, 100), curve: Curve.Linear, event: makeUpdater(updater, t100) }
  ];
}

// ================================================================
// heartBeat
// ================================================================
// NOTE: CSS sets animation-duration: calc(var(--animate-duration) * 1.3) for heartBeat.
// To match web behavior, pass duration * 1.3.
export function heartBeat(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[] {
  const dur: number = options.duration;

  const t0: AnimTransform = new AnimTransform();
  t0.scaleX = 1;
  t0.scaleY = 1;

  const t14: AnimTransform = new AnimTransform();
  t14.scaleX = 1.3;
  t14.scaleY = 1.3;

  const t28: AnimTransform = new AnimTransform();
  t28.scaleX = 1;
  t28.scaleY = 1;

  const t42: AnimTransform = new AnimTransform();
  t42.scaleX = 1.3;
  t42.scaleY = 1.3;

  const t70: AnimTransform = new AnimTransform();
  t70.scaleX = 1;
  t70.scaleY = 1;

  return [
    { duration: 0, curve: Curve.EaseInOut, event: makeUpdater(updater, t0) },
    { duration: calcDuration(dur, 0, 14), curve: Curve.EaseInOut, event: makeUpdater(updater, t14) },
    { duration: calcDuration(dur, 14, 28), curve: Curve.EaseInOut, event: makeUpdater(updater, t28) },
    { duration: calcDuration(dur, 28, 42), curve: Curve.EaseInOut, event: makeUpdater(updater, t42) },
    { duration: calcDuration(dur, 42, 70), curve: Curve.EaseInOut, event: makeUpdater(updater, t70) }
  ];
}
