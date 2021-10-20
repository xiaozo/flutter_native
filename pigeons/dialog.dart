import 'package:pigeon/pigeon.dart';

class FDialog {
  late String uniqueId;
  late String msg;
}

@HostApi()
abstract class DialogHostApi {
  void show(FDialog dialog);
  void hide();
}
