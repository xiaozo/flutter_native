import 'package:flutter/widgets.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../utils/boost_context.dart';

mixin PageViewEventBinding implements PageVisibilityObserver {
  ///普通的Widget调用  增加监听
  void addPageViewEventBinding(BuildContext context) {
    final boostPageUniqueId = context.boostPageUniqueId;
    PageVisibilityBinding.instance.addObserver(this, ModalRoute.of(context));
    PageViewEventBindingImpl.instance.addObserver(boostPageUniqueId, this);
  }

  ///普通的Widget调用 移除监听
  void removePageViewEventBinding(BuildContext context) {
    PageVisibilityBinding.instance.removeObserver(this);
    PageViewEventBindingImpl.instance.removeObserver(this);
  }

  ///继承HookWidget的调用
  void hookPageViewEventBinding(BuildContext context) {
    if (this is HookWidget) {
      final mouteroute = useMemoized(() => ModalRoute.of(context));
      final boostPageUniqueId = context.boostPageUniqueId;
      useEffect(() {
        debugPrint('hookPageViewEventBinding---useEffect');
        PageVisibilityBinding.instance.addObserver(this, mouteroute);
        PageViewEventBindingImpl.instance.addObserver(boostPageUniqueId, this);
        return () {
          debugPrint('hookPageViewEventBinding---pop');
          PageVisibilityBinding.instance.removeObserver(this);
          PageViewEventBindingImpl.instance.removeObserver(this);
        };
      }, const []);
    }
  }

  ///进入前台
  void onPageForeground() {
    debugPrint("onPageForeground");
  }

  ///进入后台
  void onPageBackground() {
    debugPrint("onPageBackground");
  }

  ///页面将要展示
  void onAppear() {
    debugPrint("onSinglePageAppear");
  }

  ///页面将要消失
  void onDisappear() {
    debugPrint("onSinglePageDisappear");
  }

  void onPageShow() {
    debugPrint("onPageShow");
    // if (isForegroundEvent == true) {
    //   onPageForeground();
    // }
  }

  void onPageHide() {
    debugPrint("onPageHide");
    // if (isBackgroundEvent == true) {
    //   onPageBackground();
    // }
  }

  @override
  void onBackground() {
    // TODO: implement onBackground
    onPageBackground();
  }

  @override
  void onForeground() {
    // TODO: implement onForeground
    onPageForeground();
  }
}

class PageViewEventBindingImpl {
  static final PageViewEventBindingImpl instance =
      PageViewEventBindingImpl._internal();

  final Map<String, PageViewEventBinding> _listeners =
      <String, PageViewEventBinding>{};

  PageViewEventBindingImpl._internal();

  void onAppear(String? uniqueID) {
    assert(uniqueID != null);
    PageViewEventBinding? observer = _listeners[uniqueID];
    observer?.onAppear();
  }

  void onDisappear(String? uniqueID) {
    assert(uniqueID != null);
    PageViewEventBinding? observer = _listeners[uniqueID];
    observer?.onDisappear();
  }

  void addObserver(String? uniqueID, PageViewEventBinding? observer) {
    assert(uniqueID != null);
    assert(observer != null);
    _listeners.putIfAbsent(uniqueID!, () => observer!);
  }

  void removeObserver(PageViewEventBinding? observer) {
    assert(observer != null);
    for (String key in _listeners.keys) {
      if (_listeners[key] == observer) {
        debugPrint("removeObserver:${key}");
        _listeners.remove(key);
        break;
      }
    }
  }
}
