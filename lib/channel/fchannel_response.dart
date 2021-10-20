// @dart=2.9
class FChannelResponse {
  Map<Object, Object> result;
  int get code => int.parse(result["error_code"] as String);
  Map<dynamic, dynamic> get data => result["data"] as Map<dynamic, dynamic>;
  Object encode() {
    final Map<Object, Object> pigeonMap = <Object, Object>{};
    pigeonMap['result'] = result;
    return pigeonMap;
  }

  static FChannelResponse decode(Object message) {
    final Map<Object, Object> pigeonMap = message as Map<Object, Object>;
    return FChannelResponse()
      ..result = pigeonMap['result'] as Map<Object, Object>;
  }
}
