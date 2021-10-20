import 'package:pigeon/pigeon.dart';

class FLog {
  late String logId;
}

// 原生打点
@HostApi()
abstract class NativeLogApi {
  void log(FLog data);
}
