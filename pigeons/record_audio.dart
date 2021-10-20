import 'package:pigeon/pigeon.dart';
import 'model/fchannel_response.dart';

@HostApi()
abstract class RecordAudioHostApi {
  @async
  FChannelResponse startRecording();
  @async
  FChannelResponse stopRecording();
  @async
  FChannelResponse finishRecording();
  @async
  FChannelResponse pauseRecording();
  @async
  FChannelResponse continueRecording();
}
