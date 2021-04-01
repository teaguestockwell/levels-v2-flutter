import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../util.dart';
import '../../widgets/input/black_button_admin.dart';
import '../../widgets/input/edit_text_admin.dart';
import '../../widgets/input/future_dropdown_button.dart';
import 'serializable.dart';

class CargoShallow implements APISerialiable {
  int aircraftId;
  int cargoId;

  String name;
  void setName(String s) => name = s;
  num weight;
  void setWeight(num w) => weight = w;
  num fs;
  void setFs(num s) => fs = s;
  String category;
  void setCategory(Map<String,dynamic> m) => category = m[searchField];

  String ep = 'cargo';
  Function(Map<String, dynamic>) onSave;

  CargoShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : aircraftId = json["aircraftId"],
        cargoId = json["cargoId"] ?? 0,
        name = json["name"] ?? '',
        weight = json["weight"] ?? 0,
        fs = json["fs"] ?? -1,
        category = json["category"] ?? 'Extra';

  @override
  Map<String, dynamic> toJson() => {
        "aircraftId": aircraftId,
        "cargoId": cargoId,
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
              validate: (s) => valiadateNumPositive(s, setWeight)),
          EditTextAdmin(
              initialValue: fs.toString(),
              hintText: 'Default FS (overridden by config)',
              validate: (s) => valiadateNumAny(s, setFs)),
          BlackButtonAdmin(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
