// @dart=2.9

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'boost.dart';
import 'channel/debug_channel.dart';
import 'channel/debug_channel_dump.dart';
import 'debug.dart';
import 'get_it.dart';
import 'global_context.dart';
import 'provider/rest_client.dart';
import 'package:flutter_boost/boost_flutter_binding.dart';
// @pragma('vm:entry-point')

class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

void main() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    //将异常转发至Zone
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZonedGuarded(() {
    runBoostApp();
  }, (error, stack) {
    debugPrint('error=${error.toString()}, stack=${stack.toString()}');

    DebugApi().dumpError(error, stack);
  });
}

Future<void> runBoostApp() async {
  setupGetIt();
  CustomFlutterBinding();
  WidgetsFlutterBinding.ensureInitialized();
  await setupDebug();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  debugPaintSizeEnabled = false;
  debugRepaintRainbowEnabled = false;

  // getIt<NetConfigRepo>().update(await NetHostApi().getSecret());

  runApp(ProviderScope(
      overrides: [
        restClientProvider.overrideWithValue(buildRestClient()),
      ],

      // TEST
      child: BoostApp(
        appBuilder: (home) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: '鹿优课',
            theme: ThemeData.dark(),
            home: Material(
              child: home,
            ),
            builder: (context, widget) {
              return MediaQuery(
                //设置文字大小不随系统设置改变
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget,
              );
            },
          );
        },
      )));
}
