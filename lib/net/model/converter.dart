import 'package:supercharged/supercharged.dart';

// @JsonKey(fromJson: anyToString)
// @JsonKey(fromJson: anyToInt)

int? anyToInt(dynamic? v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is String) return v.toInt();

  return null;
}

String? anyToString(dynamic? v) {
  if (v == null) return null;
  if (v is String) return v;
  if (v is int) return v.toString();

  return v.toString();
}
