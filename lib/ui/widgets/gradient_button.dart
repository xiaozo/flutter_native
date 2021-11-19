import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    required this.child,
  });

  // 渐变色数组
  final List<Color>? colors;

  // 按钮宽高
  final double? width;
  final double? height;

  final Widget child;
  final BorderRadius? borderRadius;

  //点击回调
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ?? [theme.primaryColor, theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
        // 阴影的设置
        // boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(3.0, 3.0), blurRadius: 3.0, spreadRadius: 2.0),]
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          // splashColor: _colors.last,
          highlightColor: Color(0xFFe6e6e6),
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
                child: DefaultTextStyle(
              style: TextStyle(fontWeight: FontWeight.bold),
              child: child,
            )),
          ),
        ),
      ),
    );
  }
}
