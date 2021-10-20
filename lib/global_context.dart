import 'package:flutter/widgets.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

extension GetContext on GlobalKey<NavigatorState> {
  BuildContext? get context => navigatorKey.currentState?.overlay?.context;
}

/// APP 根Context
BuildContext? get appContext => navigatorKey.context;
