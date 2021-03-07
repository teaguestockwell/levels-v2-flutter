import 'dart:convert';
import 'package:flutter/foundation.dart';

Future<String> encodeJsonIsolate(Map<String,dynamic> jsonMap) async {
  return compute<Object,String>(jsonEncode,jsonMap);
}

Future<T> decodeJsonIsolate<T>(String jsonString) async {
  return await compute<String,dynamic>(jsonDecode,jsonString) as T;
}
