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
      {String? object_name, String? object_subtitle, String? fee}) {
    return _UserObjectOrder(
      object_name: object_name,
      object_subtitle: object_subtitle,
      fee: fee,
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
  String? get object_name => throw _privateConstructorUsedError;
  String? get object_subtitle => throw _privateConstructorUsedError;
  String? get fee => throw _privateConstructorUsedError;

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
  $Res call({String? object_name, String? object_subtitle, String? fee});
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
    Object? object_name = freezed,
    Object? object_subtitle = freezed,
    Object? fee = freezed,
  }) {
    return _then(_value.copyWith(
      object_name: object_name == freezed
          ? _value.object_name
          : object_name // ignore: cast_nullable_to_non_nullable
              as String?,
      object_subtitle: object_subtitle == freezed
          ? _value.object_subtitle
          : object_subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
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
  $Res call({String? object_name, String? object_subtitle, String? fee});
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
    Object? object_name = freezed,
    Object? object_subtitle = freezed,
    Object? fee = freezed,
  }) {
    return _then(_UserObjectOrder(
      object_name: object_name == freezed
          ? _value.object_name
          : object_name // ignore: cast_nullable_to_non_nullable
              as String?,
      object_subtitle: object_subtitle == freezed
          ? _value.object_subtitle
          : object_subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserObjectOrder
    with DiagnosticableTreeMixin
    implements _UserObjectOrder {
  _$_UserObjectOrder({this.object_name, this.object_subtitle, this.fee});

  factory _$_UserObjectOrder.fromJson(Map<String, dynamic> json) =>
      _$_$_UserObjectOrderFromJson(json);

  @override
  final String? object_name;
  @override
  final String? object_subtitle;
  @override
  final String? fee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserObjectOrder(object_name: $object_name, object_subtitle: $object_subtitle, fee: $fee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserObjectOrder'))
      ..add(DiagnosticsProperty('object_name', object_name))
      ..add(DiagnosticsProperty('object_subtitle', object_subtitle))
      ..add(DiagnosticsProperty('fee', fee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserObjectOrder &&
            (identical(other.object_name, object_name) ||
                const DeepCollectionEquality()
                    .equals(other.object_name, object_name)) &&
            (identical(other.object_subtitle, object_subtitle) ||
                const DeepCollectionEquality()
                    .equals(other.object_subtitle, object_subtitle)) &&
            (identical(other.fee, fee) ||
                const DeepCollectionEquality().equals(other.fee, fee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object_name) ^
      const DeepCollectionEquality().hash(object_subtitle) ^
      const DeepCollectionEquality().hash(fee);

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
      {String? object_name,
      String? object_subtitle,
      String? fee}) = _$_UserObjectOrder;

  factory _UserObjectOrder.fromJson(Map<String, dynamic> json) =
      _$_UserObjectOrder.fromJson;

  @override
  String? get object_name => throw _privateConstructorUsedError;
  @override
  String? get object_subtitle => throw _privateConstructorUsedError;
  @override
  String? get fee => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserObjectOrderCopyWith<_UserObjectOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
