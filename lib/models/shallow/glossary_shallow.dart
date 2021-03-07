import 'package:flutter/material.dart';
import '../admin_statless/black_button.dart';
import '../admin_statless/edit_text.dart';
import '../util.dart';
import 'serializable.dart';

class GlossaryShallow implements APISerialiable {
  int aircraftid;
  int glossaryid;
  String name;
  void setName(String s) => name = s;
  String body;
  void setBody(String s) => body = s;
  String ep = 'glossary';
  void Function(Map<String, dynamic> obj) onSave;

  GlossaryShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : aircraftid = json["aircraftid"],
        glossaryid = json["userid"] ?? 0,
        name = json["name"] ?? '',
        body = json["body"] ?? '';

  Map<String, dynamic> toJson() => {
        "aircraftid": aircraftid,
        "glossaryid": glossaryid,
        "name": name,
        "body": body,
      };

  Widget getForm() {
    final key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: SingleChildScrollView(
            child: Column(children: [
          EditText(
              initialValue: name,
              hintText: 'Name / Title',
              validate: (s) => validateStringNotEmpty(s, setName)),
          EditText(
              initialValue: body,
              hintText: 'Body',
              validate: (s) => validateStringNotEmpty(s, setBody)),
          BlackButton(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
