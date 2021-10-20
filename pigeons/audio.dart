import 'package:pigeon/pigeon.dart';

class FAudioSource {
  int type = 0;
}

@HostApi()
abstract class AudioHostApi {
  void play(FAudioSource source);
}
