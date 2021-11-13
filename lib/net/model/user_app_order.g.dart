// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_app_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAppOrder _$_$_UserAppOrderFromJson(Map<String, dynamic> json) {
  return _$_UserAppOrder(
    total_pay: json['total_pay'] as String?,
    pay_countdown: json['pay_countdown'] as String?,
    object_data: (json['object_data'] as List<dynamic>?)
        ?.map((e) => UserObjectOrder.fromJson(e as Map<String, dynamic>))
        .toList(),
    discount_coupon_record_balance:
        json['discount_coupon_record_balance'] as String?,
  );
}

Map<String, dynamic> _$_$_UserAppOrderToJson(_$_UserAppOrder instance) =>
    <String, dynamic>{
      'total_pay': instance.total_pay,
      'pay_countdown': instance.pay_countdown,
      'object_data': instance.object_data,
      'discount_coupon_record_balance': instance.discount_coupon_record_balance,
    };
