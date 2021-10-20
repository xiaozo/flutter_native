import 'package:pigeon/pigeon.dart';

class FEvent {
  late String uniqueId;
  late String event;
  Map<String, dynamic>? params;
}

// 页面事件
@FlutterApi()
abstract class PageEventApi {
  void postEvent(FEvent event);
}
