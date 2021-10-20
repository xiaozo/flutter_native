import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export "package:flutter_screenutil/flutter_screenutil.dart";

export '../channel/play_click_audio.dart';
export 'sp_size.dart';

/// 设置屏幕适配方案
void dependScreenSize(BuildContext context) {
  final mediaData = MediaQuery.of(context);
  final width = mediaData.size.width;
  final height = mediaData.size.height;

  // debugPrint("sw=$width, sh=$height");
  // debugPrint("media=${mediaData.toString()}");
  if (width > 0 && height > 0) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: max(width, height), maxHeight: min(width, height)),
        designSize: const Size(1024, 768),
        orientation: Orientation.landscape);
  } else {
    ScreenUtil.init(BoxConstraints(maxWidth: 1024, maxHeight: 768),
        designSize: const Size(1024, 768), orientation: Orientation.landscape);
  }
}
