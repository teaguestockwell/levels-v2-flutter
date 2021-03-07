import 'dart:convert';
import 'package:http/http.dart' as http;
import '../backend/models/nested/aircraft.dart';
import './isolate.dart';
import '../backend/models/nested/general.dart';

class UserService{

Future<General> getGeneral() async {
  final response =  await http.get('http://localhost:8080/fl-api/general');
  return General.fromJson(
    await parseJsonIsolate(response.body) as Map<String,dynamic>
  );
}

Future<List<Aircraft>> getAirs() async {
  List<Aircraft> ret = [];
  final response =  await http.get('http://localhost:8080/fl-api/aircraft');
  final json = await parseJsonIsolate(response.body) as List<dynamic>;
  json.forEach((x) {
    // ignore: avoid_catches_without_on_clauses
    try{ret.add(Aircraft.fromJson(x));} catch(e){print(e);}
  });
  return ret;
  }
}