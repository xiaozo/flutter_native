class HttpException implements Exception {
  final String? _message;

  String get message => _message ?? this.runtimeType.toString();

  final int? _code;

  int get code => _code ?? -1;

  HttpException([this._message, this._code]);

  String toString() {
    return message;
  }
}

/// 服务端响应错误
class AppServiceException extends HttpException {
  AppServiceException({String? message, int? code}) : super(message, code);
}
