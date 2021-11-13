import 'package:dio/dio.dart';
import 'package:flutter_deerclass/net/request_model/user_order_list_params.dart';
import 'package:retrofit/retrofit.dart';

import 'model/http_response.dart';
import 'model/user_app_order.dart';

part 'rest_api.g.dart';

// 签名不考虑包体, 比如文件上传等
const String skipSignBodyHeader = "skip_sign_body";

// 网络接口
@RestApi(baseUrl: "")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("userorder/userOrderList")
  @FormUrlEncoded()
  Future<List<UserAppOrder>> getUserOrderList(
      @Body() UserOrderListParams params,
      [@CancelRequest() CancelToken? cancelToken]);
}
