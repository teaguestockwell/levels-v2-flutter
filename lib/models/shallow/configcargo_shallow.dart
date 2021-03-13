import 'package:flutter/material.dart';
import '../../services/admin_service.dart';
import '../../util.dart';
import '../../widgets/input/black_button_admin.dart';
import '../../widgets/input/edit_text_admin.dart';
import '../../widgets/input/future_dropdown_button.dart';
import 'serializable.dart';

class ConfigCargoShallow implements APISerialiable {
  int configid;
  int aircraftid;
  int cargoid;
  int configcargoid;
  num fs;
  void setFS(num s) => fs = s;
  int qty;
  void setQty(int s) => qty = s;
  String name;
  String ep = 'configcargo';
  void Function(Map<String, dynamic> obj) onSave;

  ConfigCargoShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : configid = json["configid"] ?? 0,
        aircraftid = json["aircraftid"],
        cargoid = json["cargoid"] ?? -1,
        configcargoid = json["configcargoid"] ?? 0,
        fs = json["fs"] ?? -1,
        qty = json["qty"] ?? 1,
        name = json["name"] ?? '';

  Map<String, dynamic> toJson() => {
        "configid": configid,
        "aircraftid": aircraftid,
        "cargoid": cargoid,
        "configcargoid": configcargoid,
        "fs": fs,
        "qty": qty,
        "name": name,
      };

  void change(Map<String, dynamic> m) => cargoid = m["cargoid"];
  
  Widget getForm() {
    final key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: SingleChildScrollView(
            child: Column(children: [
          FutureDropDownButton(
            onEmptyMSG: '0 Cargo to connect to config. Try making one',
              initPKID: cargoid,
              future: getN('cargo',reqParam: {'aircraftid': aircraftid.toString()}),
              onChange: change,
              apiModelPK: 'cargoid',
          ),
          EditTextAdmin(
              initialValue: fs.toString(),
              hintText: 'Fuselage Station',
              validate: (s) => valiadateNumAny(s, setFS)),
          EditTextAdmin(
              initialValue: qty.toString(),
              hintText: 'Quantity',
              validate: (s) => validateIntPositive(s, setQty)),
          BlackButtonAdmin(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
