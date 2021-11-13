// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_order_list_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserOrderListParams _$UserOrderListParamsFromJson(Map<String, dynamic> json) {
  return _UserOrderListParams.fromJson(json);
}

/// @nodoc
class _$UserOrderListParamsTearOff {
  const _$UserOrderListParamsTearOff();

  _UserOrderListParams call(
      {String? order_status,
      String? page_num,
      String? page_size,
      String? is_show_recharge_unpaid = "1"}) {
    return _UserOrderListParams(
      order_status: order_status,
      page_num: page_num,
      page_size: page_size,
      is_show_recharge_unpaid: is_show_recharge_unpaid,
    );
  }

  UserOrderListParams fromJson(Map<String, Object> json) {
    return UserOrderListParams.fromJson(json);
  }
}

/// @nodoc
const $UserOrderListParams = _$UserOrderListParamsTearOff();

/// @nodoc
mixin _$UserOrderListParams {
  String? get order_status => throw _privateConstructorUsedError;
  String? get page_num => throw _privateConstructorUsedError;
  String? get page_size => throw _privateConstructorUsedError;
  String? get is_show_recharge_unpaid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserOrderListParamsCopyWith<UserOrderListParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOrderListParamsCopyWith<$Res> {
  factory $UserOrderListParamsCopyWith(
          UserOrderListParams value, $Res Function(UserOrderListParams) then) =
      _$UserOrderListParamsCopyWithImpl<$Res>;
  $Res call(
      {String? order_status,
      String? page_num,
      String? page_size,
      String? is_show_recharge_unpaid});
}

/// @nodoc
class _$UserOrderListParamsCopyWithImpl<$Res>
    implements $UserOrderListParamsCopyWith<$Res> {
  _$UserOrderListParamsCopyWithImpl(this._value, this._then);

  final UserOrderListParams _value;
  // ignore: unused_field
  final $Res Function(UserOrderListParams) _then;

  @override
  $Res call({
    Object? order_status = freezed,
    Object? page_num = freezed,
    Object? page_size = freezed,
    Object? is_show_recharge_unpaid = freezed,
  }) {
    return _then(_value.copyWith(
      order_status: order_status == freezed
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as String?,
      page_num: page_num == freezed
          ? _value.page_num
          : page_num // ignore: cast_nullable_to_non_nullable
              as String?,
      page_size: page_size == freezed
          ? _value.page_size
          : page_size // ignore: cast_nullable_to_non_nullable
              as String?,
      is_show_recharge_unpaid: is_show_recharge_unpaid == freezed
          ? _value.is_show_recharge_unpaid
          : is_show_recharge_unpaid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserOrderListParamsCopyWith<$Res>
    implements $UserOrderListParamsCopyWith<$Res> {
  factory _$UserOrderListParamsCopyWith(_UserOrderListParams value,
          $Res Function(_UserOrderListParams) then) =
      __$UserOrderListParamsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? order_status,
      String? page_num,
      String? page_size,
      String? is_show_recharge_unpaid});
}

/// @nodoc
class __$UserOrderListParamsCopyWithImpl<$Res>
    extends _$UserOrderListParamsCopyWithImpl<$Res>
    implements _$UserOrderListParamsCopyWith<$Res> {
  __$UserOrderListParamsCopyWithImpl(
      _UserOrderListParams _value, $Res Function(_UserOrderListParams) _then)
      : super(_value, (v) => _then(v as _UserOrderListParams));

  @override
  _UserOrderListParams get _value => super._value as _UserOrderListParams;

  @override
  $Res call({
    Object? order_status = freezed,
    Object? page_num = freezed,
    Object? page_size = freezed,
    Object? is_show_recharge_unpaid = freezed,
  }) {
    return _then(_UserOrderListParams(
      order_status: order_status == freezed
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as String?,
      page_num: page_num == freezed
          ? _value.page_num
          : page_num // ignore: cast_nullable_to_non_nullable
              as String?,
      page_size: page_size == freezed
          ? _value.page_size
          : page_size // ignore: cast_nullable_to_non_nullable
              as String?,
      is_show_recharge_unpaid: is_show_recharge_unpaid == freezed
          ? _value.is_show_recharge_unpaid
          : is_show_recharge_unpaid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserOrderListParams
    with DiagnosticableTreeMixin
    implements _UserOrderListParams {
  _$_UserOrderListParams(
      {this.order_status,
      this.page_num,
      this.page_size,
      this.is_show_recharge_unpaid = "1"});

  factory _$_UserOrderListParams.fromJson(Map<String, dynamic> json) =>
      _$_$_UserOrderListParamsFromJson(json);

  @override
  final String? order_status;
  @override
  final String? page_num;
  @override
  final String? page_size;
  @JsonKey(defaultValue: "1")
  @override
  final String? is_show_recharge_unpaid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserOrderListParams(order_status: $order_status, page_num: $page_num, page_size: $page_size, is_show_recharge_unpaid: $is_show_recharge_unpaid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserOrderListParams'))
      ..add(DiagnosticsProperty('order_status', order_status))
      ..add(DiagnosticsProperty('page_num', page_num))
      ..add(DiagnosticsProperty('page_size', page_size))
      ..add(DiagnosticsProperty(
          'is_show_recharge_unpaid', is_show_recharge_unpaid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserOrderListParams &&
            (identical(other.order_status, order_status) ||
                const DeepCollectionEquality()
                    .equals(other.order_status, order_status)) &&
            (identical(other.page_num, page_num) ||
                const DeepCollectionEquality()
                    .equals(other.page_num, page_num)) &&
            (identical(other.page_size, page_size) ||
                const DeepCollectionEquality()
                    .equals(other.page_size, page_size)) &&
            (identical(
                    other.is_show_recharge_unpaid, is_show_recharge_unpaid) ||
                const DeepCollectionEquality().equals(
                    other.is_show_recharge_unpaid, is_show_recharge_unpaid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(order_status) ^
      const DeepCollectionEquality().hash(page_num) ^
      const DeepCollectionEquality().hash(page_size) ^
      const DeepCollectionEquality().hash(is_show_recharge_unpaid);

  @JsonKey(ignore: true)
  @override
  _$UserOrderListParamsCopyWith<_UserOrderListParams> get copyWith =>
      __$UserOrderListParamsCopyWithImpl<_UserOrderListParams>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserOrderListParamsToJson(this);
  }
}

abstract class _UserOrderListParams implements UserOrderListParams {
  factory _UserOrderListParams(
      {String? order_status,
      String? page_num,
      String? page_size,
      String? is_show_recharge_unpaid}) = _$_UserOrderListParams;

  factory _UserOrderListParams.fromJson(Map<String, dynamic> json) =
      _$_UserOrderListParams.fromJson;

  @override
  String? get order_status => throw _privateConstructorUsedError;
  @override
  String? get page_num => throw _privateConstructorUsedError;
  @override
  String? get page_size => throw _privateConstructorUsedError;
  @override
  String? get is_show_recharge_unpaid => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserOrderListParamsCopyWith<_UserOrderListParams> get copyWith =>
      throw _privateConstructorUsedError;
}
