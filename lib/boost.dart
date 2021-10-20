import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boost/flutter_boost_app.dart';
import 'package:flutter_deerclass/channel/notification_info_channel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'boost_route.dart';
import 'channel/net_channel_all.dart';
import 'channel/page_event_channel.dart';
import 'channel/page_visibility_channel.dart';
import 'event/page_event_binding.dart';
import 'event/page_view_event_binding.dart';
import 'flutter_notification.dart';
import 'get_it.dart';
import 'net/net_config_repo.dart';

class _PageVisibilityApiImpl extends PageVisibilityApi {
  static final _PageVisibilityApiImpl instance =
      _PageVisibilityApiImpl._internal();

  _PageVisibilityApiImpl._internal();

  @override
  void onAppear() {
    debugPrint("onAppear");
    NetHostApi().getSecret().then((value) {
      debugPrint("update secret=${value.token}");
      getIt<NetConfigRepo>().update(value);
    });

    // Future.microtask(() => NetHostApi().getSecret()).then((value) {
    //   debugPrint("update secret=${value.token}");
    //   getIt<NetConfigRepo>().update(value);
    // });

    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //   ),
    // );
  }

  @override
  void onSinglePageAppear(FPageVisibility arg) {
    // TODO: implement onSinglePageAppear
    PageViewEventBindingImpl.instance.onAppear(arg.uniqueId);
  }

  @override
  void onSinglePageDisappear(FPageVisibility arg) {
    // TODO: implement onSinglePageDisappear
    PageViewEventBindingImpl.instance.onDisappear(arg.uniqueId);
  }
}

class _PageEventApiImpl extends PageEventApi {
  _PageEventApiImpl();

  @override
  void postEvent(FEvent arg) {
    if (arg.uniqueId?.isNotEmpty != true || arg.event?.isNotEmpty != true)
      return;

    dispatchPageEvent(arg.uniqueId!, arg.event!, arg.params);
  }
}

class BoostApp extends HookWidget {
  final FlutterBoostAppBuilder? appBuilder;
  const BoostApp({Key? key, this.appBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      PageVisibilityApi.setup(_PageVisibilityApiImpl.instance);
      PageEventApi.setup(_PageEventApiImpl());
      NotificationInfoApi.setup(NotificationInfoApiImpl());
      return () {
        PageVisibilityApi.setup(null);
        PageEventApi.setup(null);
        NotificationInfoApi.setup(null);
      };
    });

    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
  }
}
