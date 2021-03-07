import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../constant.dart';

Future<List<dynamic>> getN(String ep, {Map<String, String> reqParam}) async {
  Response res;

  if (reqParam != null) {
    res = await get(baseurl + ep + getQueryString(reqParam));
    if (res.statusCode == 200) {
      return jsonDecode(res.body) as List<dynamic>;
    } else {
      return <dynamic>[];
    }
  } else {
    res = await get(baseurl + ep);
    if (res.statusCode == 200) {
      return compute(parseJsonIsolate, res.body);
    } else {
      return <dynamic>[];
    }
  }
}

Future<Response> delete1(String ep, Map<String, dynamic> obj) async {
  return await delete(baseurl + ep + getQueryString(obj));
}

Future<Response> put1(String ep, Map<String, dynamic> obj) async {
  print(baseurl + ep);
  print(obj);
  final stringBody = jsonEncode(obj);
  return await put(baseurl + ep,
      body: stringBody, headers: reqHeaders);
}

String getQueryString(Map<String, dynamic> reqParam) {
  String queryString = '?';

  reqParam.removeWhere((k, v) => !k.contains(rmKeyQS));

  for (int i = 0; i < reqParam.length; i++) {
    queryString +=
        '${reqParam.keys.elementAt(i)}=${reqParam.values.elementAt(i)}';
    if (i != reqParam.length - 1) {
      queryString += '&';
    }
  }
  return queryString;
}

List<dynamic> parseJsonIsolate(String json) {
  final ret = jsonDecode(json) as List<dynamic>;
  return ret;
}