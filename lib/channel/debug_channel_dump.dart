import 'debug_channel.dart';

extension Dump on DebugApi {
  void dumpError(Object e, StackTrace st) {
    try {
      dumpToNative(FError()
        ..error = e.toString()
        ..stack = st.toString());
    } catch (e) {}
  }
}
