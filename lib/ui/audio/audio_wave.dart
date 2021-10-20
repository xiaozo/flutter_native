import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supercharged/supercharged.dart';

import '../screen.dart';

/// 波形动画
class AudioWave extends HookWidget {
  final Color color;
  final double maxHeight;
  final double minHeight;

  static const int _fixInterval = 10;

  static final Color _playColor = '#8E5BD6'.toColor();
  static final Color _recordColor = '#FF6F2E'.toColor();

  const AudioWave._({
    Key? key,
    required this.color,
    this.maxHeight = 38,
    this.minHeight = 22,
  }) : super(key: key);

  /// 播放动画
  AudioWave.play({Key? key}) : this._(key: key, color: _playColor);

  /// 录音动画
  AudioWave.record({Key? key}) : this._(key: key, color: _recordColor);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: 600.milliseconds);
    useEffect(() {
      controller.repeat(reverse: true);
    }, [controller]);

    return SizedBox(
      height: maxHeight.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _WaveSlice(
            color: color,
            controller: controller,
            startHeight: minHeight,
            endHeight: maxHeight,
          ),
          SizedBox(
            width: _fixInterval.h,
          ),
          _WaveSlice(
            color: color,
            controller: controller,
            startHeight: maxHeight,
            endHeight: minHeight,
          ),
          SizedBox(
            width: _fixInterval.h,
          ),
          _WaveSlice(
            color: color,
            controller: controller,
            startHeight: minHeight,
            endHeight: maxHeight,
          ),
        ],
      ),
    );
  }
}

class _WaveSlice extends StatelessWidget {
  // 固定宽度
  static const int _fixWidth = 6;

  final AnimationController controller;

  final Color color;
  final double startHeight;
  final double endHeight;

  const _WaveSlice({
    Key? key,
    required this.color,
    required this.controller,
    required this.startHeight,
    required this.endHeight,
  }) : super(key: key);

  double get _progress => controller.value;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular((_fixWidth / 2).as),
        ),
      ),
      builder: (context, child) {
        return SizedBox(
          width: _fixWidth.as,
          // 改变高度
          height: (startHeight + (endHeight - startHeight) * _progress).as,
          child: child,
        );
      },
    );
  }
}
