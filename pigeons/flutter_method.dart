import 'package:pigeon/pigeon.dart';

class FScreenshotResult {
  late Uint8List imageBytes;
}

@FlutterApi()
abstract class FlutterMethodApi {
  @async
  FScreenshotResult screenshot();
}
