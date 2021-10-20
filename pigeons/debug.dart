import 'package:pigeon/pigeon.dart';

class FError {
  late String error;
  late String stack;
}

// Flutter 错误输出到原生
@HostApi()
abstract class DebugApi {
  void dumpToNative(FError data);
}
