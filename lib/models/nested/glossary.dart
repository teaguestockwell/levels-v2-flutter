import 'package:flutter/material.dart';

class Glossary {
  final int aircraftId;
  final int glossaryId;
  final String name;
  final String body;

  Glossary({
    @required this.aircraftId,
    @required this.glossaryId,
    @required this.name,
    @required this.body
  });

  Glossary.fromJson(Map<String,dynamic> json):
    aircraftId = json['aircraftId'],
    glossaryId = json['glossaryId'],
    name = json['name'],
    body = json['body'];
}