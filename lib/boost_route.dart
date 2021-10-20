import 'package:flutter/widgets.dart';
import 'package:flutter_boost/flutter_boost_app.dart';
import 'package:flutter_boost/boost_navigator.dart';
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
};

Route<dynamic>? routeFactory(RouteSettings settings, String uniqueId) {
  final FlutterBoostRouteFactory? func = _routerMap[settings.name];
  if (func == null) {
    return null;
  }
  return func(settings, uniqueId);
}
