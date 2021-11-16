import 'package:flutter/widgets.dart';
import 'package:flutter_boost/flutter_boost.dart';

extension BuildContextUniqueId on BuildContext {
  /// 获取Boost页面唯一Id
  String get boostPageUniqueId {
    return BoostContainer.of(this).pageInfo.uniqueId ?? "";
  }
}
