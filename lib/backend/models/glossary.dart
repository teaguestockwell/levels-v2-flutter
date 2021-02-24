import 'package:flutter/material.dart';

class Glossary {
  final int aircraftid;
  final int id;
  final String title;
  final String body;

  Glossary({
    @required this.aircraftid,
    @required this.id,
    @required this.title,
    @required this.body
  }) :
    assert(title!=null),
    assert(title.isNotEmpty),
    assert(body!=null),
    assert(body.isNotEmpty);

  Glossary.fromJson(Map<String,dynamic> json):
    aircraftid = json['aircraftid'],
    id = json['id'],
    title = json['title'],
    body = json['body'];

  Map<String, dynamic> get json {
    Map<String, dynamic> ret = {};
    ret['aircraftid'] = aircraftid;
    ret['id'] = id;
    ret['title'] = title;
    ret['body'] = body;
    return ret;
  }
}