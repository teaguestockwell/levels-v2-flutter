import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'models/aircraft.dart';
import 'models/general.dart';

class Services{

Future<General> getGeneral() async {
  final response =  await http.get('http://localhost:8080/fl-api/general');
  final json = convert.jsonDecode(response.body);
  return General.fromJson(json);
}

Future<List<Aircraft>> getAirs() async {
  List<Aircraft> ret = [];
  final response =  await http.get('http://localhost:8080/fl-api/aircraft');
  final List<dynamic> json = convert.jsonDecode(response.body);
  json.forEach((x) => ret.add(Aircraft.fromJson(x)));
  return ret;
  }
}
