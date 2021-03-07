import 'dart:convert';

List<dynamic> parseJsonIsolate(String json) {
  final ret = jsonDecode(json) as List<dynamic>;
  return ret;
}