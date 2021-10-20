import 'package:dio/dio.dart';
import 'model/http_response.dart';

// 转换通用错误
extension ResponseNet<T> on Future<HiResponse<T>> {
  Future<HiResponse<T>> toResponse() async {
    try {
      return await this;
    } catch (e) {
      throw e;
    }
  }
}
