import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_object_order.freezed.dart';
part 'user_object_order.g.dart';

@freezed
class UserObjectOrder with _$UserObjectOrder {
  factory UserObjectOrder({
    String? total_pay,
    String? pay_countdown,
    String? student_good_id,
    String? discount_coupon_record_balance,
  }) = _UserObjectOrder;

  factory UserObjectOrder.fromJson(Map<String, dynamic> json) =>
      _$UserObjectOrderFromJson(json);
}
