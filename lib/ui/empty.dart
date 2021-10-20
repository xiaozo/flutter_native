import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

import 'image_button.dart';
import 'screen.dart';

class Empty extends StatelessWidget {
  final String tip;
  final ImageProvider image;
  final VoidCallback? onRetry;

  // 空视图
  const Empty(
      {Key? key,
      this.tip = "暂无可用的学习资源",
      this.image = const AssetImage("images/empty_img1.webp"),
      this.onRetry})
      : super(key: key);

  // 错误视图
  const Empty.error(
      {Key? key,
      String tip = "Lulu也很着急呀～网络出问题啦～",
      ImageProvider image = const AssetImage("images/net_error_img.webp"),
      required VoidCallback onRetry})
      : this(key: key, tip: tip, image: image, onRetry: onRetry);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 660.h,
          height: 406.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: const AssetImage("images/bg_border.png"),
              centerSlice: Rect.fromLTWH(
                119,
                95,
                1,
                1,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // width: 230.h,
                height: 194.h,
                decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.fitHeight),
                ),
              ),
              if (tip.isNotEmpty)
                Text(
                  tip,
                  style:
                      TextStyle(color: '#7c7c7c'.toColor(), fontSize: 16.sph),
                ),
            ],
          ),
        ),
        if (onRetry != null)
          Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: ImageButton.orange(
              onPressed: onRetry,
              width: 277.h,
              height: 68.h,
              title: "重新加载",
              overlayBottom: 8.h,
            ),
          ),
      ]),
    );
  }
}
