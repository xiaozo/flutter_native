import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';

Future<void> setupDebug() async {
  if (kReleaseMode) {
    // 发布模式，取消打印输出
    debugPrint = (String? message, {int? wrapWidth}) => {};
    return;
  }
  final packageInfo = await PackageInfo.fromPlatform();

  final version = "${packageInfo.packageName})";
  // 打印输出
  debugPrint = (String? message, {int? wrapWidth}) =>
      _debugPrintSynchronouslyWithText(message, version, wrapWidth: wrapWidth);
}

void _debugPrintSynchronouslyWithText(String? message, String version,
    {int? wrapWidth}) {
  final output = "[${DateTime.now()} - $version]: $message";
  debugPrintSynchronously(output, wrapWidth: wrapWidth);
}
