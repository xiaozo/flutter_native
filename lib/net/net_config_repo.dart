import '../channel/net_channel_all.dart';

/// 网络配置仓库
class NetConfigRepo {
  NetSecret _secret = NetSecret();

  // ignore: use_setters_to_change_properties
  void update(NetSecret secret) {
    _secret = secret;
  }

  /// 返回token之前是否是有值的
  bool tokenExpire() {
    final bool changed = _secret.token?.isNotEmpty ?? false;
    _secret.token = "";
    return changed;
  }

  String get mainUrl => _secret.normalizedMainUrl;
  String get token => _secret.token ?? "";
  String get versionCode => _secret.versionCode ?? "";
}
