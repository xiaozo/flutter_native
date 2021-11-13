// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_object_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserObjectOrder _$UserObjectOrderFromJson(Map<String, dynamic> json) {
  return _UserObjectOrder.fromJson(json);
}

/// @nodoc
class _$UserObjectOrderTearOff {
  const _$UserObjectOrderTearOff();

  _UserObjectOrder call(
      {String? total_pay,
      String? pay_countdown,
      String? student_good_id,
      String? discount_coupon_record_balance}) {
    return _UserObjectOrder(
      total_pay: total_pay,
      pay_countdown: pay_countdown,
      student_good_id: student_good_id,
      discount_coupon_record_balance: discount_coupon_record_balance,
    );
  }

  UserObjectOrder fromJson(Map<String, Object> json) {
    return UserObjectOrder.fromJson(json);
  }
}

/// @nodoc
const $UserObjectOrder = _$UserObjectOrderTearOff();

/// @nodoc
mixin _$UserObjectOrder {
  String? get total_pay => throw _privateConstructorUsedError;
  String? get pay_countdown => throw _privateConstructorUsedError;
  String? get student_good_id => throw _privateConstructorUsedError;
  String? get discount_coupon_record_balance =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserObjectOrderCopyWith<UserObjectOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserObjectOrderCopyWith<$Res> {
  factory $UserObjectOrderCopyWith(
          UserObjectOrder value, $Res Function(UserObjectOrder) then) =
      _$UserObjectOrderCopyWithImpl<$Res>;
  $Res call(
      {String? total_pay,
      String? pay_countdown,
      String? student_good_id,
      String? discount_coupon_record_balance});
}

/// @nodoc
class _$UserObjectOrderCopyWithImpl<$Res>
    implements $UserObjectOrderCopyWith<$Res> {
  _$UserObjectOrderCopyWithImpl(this._value, this._then);

  final UserObjectOrder _value;
  // ignore: unused_field
  final $Res Function(UserObjectOrder) _then;

  @override
  $Res call({
    Object? total_pay = freezed,
    Object? pay_countdown = freezed,
    Object? student_good_id = freezed,
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
      student_good_id: student_good_id == freezed
          ? _value.student_good_id
          : student_good_id // ignore: cast_nullable_to_non_nullable
              as String?,
      discount_coupon_record_balance: discount_coupon_record_balance == freezed
          ? _value.discount_coupon_record_balance
          : discount_coupon_record_balance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserObjectOrderCopyWith<$Res>
    implements $UserObjectOrderCopyWith<$Res> {
  factory _$UserObjectOrderCopyWith(
          _UserObjectOrder value, $Res Function(_UserObjectOrder) then) =
      __$UserObjectOrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? total_pay,
      String? pay_countdown,
      String? student_good_id,
      String? discount_coupon_record_balance});
}

/// @nodoc
class __$UserObjectOrderCopyWithImpl<$Res>
    extends _$UserObjectOrderCopyWithImpl<$Res>
    implements _$UserObjectOrderCopyWith<$Res> {
  __$UserObjectOrderCopyWithImpl(
      _UserObjectOrder _value, $Res Function(_UserObjectOrder) _then)
      : super(_value, (v) => _then(v as _UserObjectOrder));

  @override
  _UserObjectOrder get _value => super._value as _UserObjectOrder;

  @override
  $Res call({
    Object? total_pay = freezed,
    Object? pay_countdown = freezed,
    Object? student_good_id = freezed,
    Object? discount_coupon_record_balance = freezed,
  }) {
    return _then(_UserObjectOrder(
      total_pay: total_pay == freezed
          ? _value.total_pay
          : total_pay // ignore: cast_nullable_to_non_nullable
              as String?,
      pay_countdown: pay_countdown == freezed
          ? _value.pay_countdown
          : pay_countdown // ignore: cast_nullable_to_non_nullable
              as String?,
      student_good_id: student_good_id == freezed
          ? _value.student_good_id
          : student_good_id // ignore: cast_nullable_to_non_nullable
              as String?,
      discount_coupon_record_balance: discount_coupon_record_balance == freezed
          ? _value.discount_coupon_record_balance
          : discount_coupon_record_balance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserObjectOrder
    with DiagnosticableTreeMixin
    implements _UserObjectOrder {
  _$_UserObjectOrder(
      {this.total_pay,
      this.pay_countdown,
      this.student_good_id,
      this.discount_coupon_record_balance});

  factory _$_UserObjectOrder.fromJson(Map<String, dynamic> json) =>
      _$_$_UserObjectOrderFromJson(json);

  @override
  final String? total_pay;
  @override
  final String? pay_countdown;
  @override
  final String? student_good_id;
  @override
  final String? discount_coupon_record_balance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserObjectOrder(total_pay: $total_pay, pay_countdown: $pay_countdown, student_good_id: $student_good_id, discount_coupon_record_balance: $discount_coupon_record_balance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserObjectOrder'))
      ..add(DiagnosticsProperty('total_pay', total_pay))
      ..add(DiagnosticsProperty('pay_countdown', pay_countdown))
      ..add(DiagnosticsProperty('student_good_id', student_good_id))
      ..add(DiagnosticsProperty(
          'discount_coupon_record_balance', discount_coupon_record_balance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserObjectOrder &&
            (identical(other.total_pay, total_pay) ||
                const DeepCollectionEquality()
                    .equals(other.total_pay, total_pay)) &&
            (identical(other.pay_countdown, pay_countdown) ||
                const DeepCollectionEquality()
                    .equals(other.pay_countdown, pay_countdown)) &&
            (identical(other.student_good_id, student_good_id) ||
                const DeepCollectionEquality()
                    .equals(other.student_good_id, student_good_id)) &&
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
      const DeepCollectionEquality().hash(student_good_id) ^
      const DeepCollectionEquality().hash(discount_coupon_record_balance);

  @JsonKey(ignore: true)
  @override
  _$UserObjectOrderCopyWith<_UserObjectOrder> get copyWith =>
      __$UserObjectOrderCopyWithImpl<_UserObjectOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserObjectOrderToJson(this);
  }
}

abstract class _UserObjectOrder implements UserObjectOrder {
  factory _UserObjectOrder(
      {String? total_pay,
      String? pay_countdown,
      String? student_good_id,
      String? discount_coupon_record_balance}) = _$_UserObjectOrder;

  factory _UserObjectOrder.fromJson(Map<String, dynamic> json) =
      _$_UserObjectOrder.fromJson;

  @override
  String? get total_pay => throw _privateConstructorUsedError;
  @override
  String? get pay_countdown => throw _privateConstructorUsedError;
  @override
  String? get student_good_id => throw _privateConstructorUsedError;
  @override
  String? get discount_coupon_record_balance =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserObjectOrderCopyWith<_UserObjectOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
