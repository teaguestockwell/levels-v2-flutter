import 'dart:convert' as convert;

import 'package:five_level_one/backend/models/aircraft.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;


void main(){
  test(
    'given the api is online and 2 airs are seeded, when a get request is made to /aircraft, then models will build',
    () async {
      final response =  await http.get('http://localhost:8080/fl-api/aircraft')
        .timeout(Duration(seconds: 5));
       final List<dynamic> json = convert.jsonDecode(response.body);

       final List<Aircraft> airs = [];

       json.forEach((x) => airs.add(Aircraft.fromJson(x)));

       expect(airs.length, 2);
    }
  );

  test(
    'given api in online and 2 airs are seeded, when aircraft are built, then they will convert to json',
    () async {
      final response =  await http.get('http://localhost:8080/fl-api/aircraft')
        .timeout(Duration(seconds: 5));
       final List<dynamic> json = convert.jsonDecode(response.body);

       final List<Aircraft> airs = [];
       json.forEach((x) => airs.add(Aircraft.fromJson(x)));

        List<dynamic> airsjson = [];
       airs.forEach((x) => airsjson.add(x.json));

       expect(airsjson.length, 2);
    }
  );
}
