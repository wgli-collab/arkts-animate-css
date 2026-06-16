# arkts-animate-css

[![HarmonyOS](https://img.shields.io/badge/HarmonyOS-6.1.1(24)-blue)](https://developer.harmonyos.com/)
[![ArkTS](https://img.shields.io/badge/ArkTS-strict--mode-orange)](https://developer.huawei.com/consumer/cn/arkts/)

跨平台 CSS 动画库 [animate.css](https://github.com/animate-css/animate.css) v4.1.1 的 HarmonyOS ArkTS 移植版本。提供 **97 个关键帧动画函数**，所有动画均通过 `KeyframeState[]` 返回，可直接用于 ArkUI 的 `animateTo()` / `keyframeAnimateTo()` API。

## 特性

- 🎬 **97 个动画** — 完整移植 animate.css v4.1.1 全部动画
- 📐 **类型安全** — 纯 ArkTS strict-mode，0 个 `any`/`unknown`
- 🔧 **零依赖** — 纯算法实现，不依赖任何第三方库
- 🧪 **101 个测试** — 100% API 覆盖，运行时全部通过

## 安装

```bash
ohpm install @ohos/arkts-animate-css
```

或本地依赖：

```json5
// entry/oh-package.json5
{
  "dependencies": {
    "library": "file:../library"
  }
}
```

## 快速开始

```typescript
import { bounce, AnimTransform, AnimOptions } from 'library';

// 定义 UI 更新回调
const updater = (t: AnimTransform): void => {
  // 更新组件的 translate/scale/rotate/opacity/skew
};

// 调用动画函数，获取关键帧数组
const frames: KeyframeState[] = bounce(updater, {
  duration: 1000,     // 动画时长 (ms)
  delay: 0,           // 延迟 (ms)
  iterations: 1,      // 重复次数 (-1 = 无限)
  curve: Curve.Ease   // 缓动曲线
});

// 传入 ArkUI keyframeAnimateTo()
keyframeAnimateTo({ frames: frames });
```

## 动画分类

| 分类 | 数量 | 函数 |
|------|:--:|------|
| **Attention Seekers** | 12 | bounce, flash, pulse, rubberBand, shakeX, shakeY, headShake, swing, tada, wobble, jello, heartBeat |
| **Back Entrances** | 4 | backInDown, backInLeft, backInRight, backInUp |
| **Back Exits** | 4 | backOutDown, backOutLeft, backOutRight, backOutUp |
| **Bouncing Entrances** | 5 | bounceIn, bounceInDown, bounceInLeft, bounceInRight, bounceInUp |
| **Bouncing Exits** | 5 | bounceOut, bounceOutDown, bounceOutLeft, bounceOutRight, bounceOutUp |
| **Fading Entrances** | 13 | fadeIn, fadeInDown, fadeInDownBig, fadeInLeft, fadeInLeftBig, fadeInRight, fadeInRightBig, fadeInUp, fadeInUpBig, fadeInTopLeft, fadeInTopRight, fadeInBottomLeft, fadeInBottomRight |
| **Fading Exits** | 13 | fadeOut, fadeOutDown, fadeOutDownBig, fadeOutLeft, fadeOutLeftBig, fadeOutRight, fadeOutRightBig, fadeOutUp, fadeOutUpBig, fadeOutTopLeft, fadeOutTopRight, fadeOutBottomLeft, fadeOutBottomRight |
| **Flippers** | 5 | flip, flipInX, flipInY, flipOutX, flipOutY |
| **Lightspeed** | 4 | lightSpeedInRight, lightSpeedInLeft, lightSpeedOutRight, lightSpeedOutLeft |
| **Rotating Entrances** | 5 | rotateIn, rotateInDownLeft, rotateInDownRight, rotateInUpLeft, rotateInUpRight |
| **Rotating Exits** | 5 | rotateOut, rotateOutDownLeft, rotateOutDownRight, rotateOutUpLeft, rotateOutUpRight |
| **Sliding Entrances** | 4 | slideInDown, slideInLeft, slideInRight, slideInUp |
| **Sliding Exits** | 4 | slideOutDown, slideOutLeft, slideOutRight, slideOutUp |
| **Specials** | 4 | hinge, jackInTheBox, rollIn, rollOut |
| **Zooming Entrances** | 5 | zoomIn, zoomInDown, zoomInLeft, zoomInRight, zoomInUp |
| **Zooming Exits** | 5 | zoomOut, zoomOutDown, zoomOutLeft, zoomOutRight, zoomOutUp |

## API

每个动画函数签名统一：

```typescript
function animationName(
  updater: (transform: AnimTransform) => void,
  options: AnimOptions
): KeyframeState[]
```

### AnimTransform

```typescript
class AnimTransform {
  translateX: number = 0;
  translateY: number = 0;
  scaleX: number = 1;
  scaleY: number = 1;
  rotateZ: number = 0;
  opacity: number = 1;
  skewX: number = 0;
  skewY: number = 0;
}
```

### AnimOptions

```typescript
interface AnimOptions {
  duration: number;     // 动画时长 (ms) — 必填
  delay?: number;       // 延迟 (ms)，默认 0
  iterations?: number;  // 重复次数，默认 1，-1 为无限
  curve?: Curve;        // 缓动曲线，默认 Curve.Ease
  onFinish?: () => void; // 完成回调
}
```

## 项目结构

```
arkts-animate-css/
├── library/                          # HAR 库模块
│   └── src/main/ets/
│       ├── Index.ets                 # 桶导出
│       ├── types.ets                 # AnimTransform + AnimOptions
│       ├── attention_seekers.ets     # 12 个动画
│       ├── back_animations.ets       # 8 个动画
│       ├── bouncing_animations.ets   # 10 个动画
│       ├── fading_entrances.ets      # 13 个动画
│       ├── fading_exits.ets          # 13 个动画
│       ├── flippers.ets              # 5 个动画
│       ├── lightspeed.ets            # 4 个动画
│       ├── rotating_animations.ets   # 10 个动画
│       ├── sliding_animations.ets    # 8 个动画
│       ├── specials.ets              # 4 个动画
│       └── zooming_animations.ets    # 10 个动画
└── entry/                            # 测试入口模块
    └── src/main/ets/pages/
        └── Index.ets                 # 101 个测试用例
```

## 质量保证

| 指标 | 值 |
|------|:--:|
| 编译 | ✅ BUILD SUCCESSFUL |
| 运行时测试 | ✅ 101/101 (100%) |

## 与 animate.css 的区别

| animate.css (CSS) | arkts-animate-css (ArkTS) |
|------|------|
| CSS `@keyframes` 声明 | `function(): KeyframeState[]` |
| `animation-name` + `animation-duration` 等 CSS 属性 | `AnimOptions { duration, delay, ... }` |
| 浏览器自动插值 | 显式 `KeyframeState[]` 数组 |
| `transform` CSS 属性 | `AnimTransform` 类属性 |

## 许可证

Apache-2.0 — 与原 animate.css 保持一致。

## 致谢

- [animate.css](https://github.com/animate-css/animate.css) by Daniel Eden — 原创 CSS 动画库
