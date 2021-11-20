import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../get_it.dart';
import '../net/dio_handle.dart';
import '../net/net_config_repo.dart';
import '../net/rest_api.dart';

final restClientProvider =
    Provider<RestClient>((ref) => throw UnimplementedError(""));

RestClient buildRestClient() {
  final dio = Dio();
  dio.build();
  var baseUrl = getIt<NetConfigRepo>().mainUrl;

  final client = RestClient(dio, baseUrl: baseUrl);
  return client;
}
