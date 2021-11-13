import 'package:flutter_deerclass/net/model/user_object_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_app_order.freezed.dart';
part 'user_app_order.g.dart';

@freezed
class UserAppOrder with _$UserAppOrder {
  factory UserAppOrder({
    String? total_pay,
    String? pay_countdown,
    List<UserObjectOrder>? object_data,
    String? discount_coupon_record_balance,
  }) = _UserAppOrder;

  factory UserAppOrder.fromJson(Map<String, dynamic> json) =>
      _$UserAppOrderFromJson(json);
}
