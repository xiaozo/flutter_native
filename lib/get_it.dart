import 'package:get_it/get_it.dart';

import 'net/net_config_repo.dart';

final getIt = GetIt.instance;

// 初始化全局Service、Repository等
void setupGetIt() {
  getIt.registerSingleton(NetConfigRepo());
}
