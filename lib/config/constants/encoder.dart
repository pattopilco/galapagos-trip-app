import 'dart:convert';

class Encoder {
  static String getStringDecode(String value) {
    return utf8.decode(base64.decode(value));
  }

  static String getStringEncode(String value) {
    return base64.encode(utf8.encode(value));
  }

  static dynamic getIntDecode(String value) {
    return int.tryParse(utf8.decode(base64.decode(value)));
  }
}
