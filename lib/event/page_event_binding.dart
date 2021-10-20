import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../utils/boost_context.dart';

mixin PageEventBindingObserver<T extends StatefulWidget> on State<T> {
  void onEvent(String event, Map<Object?, Object?>? params) {}
}

void dispatchPageEvent(
    String uniqueId, String event, Map<Object?, Object?>? params) {
  for (final observer in PageEventBinding.instance._observers) {
    try {
      if (!observer.mounted) continue;
      if (observer.context.boostPageUniqueId == uniqueId) {
        // 匹配当前页，目前能有1个处理就返回
        observer.onEvent(event, params == null ? null : params);
        return;
      }
    } catch (e) {
      debugPrint('${e.toString()}');
    }
  }
}

/// 事件监听
class PageEventBinding {
  static final PageEventBinding instance = PageEventBinding._internal();

  final _observers = <PageEventBindingObserver>[];

  PageEventBinding._internal();

  void addObserver(PageEventBindingObserver observer) {
    _observers.add(observer);
  }

  void removeObserver(PageEventBindingObserver observer) {
    _observers.remove(observer);
  }
}
