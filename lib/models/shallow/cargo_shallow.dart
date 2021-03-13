import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../util.dart';
import '../../widgets/input/black_button_admin.dart';
import '../../widgets/input/edit_text_admin.dart';
import '../../widgets/input/future_dropdown_button.dart';
import 'serializable.dart';

class CargoShallow implements APISerialiable {
  int aircraftid;
  int cargoid;

  String name;
  void setName(String s) => name = s;
  double weight;
  void setWeight(double w) => weight = w;
  double fs;
  void setFs(double s) => fs = s;
  String category;
  void setCategory(Map<String,dynamic> m) => category = m[searchField];

  String ep = 'cargo';
  Function(Map<String, dynamic>) onSave;

  CargoShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : aircraftid = json["aircraftid"],
        cargoid = json["cargoid"] ?? 0,
        name = json["name"] ?? '',
        weight = json["weight"] ?? 0,
        fs = json["fs"] ?? -1,
        category = json["category"] ?? 'Extra';

  @override
  Map<String, dynamic> toJson() => {
        "aircraftid": aircraftid,
        "cargoid": cargoid,
        "name": name,
        "weight": weight,
        "fs": fs,
        "category": category,
      };

  @override
  Widget getForm() {
    final key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: SingleChildScrollView(
            child: Column(children: [
          DropDownButton(
            jsonList: cargoCategorys,
            apiModelPK: cargoCategoryPK,
            onChange: setCategory,
            initPKID: cargoCategorys.firstWhere(
              (obj) => obj[searchField] == category
            )[cargoCategoryPK],
          ),
          EditTextAdmin(
              initialValue: name,
              hintText: 'Name',
              validate: (s) => validateStringNotEmpty(s, setName)),
          EditTextAdmin(
              initialValue: weight.toString(),
              hintText: 'Weight',
              validate: (s) => valiadateDoublePositive(s, setWeight)),
          EditTextAdmin(
              initialValue: fs.toString(),
              hintText: 'Default FS (overridden by config)',
              validate: (s) => valiadateDoubleAny(s, setFs)),
          BlackButtonAdmin(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
