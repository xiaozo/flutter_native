import 'http_response.dart';

extension HiResponseX<T> on HiResponse<T> {
  bool get isError => error_code != 0;
  String get errorDesc => message ?? "未知错误";
}
