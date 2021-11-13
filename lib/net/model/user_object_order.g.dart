// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_object_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserObjectOrder _$_$_UserObjectOrderFromJson(Map<String, dynamic> json) {
  return _$_UserObjectOrder(
    total_pay: json['total_pay'] as String?,
    pay_countdown: json['pay_countdown'] as String?,
    student_good_id: json['student_good_id'] as String?,
    discount_coupon_record_balance:
        json['discount_coupon_record_balance'] as String?,
  );
}

Map<String, dynamic> _$_$_UserObjectOrderToJson(_$_UserObjectOrder instance) =>
    <String, dynamic>{
      'total_pay': instance.total_pay,
      'pay_countdown': instance.pay_countdown,
      'student_good_id': instance.student_good_id,
      'discount_coupon_record_balance': instance.discount_coupon_record_balance,
    };
