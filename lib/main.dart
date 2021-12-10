// @dart=2.9

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'boost.dart';
import 'channel/debug_channel.dart';
import 'channel/debug_channel_dump.dart';
import 'channel/net_channel.dart';
import 'debug.dart';
import 'get_it.dart';
import 'global_context.dart';
import 'net/net_config_repo.dart';
import 'provider/rest_client.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// @pragma('vm:entry-point')

class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

///全局生命周期监听示例
class AppLifecycleObserver with GlobalPageVisibilityObserver {
  void onPagePush(Route<dynamic> route) {
    super.onPagePush(route);
    try {
      if (Platform.isAndroid) {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    } catch (e) {}
  }

  @override
  void onPageShow(Route route) {
    super.onPageShow(route);
    try {
      if (Platform.isAndroid) {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    } catch (e) {}

    print("AppLifecycleObserver - onPageShow");
  }

  void onPagePop(Route<dynamic> route) {
    super.onPagePop(route);
    while (Navigator.of(appContext).canPop()) Navigator.of(appContext).pop();
  }
}

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

  PageVisibilityBinding.instance.addGlobalObserver(AppLifecycleObserver());

  debugPaintSizeEnabled = false;
  debugRepaintRainbowEnabled = false;

  getIt<NetConfigRepo>().update(await NetHostApi().getSecret());

  GlobalKey rootWidgetKey = getIt.get(instanceName: KGETIT_ROOTWIDGETKEY);

  runApp(ProviderScope(
      overrides: [
        restClientProvider.overrideWithValue(buildRestClient()),
      ],

      // TEST
      child: BoostApp(
        appBuilder: (home) {
          return MaterialApp(
            localizationsDelegates: [
              RefreshLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('zh'),
              const Locale('en'),
            ],
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: '鹿优课',
            theme: new ThemeData(
              ///主题色
              primaryColor: Color.fromRGBO(255, 139, 73, 1),
              appBarTheme: AppBarTheme(color: Color.fromRGBO(251, 251, 251, 1)),
              scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 240, 1),
              textTheme: TextTheme(

                  ///默认字体
                  bodyText2: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black),
                  button: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black)),
            ),
            home: RepaintBoundary(
              key: rootWidgetKey,
              child: Material(
                child: home,
              ),
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
