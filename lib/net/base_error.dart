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

abstract class BaseError {
  final int code;
  final String message;
  final String? errorImgAssetName;

  BaseError(
      {required this.code, required this.message, this.errorImgAssetName});
}

class NetError implements BaseError {
  final int _code;
  final String _message;
  final String? errorImgAssetName1;

  NetError(this._code, this._message, {this.errorImgAssetName1});

  @override
  // TODO: implement code
  int get code => _code;

  @override
  // TODO: implement errorImgProvider
  String? get errorImgAssetName => errorImgAssetName1;

  @override
  // TODO: implement message
  String get message => _message;
}
