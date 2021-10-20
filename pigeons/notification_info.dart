import 'package:pigeon/pigeon.dart';

class FNotificationInfo {
  late String notificationName;
  Map<String, dynamic>? notificationObject;
}

// VM 每次显示得时候调用
@FlutterApi()
abstract class NotificationInfoApi {
  void receiveNotificationInfo(FNotificationInfo event);
}
