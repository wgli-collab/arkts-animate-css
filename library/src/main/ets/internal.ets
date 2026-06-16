import { AnimTransform } from './types';

/**
 * Compute a keyframe segment duration from CSS percentage positions.
 * duration = totalDuration * (currentPercent - prevPercent) / 100
 *
 * The caller must ensure totalDuration > 0 and currentPercent > prevPercent.
 * Negative or zero durations will be passed through to allow the ArkUI
 * framework to handle edge cases.
 */
export function calcDuration(totalDuration: number, prevPercent: number, currentPercent: number): number {
  return totalDuration * (currentPercent - prevPercent) / 100;
}

/**
 * Create a zero-argument event callback that invokes updater(transform).
 * Used as the event property of KeyframeState entries.
 *
 * The caller must ensure updater is non-null — passing null will cause
 * a runtime crash when the animation framework invokes the event callback.
 */
export function makeUpdater(
  updater: (transform: AnimTransform) => void,
  transform: AnimTransform
): () => void {
  return (): void => {
    updater(transform);
  };
}
