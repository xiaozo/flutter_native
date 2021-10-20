import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

import 'screen.dart';

// 不带阴影的圆框边框
class RoundBorder extends StatelessWidget {
  final Widget child;
  const RoundBorder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36.h),
        border: Border.all(color: '#c39bff'.toColor(), width: 8.h),
      ),
      child: child,
    );
  }
}

// 上边框圆角, 下边框到屏幕底部
class RoundOnlyTopBorder extends StatelessWidget {
  final Widget child;
  final bool shadow;
  const RoundOnlyTopBorder({
    Key? key,
    required this.child,
    this.shadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!shadow) return _buildNormal(context);

    return _buildShadow(context);
  }

  Widget _buildShadow(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var width = constraints.maxWidth;
      var height = constraints.maxHeight;

      if (width * 1.0 / height > 1016 / 476.0) {
        width = 1016 * height / 476.0;
      } else {
        height = 476.0 * width / 1016.0;
      }

      return SizedBox(
        width: width,
        height: height,
        child: Container(
          padding: EdgeInsets.only(top: 20.h, right: 30.h, left: 30.h),
          child: child,
          decoration: BoxDecoration(
            image: DecorationImage(
              centerSlice: Rect.fromLTWH(1016.0 / 6, 476.0 / 6, 1, 1),
              image: AssetImage("images/bg_border_top_round_shadow.9.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildNormal(BuildContext context) {
    return Transform.translate(
      // 隐藏下边线
      offset: Offset(0, 8.h),
      child: Container(
        padding: EdgeInsets.only(top: 40.h, right: 40.h, left: 40.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(36.h)),
          border: Border.all(color: '#c39bff'.toColor(), width: 8.h),
        ),
        child: child,
      ),
    );
  }
}
