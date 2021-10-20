import 'package:pigeon/pigeon.dart';

class Who {
  late int uid;
}

@HostApi()
abstract class UserHostApi {
  Who who();
}
