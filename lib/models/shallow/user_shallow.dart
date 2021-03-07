import 'package:flutter/material.dart';
import '../../util.dart';
import '../../widgets/input/black_button_admin.dart';
import '../../widgets/input/edit_text_admin.dart';
import 'serializable.dart';

class UserShallow implements APISerialiable {
  int aircraftid;
  int userid;
  String name;
  void setName(String s) => name = s;
  int role;
  void setRole(int s) => role = s;
  String ep = 'user';
  void Function(Map<String, dynamic> obj) onSave;

  UserShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : aircraftid = json["aircraftid"],
        userid = json["userid"] ?? 0,
        name = json["name"] ?? '',
        role = json["role"] ?? 1;

  Map<String, dynamic> toJson() => {
        "aircraftid": aircraftid,
        "userid": userid,
        "name": name,
        "role": role,
      };

  Widget getForm() {
    final key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: SingleChildScrollView(
            child: Column(children: [
          EditTextAdmin(
              initialValue: name,
              hintText: 'Email',
              validate: (s) => validateStringNotEmpty(s, setName)),
          EditTextAdmin(
              initialValue: role.toString(),
              hintText: '0: No Role, 1: User, 2: Admin, 3: DB Admin, 4: Owner',
              validate: (s) => validateIntPositive(s, setRole)),
          BlackButtonAdmin(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
