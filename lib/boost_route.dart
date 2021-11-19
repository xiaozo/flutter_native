import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'appPages/Test.dart';
import 'ui/screen.dart';

RoutePageBuilder _wrapSize(RoutePageBuilder builder) {
  return (context, __, ___) {
    dependScreenSize(context);
    return builder(context, __, ___);
  };
}

/// 每个页面必须要_wrapSize, 支持转屏大小变化
Map<String, FlutterBoostRouteFactory> _routerMap = {
  '/': (settings, uniqueId) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: _wrapSize(
        (_, __, ___) => Container(),
      ),
    );
  },
  '/test_page': (settings, uniqueId) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: _wrapSize(
        (_, __, ___) => TestPage(),
      ),
    );
  },
};

Route<dynamic>? routeFactory(RouteSettings settings, String uniqueId) {
  final FlutterBoostRouteFactory? func = _routerMap[settings.name];
  if (func == null) {
    return null;
  }
  return func(settings, uniqueId);
}
