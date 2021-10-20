import 'package:flutter/foundation.dart';

import 'native_log_channel.dart';

extension NativeLogCatch on NativeLogApi {
  /// 打点，忽略异常
  Future<void> tryLog(FLog arg) async {
    try {
      await log(arg);
    } catch (e) {
      debugPrint('e.toString()');
    }
  }
}
