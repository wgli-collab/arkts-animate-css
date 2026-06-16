import { AnimTransform } from './types';

/**
 * Compute a keyframe segment duration from CSS percentage positions.
 * duration = totalDuration * (currentPercent - prevPercent) / 100
 *
 * Guards against invalid inputs: non-positive totalDuration, NaN, Infinity,
 * and reversed percentages all clamp to 0 to avoid corrupting the keyframe array.
 */
export function calcDuration(totalDuration: number, prevPercent: number, currentPercent: number): number {
  if (totalDuration <= 0 || !isFinite(totalDuration) || currentPercent <= prevPercent) {
    return 0;
  }
  return totalDuration * (currentPercent - prevPercent) / 100;
}

/**
 * Create a zero-argument event callback that invokes updater(transform).
 * Used as the event property of KeyframeState entries.
 *
 * Guards against null/undefined updater — throws early (fail-fast) rather
 * than crashing later when the animation framework invokes the callback.
 */
export function makeUpdater(
  updater: (transform: AnimTransform) => void,
  transform: AnimTransform
): () => void {
  if (typeof updater !== 'function') {
    throw new Error('makeUpdater: updater must be a function');
  }
  return (): void => {
    updater(transform);
  };
}
