import 'package:flutter/cupertino.dart';
import 'package:flutter_deerclass/channel/notification_info_channel.dart';
import 'package:flutter_deerclass/event/event_bus.dart';

import 'channel/net_channel.dart';
import 'get_it.dart';
import 'net/net_config_repo.dart';

///更新信息通知
final String Flutter_UpdateInfo_Notification =
    "Flutter_UpdateInfo_Notification";

class NotificationInfoApiImpl extends NotificationInfoApi {
  NotificationInfoApiImpl();

  @override
  void receiveNotificationInfo(FNotificationInfo arg) {
    // TODO: implement receiveNotificationInfo
    String notificationName = arg.notificationName!;
    Map notificationObject =
        (arg.notificationObject != null ? arg.notificationObject : {})!;
    EventBus.instance
        .emit(notificationName, notificationObject, isSendNative: false);

    if (notificationName == Flutter_UpdateInfo_Notification) {
      ///更新信息通知
      NetHostApi().getSecret().then((value) {
        debugPrint("update secret=${value.token}");
        getIt<NetConfigRepo>().update(value);
      });
    }
  }
}
