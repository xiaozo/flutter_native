import 'package:pigeon/pigeon.dart';

class NetSecret {
  late String token;
  late String versionCode;
  late String mainUrl;
}

class ErrorMessage {
  late String message;
}

class FJSLNetParams {
  late Map inputData;
  late Map expand;
  late String function;
}

class FJSLNetEncryptResult {
  late String encrypt;
  late String expand;
  late String sign;
}

@HostApi()
abstract class NetHostApi {
  NetSecret getSecret();
  void tokenExpire();
  void stopUserApp();
  void studentInvalid(ErrorMessage message);
  FJSLNetEncryptResult jslParamsEncrypt(FJSLNetParams params);
}
