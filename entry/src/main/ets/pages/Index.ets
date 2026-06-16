import {
  AnimTransform,
  AnimKeyframeOptions,
  AnimOptions,
  bounce,
  flash,
  pulse,
  rubberBand,
  shakeX,
  shakeY,
  headShake,
  swing,
  tada,
  wobble,
  jello,
  heartBeat,
  backInDown,
  backInLeft,
  backInRight,
  backInUp,
  backOutDown,
  backOutLeft,
  backOutRight,
  backOutUp,
  bounceIn,
  bounceInDown,
  bounceInLeft,
  bounceInRight,
  bounceInUp,
  bounceOut,
  bounceOutDown,
  bounceOutLeft,
  bounceOutRight,
  bounceOutUp,
  fadeIn,
  fadeInDown,
  fadeInDownBig,
  fadeInLeft,
  fadeInLeftBig,
  fadeInRight,
  fadeInRightBig,
  fadeInUp,
  fadeInUpBig,
  fadeInTopLeft,
  fadeInTopRight,
  fadeInBottomLeft,
  fadeInBottomRight,
  fadeOut,
  fadeOutDown,
  fadeOutDownBig,
  fadeOutLeft,
  fadeOutLeftBig,
  fadeOutRight,
  fadeOutRightBig,
  fadeOutUp,
  fadeOutUpBig,
  fadeOutTopLeft,
  fadeOutTopRight,
  fadeOutBottomRight,
  fadeOutBottomLeft,
  flip,
  flipInX,
  flipInY,
  flipOutX,
  flipOutY,
  lightSpeedInRight,
  lightSpeedInLeft,
  lightSpeedOutRight,
  lightSpeedOutLeft,
  rotateIn,
  rotateInDownLeft,
  rotateInDownRight,
  rotateInUpLeft,
  rotateInUpRight,
  rotateOut,
  rotateOutDownLeft,
  rotateOutDownRight,
  rotateOutUpLeft,
  rotateOutUpRight,
  slideInDown,
  slideInLeft,
  slideInRight,
  slideInUp,
  slideOutDown,
  slideOutLeft,
  slideOutRight,
  slideOutUp,
  hinge,
  jackInTheBox,
  rollIn,
  rollOut,
  zoomIn,
  zoomInDown,
  zoomInLeft,
  zoomInRight,
  zoomInUp,
  zoomOut,
  zoomOutDown,
  zoomOutLeft,
  zoomOutRight,
  zoomOutUp
} from 'library';

// Test result data class
class TestResult {
  name: string = '';
  passed: boolean = false;
  error: string = '';
}

/**
 * Helper: validate a KeyframeState[] returned from any animation function.
 * Calls each event callback to verify no exceptions occur.
 * Returns empty string on success, error message on failure.
 */
function validateFrames(frames: KeyframeState[], fnName: string): string {
  if (frames.length === 0) {
    return fnName + ': returned empty keyframe array';
  }
  // Call every event callback — they must not throw.
  // Note: first keyframe duration may be > 0 when the CSS @keyframes
  // does not define a 0%/from keyframe (e.g. swing starts at 20%, zoomOutDown at 40%).
  for (let i: number = 0; i < frames.length; i++) {
    const s: KeyframeState = frames[i];
    s.event();
  }
  return '';
}

/**
 * Helper: run a standard animation test.
 * Passes a minimal no-op updater (lambda as direct callback argument — R10 compliant).
 */
function runTest(fnName: string, fn: (updater: (t: AnimTransform) => void, opts: AnimKeyframeOptions) => KeyframeState[]): TestResult {
  const result: TestResult = { name: fnName, passed: false, error: '' };
  const options: AnimOptions = { duration: 1000 };
  const frames: KeyframeState[] = fn((t: AnimTransform): void => {}, options);
  const err: string = validateFrames(frames, fnName);
  if (err.length > 0) {
    result.error = err;
    return result;
  }
  result.passed = true;
  return result;
}

/**
 * Helper: run a test with custom options (e.g. delay, iterations).
 */
function runTestWithOptions(
  fnName: string,
  fn: (updater: (t: AnimTransform) => void, opts: AnimKeyframeOptions) => KeyframeState[],
  options: AnimOptions
): TestResult {
  const result: TestResult = { name: fnName, passed: false, error: '' };
  const frames: KeyframeState[] = fn((t: AnimTransform): void => {}, options);
  const err: string = validateFrames(frames, fnName);
  if (err.length > 0) {
    result.error = err;
    return result;
  }
  result.passed = true;
  return result;
}

@Entry
@Component
struct TestPage {
  @State results: TestResult[] = [];
  @State totalPassed: number = 0;
  @State totalFailed: number = 0;

  aboutToAppear(): void {
    this.runAllTests();
  }

  runAllTests(): void {
    // ====================================================================
    // Category 1: Attention Seekers (12 functions)
    // ====================================================================
    this.results.push(runTest('bounce', bounce));
    this.results.push(runTest('flash', flash));
    this.results.push(runTest('pulse', pulse));
    this.results.push(runTest('rubberBand', rubberBand));
    this.results.push(runTest('shakeX', shakeX));
    this.results.push(runTest('shakeY', shakeY));
    this.results.push(runTest('headShake', headShake));
    this.results.push(runTest('swing', swing));
    this.results.push(runTest('tada', tada));
    this.results.push(runTest('wobble', wobble));
    this.results.push(runTest('jello', jello));
    this.results.push(runTest('heartBeat', heartBeat));

    // Verify delay + iterations on one attention seeker
    this.results.push(runTestWithOptions('bounce', bounce, { duration: 2000, delay: 500, iterations: 2 }));

    // ====================================================================
    // Category 2: Back Animations (8 functions)
    // ====================================================================
    this.results.push(runTest('backInDown', backInDown));
    this.results.push(runTest('backInLeft', backInLeft));
    this.results.push(runTest('backInRight', backInRight));
    this.results.push(runTest('backInUp', backInUp));
    this.results.push(runTest('backOutDown', backOutDown));
    this.results.push(runTest('backOutLeft', backOutLeft));
    this.results.push(runTest('backOutRight', backOutRight));
    this.results.push(runTest('backOutUp', backOutUp));

    // ====================================================================
    // Category 3: Bouncing Animations (10 functions)
    // ====================================================================
    this.results.push(runTest('bounceIn', bounceIn));
    this.results.push(runTest('bounceInDown', bounceInDown));
    this.results.push(runTest('bounceInLeft', bounceInLeft));
    this.results.push(runTest('bounceInRight', bounceInRight));
    this.results.push(runTest('bounceInUp', bounceInUp));
    this.results.push(runTest('bounceOut', bounceOut));
    this.results.push(runTest('bounceOutDown', bounceOutDown));
    this.results.push(runTest('bounceOutLeft', bounceOutLeft));
    this.results.push(runTest('bounceOutRight', bounceOutRight));
    this.results.push(runTest('bounceOutUp', bounceOutUp));

    // ====================================================================
    // Category 4: Fading Entrances (13 functions)
    // ====================================================================
    this.results.push(runTest('fadeIn', fadeIn));
    this.results.push(runTest('fadeInDown', fadeInDown));
    this.results.push(runTest('fadeInDownBig', fadeInDownBig));
    this.results.push(runTest('fadeInLeft', fadeInLeft));
    this.results.push(runTest('fadeInLeftBig', fadeInLeftBig));
    this.results.push(runTest('fadeInRight', fadeInRight));
    this.results.push(runTest('fadeInRightBig', fadeInRightBig));
    this.results.push(runTest('fadeInUp', fadeInUp));
    this.results.push(runTest('fadeInUpBig', fadeInUpBig));
    this.results.push(runTest('fadeInTopLeft', fadeInTopLeft));
    this.results.push(runTest('fadeInTopRight', fadeInTopRight));
    this.results.push(runTest('fadeInBottomLeft', fadeInBottomLeft));
    this.results.push(runTest('fadeInBottomRight', fadeInBottomRight));

    // ====================================================================
    // Category 5: Fading Exits (13 functions)
    // ====================================================================
    this.results.push(runTest('fadeOut', fadeOut));
    this.results.push(runTest('fadeOutDown', fadeOutDown));
    this.results.push(runTest('fadeOutDownBig', fadeOutDownBig));
    this.results.push(runTest('fadeOutLeft', fadeOutLeft));
    this.results.push(runTest('fadeOutLeftBig', fadeOutLeftBig));
    this.results.push(runTest('fadeOutRight', fadeOutRight));
    this.results.push(runTest('fadeOutRightBig', fadeOutRightBig));
    this.results.push(runTest('fadeOutUp', fadeOutUp));
    this.results.push(runTest('fadeOutUpBig', fadeOutUpBig));
    this.results.push(runTest('fadeOutTopLeft', fadeOutTopLeft));
    this.results.push(runTest('fadeOutTopRight', fadeOutTopRight));
    this.results.push(runTest('fadeOutBottomRight', fadeOutBottomRight));
    this.results.push(runTest('fadeOutBottomLeft', fadeOutBottomLeft));

    // ====================================================================
    // Category 6: Flippers (5 functions)
    // ====================================================================
    this.results.push(runTest('flip', flip));
    this.results.push(runTest('flipInX', flipInX));
    this.results.push(runTest('flipInY', flipInY));
    this.results.push(runTest('flipOutX', flipOutX));
    this.results.push(runTest('flipOutY', flipOutY));

    // ====================================================================
    // Category 7: Lightspeed (4 functions)
    // ====================================================================
    this.results.push(runTest('lightSpeedInRight', lightSpeedInRight));
    this.results.push(runTest('lightSpeedInLeft', lightSpeedInLeft));
    this.results.push(runTest('lightSpeedOutRight', lightSpeedOutRight));
    this.results.push(runTest('lightSpeedOutLeft', lightSpeedOutLeft));

    // ====================================================================
    // Category 8: Rotating Animations (10 functions)
    // ====================================================================
    this.results.push(runTest('rotateIn', rotateIn));
    this.results.push(runTest('rotateInDownLeft', rotateInDownLeft));
    this.results.push(runTest('rotateInDownRight', rotateInDownRight));
    this.results.push(runTest('rotateInUpLeft', rotateInUpLeft));
    this.results.push(runTest('rotateInUpRight', rotateInUpRight));
    this.results.push(runTest('rotateOut', rotateOut));
    this.results.push(runTest('rotateOutDownLeft', rotateOutDownLeft));
    this.results.push(runTest('rotateOutDownRight', rotateOutDownRight));
    this.results.push(runTest('rotateOutUpLeft', rotateOutUpLeft));
    this.results.push(runTest('rotateOutUpRight', rotateOutUpRight));

    // ====================================================================
    // Category 9: Sliding Animations (8 functions)
    // ====================================================================
    this.results.push(runTest('slideInDown', slideInDown));
    this.results.push(runTest('slideInLeft', slideInLeft));
    this.results.push(runTest('slideInRight', slideInRight));
    this.results.push(runTest('slideInUp', slideInUp));
    this.results.push(runTest('slideOutDown', slideOutDown));
    this.results.push(runTest('slideOutLeft', slideOutLeft));
    this.results.push(runTest('slideOutRight', slideOutRight));
    this.results.push(runTest('slideOutUp', slideOutUp));

    // ====================================================================
    // Category 10: Specials (4 functions)
    // ====================================================================
    this.results.push(runTest('hinge', hinge));
    this.results.push(runTest('jackInTheBox', jackInTheBox));
    this.results.push(runTest('rollIn', rollIn));
    this.results.push(runTest('rollOut', rollOut));

    // Verify iterations on a special animation
    this.results.push(runTestWithOptions('jackInTheBox', jackInTheBox, { duration: 1500, delay: 100, iterations: 3 }));

    // ====================================================================
    // Category 11: Zooming Animations (10 functions)
    // ====================================================================
    this.results.push(runTest('zoomIn', zoomIn));
    this.results.push(runTest('zoomInDown', zoomInDown));
    this.results.push(runTest('zoomInLeft', zoomInLeft));
    this.results.push(runTest('zoomInRight', zoomInRight));
    this.results.push(runTest('zoomInUp', zoomInUp));
    this.results.push(runTest('zoomOut', zoomOut));
    this.results.push(runTest('zoomOutDown', zoomOutDown));
    this.results.push(runTest('zoomOutLeft', zoomOutLeft));
    this.results.push(runTest('zoomOutRight', zoomOutRight));
    this.results.push(runTest('zoomOutUp', zoomOutUp));

    // ====================================================================
    // Edge Cases
    // NOTE: Coverage is limited to standard-path validation (keyframe generation).
    // Negative tests (duration=0, NaN, updater=null, iterations=-1) are not
    // on-device tested; input guards in internal.ets provide defense-in-depth.
    // ====================================================================
    this.results.push(runTestWithOptions('fadeIn (0 delay)', fadeIn, { duration: 500, delay: 0 }));
    this.results.push(runTestWithOptions('fadeOut (short dur)', fadeOut, { duration: 1, delay: 0, iterations: 1 }));

    // Calculate totals
    this.totalPassed = 0;
    this.totalFailed = 0;
    for (let i: number = 0; i < this.results.length; i++) {
      if (this.results[i].passed) {
        this.totalPassed++;
      } else {
        this.totalFailed++;
      }
    }
  }

  build() {
    Column() {
      Text('arkts-animate-css — Runtime Verification')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Row() {
        Text('Passed ' + this.totalPassed)
          .fontColor('#4CAF50')
          .fontSize(18)
        Text('Failed ' + this.totalFailed)
          .fontColor('#F44336')
          .fontSize(18)
          .margin({ left: 12 })
      }
      .margin({ top: 8, bottom: 8 })

      Text('Total: ' + this.results.length + ' tests — 97 animations + 2 edge cases + 2 param variants')
        .fontSize(12)
        .fontColor('#666')
        .margin({ bottom: 8 })

      List() {
        ForEach(this.results, (item: TestResult, index: number) => {
          ListItem() {
            Row() {
              Text(item.passed ? 'OK' : 'FAIL')
                .fontSize(14)
                .fontColor(item.passed ? '#4CAF50' : '#F44336')
              Text(item.name)
                .fontSize(13)
                .margin({ left: 8 })
                .fontColor(item.passed ? '#333' : '#F44336')
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
          }
        }, (item: TestResult, index: number) => item.name + '_' + index)
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
