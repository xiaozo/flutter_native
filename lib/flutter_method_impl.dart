import 'package:flutter/cupertino.dart';
import 'package:flutter_deerclass/channel/notification_info_channel.dart';
import 'package:flutter_deerclass/deer_class.dart';
import 'package:flutter_deerclass/event/event_bus.dart';

import 'channel/flutter_method_channel.dart';
import 'channel/net_channel.dart';
import 'get_it.dart';
import 'net/net_config_repo.dart';

class FlutterMethodApiImpl extends FlutterMethodApi {
  FlutterMethodApiImpl();

  @override
  Future<FScreenshotResult> screenshot() async {
    // TODO: implement screenshot
    FScreenshotResult result = FScreenshotResult();
    result.imageBytes = await ZykjUtils.captureScreen(
        getIt.get(instanceName: KGETIT_ROOTWIDGETKEY),
        pixelRatio: 1.5);
    return result;
  }
}
