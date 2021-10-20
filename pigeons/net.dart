import 'package:pigeon/pigeon.dart';

class NetSecret {
  late String token;
  late String versionCode;
  late String mainUrl;
}

class ErrorMessage {
  late String message;
}

@HostApi()
abstract class NetHostApi {
  NetSecret getSecret();
  void tokenExpire();
  void studentInvalid(ErrorMessage message);
}
