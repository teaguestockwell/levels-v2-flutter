import 'package:flutter/material.dart';
import '../admin_statless/black_button.dart';
import '../admin_statless/edit_text.dart';
import '../util.dart';
import 'serializable.dart';

class ConfigShallow implements APISerialiable {
  int configid;
  int aircraftid;
  String name;
  void setName(String s) => name = s;
  String ep = 'config';
  void Function(Map<String, dynamic> obj) onSave;

  ConfigShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : configid = json["configid"] ?? 0,
        aircraftid = json["aircraftid"],
        name = json["name"] ?? '';

  Map<String, dynamic> toJson() => {
        "configid": configid,
        "aircraftid": aircraftid,
        "name": name,
      };

  Widget getForm() {
    final key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: SingleChildScrollView(
            child: Column(children: [
          EditText(
              initialValue: name,
              hintText: 'Name',
              validate: (s) => validateStringNotEmpty(s, setName)),
          BlackButton(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
