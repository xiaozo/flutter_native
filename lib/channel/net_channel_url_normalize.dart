import 'net_channel.dart';

extension NetApiUrlNormalize on NetSecret {
  String get normalizedMainUrl {
    var url = mainUrl ?? "";
    if (!url.endsWith('/')) url += '/';

    try {
      ///http://dev-ip.thedeer.cn:/zykj-api/userapp/ 改成 http://dev-ip.thedeer.cn/zykj-api/userapp/ 去掉默认端口号的：
      url = url.replaceFirst(RegExp(r':/'), '/', 8);
    } catch (e) {}

    return url;
  }
}
