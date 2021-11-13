// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_order_list_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserOrderListParams _$_$_UserOrderListParamsFromJson(
    Map<String, dynamic> json) {
  return _$_UserOrderListParams(
    order_status: json['order_status'] as String?,
    page_num: json['page_num'] as String?,
    page_size: json['page_size'] as String?,
    is_show_recharge_unpaid: json['is_show_recharge_unpaid'] as String? ?? '1',
  );
}

Map<String, dynamic> _$_$_UserOrderListParamsToJson(
        _$_UserOrderListParams instance) =>
    <String, dynamic>{
      'order_status': instance.order_status,
      'page_num': instance.page_num,
      'page_size': instance.page_size,
      'is_show_recharge_unpaid': instance.is_show_recharge_unpaid,
    };
