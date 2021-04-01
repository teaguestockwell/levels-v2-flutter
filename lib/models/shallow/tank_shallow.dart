import 'package:flutter/material.dart';
import '../../util.dart';
import '../../widgets/input/black_button_admin.dart';
import '../../widgets/input/edit_text_admin.dart';
import 'serializable.dart';

class TankShallow implements APISerialiable {
  String name;
  void setName(String s) => name = s;
  int aircraftId;
  int tankId;
  String weightsCSV;
  String simpleMomsCSV;
  String ep = 'tank';
  void Function(Map<String, dynamic> obj) onSave;

  TankShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : name = json["name"] ?? '',
        aircraftId = json["aircraftId"],
        tankId = json["tankId"] ?? 0,
        weightsCSV = json["weightsCSV"] ?? '',
        simpleMomsCSV = json["simpleMomsCSV"] ?? '';

  Map<String, dynamic> toJson() => {
        "name": name,
        "aircraftId": aircraftId,
        "tankId": tankId,
        "weightsCSV": weightsCSV,
        "simpleMomsCSV": simpleMomsCSV,
      };

  bool csvIsValid({String simpleMomsCSV, String weightsCSV}) {
    try {
      if (simpleMomsCSV != null) {
        this.simpleMomsCSV = simpleMomsCSV;
      }
      if (weightsCSV != null) {
        this.weightsCSV = weightsCSV;
      }

      final weightList =
          this.weightsCSV.split(',').map<num>((x) => num.parse(x)).toList();
      final simpleMomsCSVList = this
          .simpleMomsCSV
          .split(',')
          .map<num>((x) => num.parse(x))
          .toList();

      if (weightList.length != simpleMomsCSVList.length) {
        throw Exception();
      }

      return true;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      print('throw');
      return false;
    }
  }

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
          EditTextAdmin(
            initialValue: weightsCSV.toString(),
            hintText: 'Weights as CSV',
            validate: (s) {
              if (s.isEmpty) {
                return 'Can not be empty';
              } else if (!csvIsValid(weightsCSV: s)) {
                return 'CSV must same length';
              }
              return null;
            },
          ),
          EditTextAdmin(
            initialValue: simpleMomsCSV.toString(),
            hintText: 'Simple Moments as CSV',
            validate: (s) {
              if (s.isEmpty) {
                return 'Can not be empty';
              } else if (!csvIsValid(simpleMomsCSV: s)) {
                return 'CSV must same length';
              }
              return null;
            },
          ),
          BlackButtonAdmin(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
