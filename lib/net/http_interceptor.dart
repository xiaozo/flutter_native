import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import '../channel/net_channel_all.dart';
import '../get_it.dart';
import 'base_error.dart';
import 'net_config_repo.dart';
import 'rest_api.dart';

final _signKey = utf8.encode("piw38kulfozrea7ydmjnvbc965q1gt2x");
const _signHeader = "sign";

String _buildSignSource(
    String method, String url, String ts, String body, String apiToken) {
  String message = "$method\n$url\n$ts\n$body";
  if (apiToken.isNotEmpty) {
    message = message + apiToken;
  }
  return message;
}

String _sign(String source) {
  final hmacSha256 = Hmac(sha256, _signKey);
  final digest = hmacSha256.convert(utf8.encode(source));
  return const Base64Encoder.urlSafe().convert(digest.bytes);
}

void _buildSignHeader(RequestOptions options, String baseUrl,
    {String body = ""}) {
  if (options.headers.containsKey(_signHeader)) return;
  final ts = "${DateTime.now().millisecondsSinceEpoch}";
  const apiToken = "";
  options
    ..headers["ts"] = ts
    ..headers["api_token"] = apiToken;

  final method = options.method;
  // 包含尾部的'/'
  final url = options.uri.toString().substring(baseUrl.length - 1);

  final String source = _buildSignSource(method, url, ts, body, apiToken);
  options.headers[_signHeader] = _sign(source);
}

////鹿优课请求处理拦截器
class DeerclassHttpInterceptor extends Interceptor {
  DeerclassHttpInterceptor({
    this.signBody = false,
  });

  bool signBody;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
      ..headers["app_version"] = getIt<NetConfigRepo>().versionCode
      ..headers["system_number"] = Platform.isAndroid ? "5796454" : "4538567";

    // TODO: implement onRequest
    final baseUrl = getIt<NetConfigRepo>().mainUrl;
    // 实时更新
    final token = getIt<NetConfigRepo>().token;
    options.headers["token"] = token;

    // 空包体处理
    if (options.method == "GET" || options.data == null || !signBody) {
      _buildSignHeader(options, baseUrl);
    } else {
      final skipSignBody = options.headers.containsKey(skipSignBodyHeader);
      if (skipSignBody) {
        options.headers.remove(skipSignBodyHeader);
        _buildSignHeader(options, baseUrl);
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response resp, ResponseInterceptorHandler handler) {
    if (resp.data is Map<String, dynamic>) {
      try {
        final errorCode = resp.data["error_code"];
        final message = resp.data["message"]?.toString();
        if (errorCode == 20000 || errorCode == 20001) {
          if (getIt<NetConfigRepo>().tokenExpire()) {
            NetHostApi().tokenExpire();
          }
        } else if (errorCode == 20003 || errorCode == 20004) {
          NetHostApi().studentInvalid(ErrorMessage()..message = message);
        }

        if (errorCode == 0) {
          handler.next(resp);
        } else {
          handler.reject(DioError(
              requestOptions: resp.requestOptions,
              error: AppServiceException(
                  message: message, code: errorCode as int)));
        }
      } catch (e) {}
    }
  }
}

////九色鹿请求处理拦截器
class JslHttpInterceptor extends Interceptor {
  JslHttpInterceptor();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    FJSLNetParams params = FJSLNetParams();
    params.function = options.path;
    params.inputData = options.data as Map;

    FJSLNetEncryptResult p = await NetHostApi().jslParamsEncrypt(params);
    Map<String, dynamic> newdata = Map();
    newdata["encrypt"] = p.encrypt;
    newdata["expand"] = p.expand;
    newdata["sign"] = p.sign;

    options.data = newdata;
    options.path = "";
    handler.next(options);
  }

  @override
  void onResponse(Response resp, ResponseInterceptorHandler handler) {
    if (resp.data is Map<String, dynamic>) {
      try {
        final errorCode = resp.data["error_code"];
        final message = resp.data["message"]?.toString();

        if (errorCode == 0) {
          resp.data = resp.data["data"];
          handler.next(resp);
        } else {
          if (errorCode == -20001) {
            ////token过期
            NetHostApi().tokenExpire();
          } else if (errorCode == -20002) {
            ///停止使用app
            NetHostApi().stopUserApp();
          }
          handler.reject(DioError(
              requestOptions: resp.requestOptions,
              error: AppServiceException(
                  message: message, code: errorCode as int)));
        }
      } catch (e) {}
    }
  }
}
