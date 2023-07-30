import 'dart:convert';

class Encoder {
  static String getStringDecode(String value) {
    try {
      return utf8.decode(base64.decode(value));
    } on FormatException catch (e) {
      return '';
    }
  }

  static String getStringEncode(String value) {
    try {
      return base64.encode(utf8.encode(value));
    } on FormatException catch (e) {
      return '';
    }
  }

  static dynamic getIntDecode(String value) {
    return int.tryParse(utf8.decode(base64.decode(value)));
  }
}
