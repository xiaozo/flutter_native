import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_object_order.freezed.dart';
part 'user_object_order.g.dart';

@freezed
class UserObjectOrder with _$UserObjectOrder {
  factory UserObjectOrder({
    String? object_name,
    String? object_subtitle,
    String? fee,
  }) = _UserObjectOrder;

  factory UserObjectOrder.fromJson(Map<String, dynamic> json) =>
      _$UserObjectOrderFromJson(json);
}
