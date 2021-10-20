import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supercharged/supercharged.dart';

import 'screen.dart';

part 'image_button_background.dart';

enum ImageButtonState {
  normal,
  press,
  diable,
}

typedef ImageButtonResolver = Widget Function(ImageButtonState);

class ImageButton extends HookWidget {
  final ImageButtonResolver backgroundResolver;
  final double width;
  final double height;
  final ImageButtonResolver? foregroundResolver;
  final VoidCallback? onPressed;

  const ImageButton({
    Key? key,
    required this.onPressed,
    required this.backgroundResolver,
    required this.width,
    required this.height,
    this.foregroundResolver,
  }) : super(key: key);

  // 黄色按钮
  ImageButton.orange({
    Key? key,
    VoidCallback? onPressed,
    required double width,
    required double height,
    required String title,
    double? overlayBottom,
  }) : this(
            key: key,
            onPressed: onPressed,
            width: width,
            height: height,
            backgroundResolver: (state) {
              switch (state) {
                case ImageButtonState.diable:
                  return ImageButtonBackground.disable(
                      overlayBottom: overlayBottom);
                case ImageButtonState.press:
                  return ImageButtonBackground.orangePress(
                      overlayBottom: overlayBottom);
                default:
                  return ImageButtonBackground.orangeNormal(
                      overlayBottom: overlayBottom);
              }
            },
            foregroundResolver: (state) {
              return Padding(
                padding: EdgeInsets.only(bottom: overlayBottom ?? 8.h),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18.sph, color: Colors.white),
                ),
              );
            });

  ImageButton.yellow({
    Key? key,
    VoidCallback? onPressed,
    required double width,
    required double height,
    required String title,
    double? overlayBottom,
  }) : this(
            key: key,
            onPressed: onPressed,
            width: width,
            height: height,
            backgroundResolver: (state) {
              switch (state) {
                case ImageButtonState.diable:
                  return ImageButtonBackground.disable(
                    overlayBottom: overlayBottom,
                  );
                case ImageButtonState.press:
                  return ImageButtonBackground.yellowPress(
                    overlayBottom: overlayBottom,
                  );
                default:
                  return ImageButtonBackground.yellowNormal(
                    overlayBottom: overlayBottom,
                  );
              }
            },
            foregroundResolver: (state) {
              return Padding(
                padding: EdgeInsets.only(bottom: overlayBottom ?? 8.h),
                child: () {
                  switch (state) {
                    case ImageButtonState.diable:
                      return Text(
                        title,
                        style: TextStyle(fontSize: 18.sph, color: Colors.white),
                      );
                    default:
                      return Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.sph,
                          color: '#ae3600'.toColor(),
                        ),
                      );
                  }
                }(),
              );
            });

  @override
  Widget build(BuildContext context) {
    final state = useState<ImageButtonState>(
        onPressed != null ? ImageButtonState.normal : ImageButtonState.diable);
    if (state.value == ImageButtonState.diable) {
      return _build(ImageButtonState.diable);
    }
    return GestureDetector(
      onTap: () {
        if (onPressed != null) onPressed!();
      },
      onTapDown: (_) {
        state.value = ImageButtonState.press;
      },
      onTapUp: (_) {
        state.value = ImageButtonState.normal;
      },
      onTapCancel: () {
        state.value = ImageButtonState.normal;
      },
      child: _build(state.value),
    );
  }

  Widget _build(ImageButtonState state) {
    final background = backgroundResolver(state);
    final foreground =
        foregroundResolver != null ? foregroundResolver!(state) : null;

    return SizedBox.fromSize(
      size: Size(width, height),
      child: Stack(
        fit: StackFit.expand,
        children: [
          background,
          if (foreground != null)
            Center(
              child: foreground,
            ),
        ],
      ),
    );
  }
}
