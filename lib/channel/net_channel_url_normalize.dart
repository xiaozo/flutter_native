import 'net_channel.dart';

extension NetApiUrlNormalize on NetSecret {
  String get normalizedMainUrl {
    var url = mainUrl ?? "";
    if (!url.endsWith('/')) url += '/';
    return url;
  }
}
