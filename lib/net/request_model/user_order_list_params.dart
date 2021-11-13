import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_order_list_params.freezed.dart';
part 'user_order_list_params.g.dart';

@freezed
class UserOrderListParams with _$UserOrderListParams {
  factory UserOrderListParams({
    String? order_status,
    String? page_num,
    String? page_size,
    @Default("1") String? is_show_recharge_unpaid,
  }) = _UserOrderListParams;

  factory UserOrderListParams.fromJson(Map<String, dynamic> json) =>
      _$UserOrderListParamsFromJson(json);
}
