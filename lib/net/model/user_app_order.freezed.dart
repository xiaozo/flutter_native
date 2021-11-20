// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_app_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAppOrder _$UserAppOrderFromJson(Map<String, dynamic> json) {
  return _UserAppOrder.fromJson(json);
}

/// @nodoc
class _$UserAppOrderTearOff {
  const _$UserAppOrderTearOff();

  _UserAppOrder call(
      {String? order_id,
      String? total_pay,
      String? order_date_name,
      String? pay_countdown,
      List<UserObjectOrder>? object_data,
      String? discount_coupon_record_balance,
      @JsonKey(fromJson: anyToInt) int? order_status,
      @JsonKey(fromJson: anyToInt) int? order_time}) {
    return _UserAppOrder(
      order_id: order_id,
      total_pay: total_pay,
      order_date_name: order_date_name,
      pay_countdown: pay_countdown,
      object_data: object_data,
      discount_coupon_record_balance: discount_coupon_record_balance,
      order_status: order_status,
      order_time: order_time,
    );
  }

  UserAppOrder fromJson(Map<String, Object> json) {
    return UserAppOrder.fromJson(json);
  }
}

/// @nodoc
const $UserAppOrder = _$UserAppOrderTearOff();

/// @nodoc
mixin _$UserAppOrder {
  String? get order_id => throw _privateConstructorUsedError;
  String? get total_pay => throw _privateConstructorUsedError;
  String? get order_date_name => throw _privateConstructorUsedError;
  String? get pay_countdown => throw _privateConstructorUsedError;
  List<UserObjectOrder>? get object_data => throw _privateConstructorUsedError;
  String? get discount_coupon_record_balance =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: anyToInt)
  int? get order_status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: anyToInt)
  int? get order_time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAppOrderCopyWith<UserAppOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAppOrderCopyWith<$Res> {
  factory $UserAppOrderCopyWith(
          UserAppOrder value, $Res Function(UserAppOrder) then) =
      _$UserAppOrderCopyWithImpl<$Res>;
  $Res call(
      {String? order_id,
      String? total_pay,
      String? order_date_name,
      String? pay_countdown,
      List<UserObjectOrder>? object_data,
      String? discount_coupon_record_balance,
      @JsonKey(fromJson: anyToInt) int? order_status,
      @JsonKey(fromJson: anyToInt) int? order_time});
}

/// @nodoc
class _$UserAppOrderCopyWithImpl<$Res> implements $UserAppOrderCopyWith<$Res> {
  _$UserAppOrderCopyWithImpl(this._value, this._then);

  final UserAppOrder _value;
  // ignore: unused_field
  final $Res Function(UserAppOrder) _then;

  @override
  $Res call({
    Object? order_id = freezed,
    Object? total_pay = freezed,
    Object? order_date_name = freezed,
    Object? pay_countdown = freezed,
    Object? object_data = freezed,
    Object? discount_coupon_record_balance = freezed,
    Object? order_status = freezed,
    Object? order_time = freezed,
  }) {
    return _then(_value.copyWith(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      total_pay: total_pay == freezed
          ? _value.total_pay
          : total_pay // ignore: cast_nullable_to_non_nullable
              as String?,
      order_date_name: order_date_name == freezed
          ? _value.order_date_name
          : order_date_name // ignore: cast_nullable_to_non_nullable
              as String?,
      pay_countdown: pay_countdown == freezed
          ? _value.pay_countdown
          : pay_countdown // ignore: cast_nullable_to_non_nullable
              as String?,
      object_data: object_data == freezed
          ? _value.object_data
          : object_data // ignore: cast_nullable_to_non_nullable
              as List<UserObjectOrder>?,
      discount_coupon_record_balance: discount_coupon_record_balance == freezed
          ? _value.discount_coupon_record_balance
          : discount_coupon_record_balance // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status: order_status == freezed
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as int?,
      order_time: order_time == freezed
          ? _value.order_time
          : order_time // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UserAppOrderCopyWith<$Res>
    implements $UserAppOrderCopyWith<$Res> {
  factory _$UserAppOrderCopyWith(
          _UserAppOrder value, $Res Function(_UserAppOrder) then) =
      __$UserAppOrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? order_id,
      String? total_pay,
      String? order_date_name,
      String? pay_countdown,
      List<UserObjectOrder>? object_data,
      String? discount_coupon_record_balance,
      @JsonKey(fromJson: anyToInt) int? order_status,
      @JsonKey(fromJson: anyToInt) int? order_time});
}

/// @nodoc
class __$UserAppOrderCopyWithImpl<$Res> extends _$UserAppOrderCopyWithImpl<$Res>
    implements _$UserAppOrderCopyWith<$Res> {
  __$UserAppOrderCopyWithImpl(
      _UserAppOrder _value, $Res Function(_UserAppOrder) _then)
      : super(_value, (v) => _then(v as _UserAppOrder));

  @override
  _UserAppOrder get _value => super._value as _UserAppOrder;

  @override
  $Res call({
    Object? order_id = freezed,
    Object? total_pay = freezed,
    Object? order_date_name = freezed,
    Object? pay_countdown = freezed,
    Object? object_data = freezed,
    Object? discount_coupon_record_balance = freezed,
    Object? order_status = freezed,
    Object? order_time = freezed,
  }) {
    return _then(_UserAppOrder(
      order_id: order_id == freezed
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      total_pay: total_pay == freezed
          ? _value.total_pay
          : total_pay // ignore: cast_nullable_to_non_nullable
              as String?,
      order_date_name: order_date_name == freezed
          ? _value.order_date_name
          : order_date_name // ignore: cast_nullable_to_non_nullable
              as String?,
      pay_countdown: pay_countdown == freezed
          ? _value.pay_countdown
          : pay_countdown // ignore: cast_nullable_to_non_nullable
              as String?,
      object_data: object_data == freezed
          ? _value.object_data
          : object_data // ignore: cast_nullable_to_non_nullable
              as List<UserObjectOrder>?,
      discount_coupon_record_balance: discount_coupon_record_balance == freezed
          ? _value.discount_coupon_record_balance
          : discount_coupon_record_balance // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status: order_status == freezed
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as int?,
      order_time: order_time == freezed
          ? _value.order_time
          : order_time // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserAppOrder with DiagnosticableTreeMixin implements _UserAppOrder {
  _$_UserAppOrder(
      {this.order_id,
      this.total_pay,
      this.order_date_name,
      this.pay_countdown,
      this.object_data,
      this.discount_coupon_record_balance,
      @JsonKey(fromJson: anyToInt) this.order_status,
      @JsonKey(fromJson: anyToInt) this.order_time});

  factory _$_UserAppOrder.fromJson(Map<String, dynamic> json) =>
      _$_$_UserAppOrderFromJson(json);

  @override
  final String? order_id;
  @override
  final String? total_pay;
  @override
  final String? order_date_name;
  @override
  final String? pay_countdown;
  @override
  final List<UserObjectOrder>? object_data;
  @override
  final String? discount_coupon_record_balance;
  @override
  @JsonKey(fromJson: anyToInt)
  final int? order_status;
  @override
  @JsonKey(fromJson: anyToInt)
  final int? order_time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserAppOrder(order_id: $order_id, total_pay: $total_pay, order_date_name: $order_date_name, pay_countdown: $pay_countdown, object_data: $object_data, discount_coupon_record_balance: $discount_coupon_record_balance, order_status: $order_status, order_time: $order_time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserAppOrder'))
      ..add(DiagnosticsProperty('order_id', order_id))
      ..add(DiagnosticsProperty('total_pay', total_pay))
      ..add(DiagnosticsProperty('order_date_name', order_date_name))
      ..add(DiagnosticsProperty('pay_countdown', pay_countdown))
      ..add(DiagnosticsProperty('object_data', object_data))
      ..add(DiagnosticsProperty(
          'discount_coupon_record_balance', discount_coupon_record_balance))
      ..add(DiagnosticsProperty('order_status', order_status))
      ..add(DiagnosticsProperty('order_time', order_time));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserAppOrder &&
            (identical(other.order_id, order_id) ||
                const DeepCollectionEquality()
                    .equals(other.order_id, order_id)) &&
            (identical(other.total_pay, total_pay) ||
                const DeepCollectionEquality()
                    .equals(other.total_pay, total_pay)) &&
            (identical(other.order_date_name, order_date_name) ||
                const DeepCollectionEquality()
                    .equals(other.order_date_name, order_date_name)) &&
            (identical(other.pay_countdown, pay_countdown) ||
                const DeepCollectionEquality()
                    .equals(other.pay_countdown, pay_countdown)) &&
            (identical(other.object_data, object_data) ||
                const DeepCollectionEquality()
                    .equals(other.object_data, object_data)) &&
            (identical(other.discount_coupon_record_balance,
                    discount_coupon_record_balance) ||
                const DeepCollectionEquality().equals(
                    other.discount_coupon_record_balance,
                    discount_coupon_record_balance)) &&
            (identical(other.order_status, order_status) ||
                const DeepCollectionEquality()
                    .equals(other.order_status, order_status)) &&
            (identical(other.order_time, order_time) ||
                const DeepCollectionEquality()
                    .equals(other.order_time, order_time)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(order_id) ^
      const DeepCollectionEquality().hash(total_pay) ^
      const DeepCollectionEquality().hash(order_date_name) ^
      const DeepCollectionEquality().hash(pay_countdown) ^
      const DeepCollectionEquality().hash(object_data) ^
      const DeepCollectionEquality().hash(discount_coupon_record_balance) ^
      const DeepCollectionEquality().hash(order_status) ^
      const DeepCollectionEquality().hash(order_time);

  @JsonKey(ignore: true)
  @override
  _$UserAppOrderCopyWith<_UserAppOrder> get copyWith =>
      __$UserAppOrderCopyWithImpl<_UserAppOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserAppOrderToJson(this);
  }
}

abstract class _UserAppOrder implements UserAppOrder {
  factory _UserAppOrder(
      {String? order_id,
      String? total_pay,
      String? order_date_name,
      String? pay_countdown,
      List<UserObjectOrder>? object_data,
      String? discount_coupon_record_balance,
      @JsonKey(fromJson: anyToInt) int? order_status,
      @JsonKey(fromJson: anyToInt) int? order_time}) = _$_UserAppOrder;

  factory _UserAppOrder.fromJson(Map<String, dynamic> json) =
      _$_UserAppOrder.fromJson;

  @override
  String? get order_id => throw _privateConstructorUsedError;
  @override
  String? get total_pay => throw _privateConstructorUsedError;
  @override
  String? get order_date_name => throw _privateConstructorUsedError;
  @override
  String? get pay_countdown => throw _privateConstructorUsedError;
  @override
  List<UserObjectOrder>? get object_data => throw _privateConstructorUsedError;
  @override
  String? get discount_coupon_record_balance =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: anyToInt)
  int? get order_status => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: anyToInt)
  int? get order_time => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserAppOrderCopyWith<_UserAppOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
