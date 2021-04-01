import 'package:flutter/material.dart';
import '../../util.dart';
import '../../widgets/input/black_button_admin.dart';
import '../../widgets/input/edit_text_admin.dart';
import 'serializable.dart';

class ConfigShallow implements APISerialiable {
  int configId;
  int aircraftId;
  String name;
  void setName(String s) => name = s;
  String ep = 'config';
  void Function(Map<String, dynamic> obj) onSave;

  ConfigShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : configId = json["configId"] ?? 0,
        aircraftId = json["aircraftId"],
        name = json["name"] ?? '';

  Map<String, dynamic> toJson() => {
        "configId": configId,
        "aircraftId": aircraftId,
        "name": name,
      };

  Widget getForm() {
    final key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: SingleChildScrollView(
            child: Column(children: [
          EditTextAdmin(
              initialValue: name,
              hintText: 'Name',
              validate: (s) => validateStringNotEmpty(s, setName)),
          BlackButtonAdmin(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
