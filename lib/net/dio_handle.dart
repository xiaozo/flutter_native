import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_deerclass/appPages/view_model/test_view_model.dart';
import 'package:flutter_deerclass/appPages/view_model/view_model_state.dart';
import 'package:flutter_deerclass/ui/widgets/page_state.dart';
import 'base_error.dart';
import 'http_interceptor.dart';

///request_code
final kNoMoreHeaderCode = 20001;
final knoMoreFootCode = 20002;

///请求包裹参数
class TTuple<T> {
  late T item;

  TTuple(this.item);
}

///请求包裹参数
class TTuple2<T1, T2> {
  late T1 item1;
  late T2 item2;

  TTuple2(this.item1, this.item2);
}

////网络错误页面模型
class PageException {
  final PageState pageState;
  final NetError? netError;

  PageException({required this.pageState, this.netError});
}

extension Configuartion on Dio {
  void build({bool signBody = true}) {
    interceptors.add(JslHttpInterceptor());

    if (kDebugMode) {
      interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
}

extension AppHttpErrorHandle on Exception {
  bool isIgnore() {
    return ((this is DioError) &&
        (this as DioError).type == DioErrorType.cancel);
  }

  bool isAppServiceException() {
    if (this is DioError) {
      return (this as DioError).error is AppServiceException;
    }
    return false;
  }

  int AppServiceExceptionCode() {
    if (this.isAppServiceException()) {
      return ((this as DioError).error as AppServiceException).code;
    }
    return -1;
  }

  int errorCode() {
    if (isAppServiceException()) {
      return AppServiceExceptionCode();
    } else if (this is DioError) {
      final response = (this as DioError).response;
      if (response?.statusCode != null) {
        return response!.statusCode!;
      }
    }

    return -1;
  }

  String message() {
    if (isAppServiceException()) {
      return ((this as DioError).error as AppServiceException).message;
    } else if (this is DioError) {
      final response = (this as DioError).response;
      if (response?.statusMessage != null) {
        return response!.statusMessage!;
      }
    }

    // return this.toString();
    return '网络异常';
  }

  ///
  PageException pageException(
      {String? netErrorMsg,
      String? errorImgAssetName,
      String Function(int code)? msgByCodeCallback}) {
    PageState pageState = PageState.initializedState;
    NetError? netError = null;
    if (isIgnore()) {
      pageState = PageState.ignoreState;
    } else if (AppServiceExceptionCode() == knoMoreFootCode) {
      pageState = PageState.noMoreDataState;
    } else {
      String message = netErrorMsg ??
          ((msgByCodeCallback != null)
              ? msgByCodeCallback(errorCode())
              : this.message());

      pageState = PageState.errorState;
      netError =
          NetError(errorCode(), message, errorImgAssetName1: errorImgAssetName);
    }
    return PageException(
      pageState: pageState,
      netError: netError,
    );
  }

  ViewModelState pageExceptionState(ViewModelState viewModelState,
      {String? netErrorMsg,
      String? errorImgAssetName,
      String Function(int code)? msgByCodeCallback}) {
    PageException pageException = this.pageException(
        netErrorMsg: netErrorMsg,
        errorImgAssetName: errorImgAssetName,
        msgByCodeCallback: msgByCodeCallback);
    return viewModelState.copyWith(
        pageState: pageException.pageState, error: pageException.netError);
  }
}
