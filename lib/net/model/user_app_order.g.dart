// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_app_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAppOrder _$_$_UserAppOrderFromJson(Map<String, dynamic> json) {
  return _$_UserAppOrder(
    order_id: json['order_id'] as String?,
    total_pay: json['total_pay'] as String?,
    order_date_name: json['order_date_name'] as String?,
    pay_countdown: json['pay_countdown'] as String?,
    object_data: (json['object_data'] as List<dynamic>?)
        ?.map((e) => UserObjectOrder.fromJson(e as Map<String, dynamic>))
        .toList(),
    discount_coupon_record_balance:
        json['discount_coupon_record_balance'] as String?,
    order_status: anyToInt(json['order_status']),
  );
}

Map<String, dynamic> _$_$_UserAppOrderToJson(_$_UserAppOrder instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'total_pay': instance.total_pay,
      'order_date_name': instance.order_date_name,
      'pay_countdown': instance.pay_countdown,
      'object_data': instance.object_data,
      'discount_coupon_record_balance': instance.discount_coupon_record_balance,
      'order_status': instance.order_status,
    };
