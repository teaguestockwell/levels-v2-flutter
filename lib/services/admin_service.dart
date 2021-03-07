import 'package:http/http.dart';
import '../constant.dart';
import 'isolate.dart';

Future<List<dynamic>> getN(String ep, {Map<String, String> reqParam}) async {
  Response res;

  if (reqParam != null) {
    res = await get(baseurl + ep + getQueryString(reqParam));
    if (res.statusCode == 200) {
      return decodeJsonIsolate<List<dynamic>>(res.body);
    } else {
      return <dynamic>[];
    }
  } else {
    res = await get(baseurl + ep);
    if (res.statusCode == 200) {
      return await decodeJsonIsolate<List<dynamic>>(res.body);
    } else {
      return <dynamic>[];
    }
  }
}

Future<Response> delete1(String ep, Map<String, dynamic> obj) async {
  return await delete(baseurl + ep + getQueryString(obj));
}

Future<Response> put1(String ep, Map<String, dynamic> obj) async {
  return put(
    baseurl + ep,
    body: await encodeJsonIsolate(obj),
    headers: reqHeaders
  );
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