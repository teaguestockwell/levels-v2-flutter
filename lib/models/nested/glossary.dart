import 'package:flutter/material.dart';

class Glossary {
  final int aircraftid;
  final int id;
  final String name;
  final String body;

  Glossary({
    @required this.aircraftid,
    @required this.id,
    @required this.name,
    @required this.body
  });

  Glossary.fromJson(Map<String,dynamic> json):
    aircraftid = json['aircraftid'],
    id = json['id'],
    name = json['name'],
    body = json['body'];

  // Map<String, dynamic> get json {
  //   Map<String, dynamic> ret = {};
  //   ret['aircraftid'] = aircraftid;
  //   ret['id'] = id;
  //   ret['name'] = name;
  //   ret['body'] = body;
  //   return ret;
  // }
}