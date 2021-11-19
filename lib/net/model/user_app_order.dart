import 'package:flutter_deerclass/net/model/user_object_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:supercharged/supercharged.dart';

import 'converter.dart';

part 'user_app_order.freezed.dart';
part 'user_app_order.g.dart';

@freezed
class UserAppOrder with _$UserAppOrder {
  factory UserAppOrder({
    String? order_id,
    String? total_pay,
    String? order_date_name,
    String? pay_countdown,
    List<UserObjectOrder>? object_data,
    String? discount_coupon_record_balance,
    @JsonKey(fromJson: anyToInt) int? order_status,
  }) = _UserAppOrder;

  factory UserAppOrder.fromJson(Map<String, dynamic> json) =>
      _$UserAppOrderFromJson(json);
}
