import 'package:flutter/material.dart';
import '../admin_statless/black_button.dart';
import '../admin_statless/edit_text.dart';
import '../api_request.dart';
import '../future_dropdown_button.dart';
import '../util.dart';
import 'serializable.dart';

class ConfigCargoShallow implements APISerialiable {
  int configid;
  int aircraftid;
  int cargoid;
  int configcargoid;
  double fs;
  void setFS(double s) => fs = s;
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

  void change(Map<String, dynamic> map) {
    print(map);
    cargoid = map.values.elementAt(0);
    print(cargoid);
  }

  Widget getForm() {
    final key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: SingleChildScrollView(
            child: Column(children: [
          FutureDropDownButton(
            onEmptyMSG: '0 Cargo to connect to config. Try making one',
              initID: cargoid,
              future: getN('cargo',reqParam: {'aircraftid': aircraftid.toString()}),
              onChange: change,
              apiModelPK: 'cargoid',
          ),
          EditText(
              initialValue: fs.toString(),
              hintText: 'Fuselage Station',
              validate: (s) => valiadateDoubleAny(s, setFS)),
          EditText(
              initialValue: qty.toString(),
              hintText: 'Quantity',
              validate: (s) => validateIntPositive(s, setQty)),
          BlackButton(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
