import 'package:flutter/material.dart';

class Glossary {
  final int aircraftId;
  final int id;
  final String name;
  final String body;

  Glossary({
    @required this.aircraftId,
    @required this.id,
    @required this.name,
    @required this.body
  });

  Glossary.fromJson(Map<String,dynamic> json):
    aircraftId = json['aircraftId'],
    id = json['id'],
    name = json['name'],
    body = json['body'];
}