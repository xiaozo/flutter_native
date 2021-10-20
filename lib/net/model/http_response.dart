import 'package:json_annotation/json_annotation.dart';

part 'http_response.g.dart';

// 背景: https://github.com/trevorwang/retrofit.dart/issues/292
@JsonSerializable(genericArgumentFactories: true)
class HiResponse<T> {
  // ignore: non_constant_identifier_names
  int? error_code;
  String? message;
  T? data;
  // ignore: non_constant_identifier_names
  HiResponse({this.error_code, this.message, this.data});

  factory HiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$HiResponseFromJson(json, fromJsonT);

  // Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
  //     _$HiResponseToJson(this, toJsonT);
}
