import 'package:flutter_deerclass/net/request_model/page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_order_list_params.freezed.dart';
part 'user_order_list_params.g.dart';

@freezed
class UserOrderListParams with _$UserOrderListParams {
  @With(PageParams)
  factory UserOrderListParams({
    String? order_status,
    @Default("1") String page_number,
    @Default("10") String page_size,
    @Default("1") String? is_show_recharge_unpaid,
  }) = _UserOrderListParams;

  factory UserOrderListParams.fromJson(Map<String, dynamic> json) =>
      _$UserOrderListParamsFromJson(json);
}
