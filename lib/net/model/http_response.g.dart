// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiResponse<T> _$HiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return HiResponse<T>(
    error_code: json['error_code'] as int?,
    message: json['message'] as String?,
    data: _$nullableGenericFromJson(json['data'], fromJsonT),
  );
}

Map<String, dynamic> _$HiResponseToJson<T>(
  HiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
