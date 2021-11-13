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
      {String? total_pay,
      String? pay_countdown,
      List<UserObjectOrder>? object_data,
      String? discount_coupon_record_balance}) {
    return _UserAppOrder(
      total_pay: total_pay,
      pay_countdown: pay_countdown,
      object_data: object_data,
      discount_coupon_record_balance: discount_coupon_record_balance,
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
  String? get total_pay => throw _privateConstructorUsedError;
  String? get pay_countdown => throw _privateConstructorUsedError;
  List<UserObjectOrder>? get object_data => throw _privateConstructorUsedError;
  String? get discount_coupon_record_balance =>
      throw _privateConstructorUsedError;

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
      {String? total_pay,
      String? pay_countdown,
      List<UserObjectOrder>? object_data,
      String? discount_coupon_record_balance});
}

/// @nodoc
class _$UserAppOrderCopyWithImpl<$Res> implements $UserAppOrderCopyWith<$Res> {
  _$UserAppOrderCopyWithImpl(this._value, this._then);

  final UserAppOrder _value;
  // ignore: unused_field
  final $Res Function(UserAppOrder) _then;

  @override
  $Res call({
    Object? total_pay = freezed,
    Object? pay_countdown = freezed,
    Object? object_data = freezed,
    Object? discount_coupon_record_balance = freezed,
  }) {
    return _then(_value.copyWith(
      total_pay: total_pay == freezed
          ? _value.total_pay
          : total_pay // ignore: cast_nullable_to_non_nullable
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
      {String? total_pay,
      String? pay_countdown,
      List<UserObjectOrder>? object_data,
      String? discount_coupon_record_balance});
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
    Object? total_pay = freezed,
    Object? pay_countdown = freezed,
    Object? object_data = freezed,
    Object? discount_coupon_record_balance = freezed,
  }) {
    return _then(_UserAppOrder(
      total_pay: total_pay == freezed
          ? _value.total_pay
          : total_pay // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserAppOrder with DiagnosticableTreeMixin implements _UserAppOrder {
  _$_UserAppOrder(
      {this.total_pay,
      this.pay_countdown,
      this.object_data,
      this.discount_coupon_record_balance});

  factory _$_UserAppOrder.fromJson(Map<String, dynamic> json) =>
      _$_$_UserAppOrderFromJson(json);

  @override
  final String? total_pay;
  @override
  final String? pay_countdown;
  @override
  final List<UserObjectOrder>? object_data;
  @override
  final String? discount_coupon_record_balance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserAppOrder(total_pay: $total_pay, pay_countdown: $pay_countdown, object_data: $object_data, discount_coupon_record_balance: $discount_coupon_record_balance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserAppOrder'))
      ..add(DiagnosticsProperty('total_pay', total_pay))
      ..add(DiagnosticsProperty('pay_countdown', pay_countdown))
      ..add(DiagnosticsProperty('object_data', object_data))
      ..add(DiagnosticsProperty(
          'discount_coupon_record_balance', discount_coupon_record_balance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserAppOrder &&
            (identical(other.total_pay, total_pay) ||
                const DeepCollectionEquality()
                    .equals(other.total_pay, total_pay)) &&
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
                    discount_coupon_record_balance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(total_pay) ^
      const DeepCollectionEquality().hash(pay_countdown) ^
      const DeepCollectionEquality().hash(object_data) ^
      const DeepCollectionEquality().hash(discount_coupon_record_balance);

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
      {String? total_pay,
      String? pay_countdown,
      List<UserObjectOrder>? object_data,
      String? discount_coupon_record_balance}) = _$_UserAppOrder;

  factory _UserAppOrder.fromJson(Map<String, dynamic> json) =
      _$_UserAppOrder.fromJson;

  @override
  String? get total_pay => throw _privateConstructorUsedError;
  @override
  String? get pay_countdown => throw _privateConstructorUsedError;
  @override
  List<UserObjectOrder>? get object_data => throw _privateConstructorUsedError;
  @override
  String? get discount_coupon_record_balance =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserAppOrderCopyWith<_UserAppOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
