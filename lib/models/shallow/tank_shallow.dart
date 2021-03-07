import 'package:flutter/material.dart';
import '../admin_statless/black_button.dart';
import '../admin_statless/edit_text.dart';
import '../util.dart';
import 'serializable.dart';

class TankShallow implements APISerialiable {
  String name;
  void setName(String s) => name = s;
  int aircraftid;
  int tankid;
  String weights;
  String simplemoms;
  String ep = 'tank';
  void Function(Map<String, dynamic> obj) onSave;

  TankShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : name = json["name"] ?? '',
        aircraftid = json["aircraftid"],
        tankid = json["tankid"] ?? 0,
        weights = json["weights"] ?? '',
        simplemoms = json["simplemoms"] ?? '';

  Map<String, dynamic> toJson() => {
        "name": name,
        "aircraftid": aircraftid,
        "tankid": tankid,
        "weights": weights,
        "simplemoms": simplemoms,
      };

  bool csvIsValid({String simplemoms, String weights}) {
    try {
      if (simplemoms != null) {
        this.simplemoms = simplemoms;
      }
      if (weights != null) {
        this.weights = weights;
      }

      final weightList =
          this.weights.split(',').map<double>((x) => double.parse(x)).toList();
      final simplemomsList = this
          .simplemoms
          .split(',')
          .map<double>((x) => double.parse(x))
          .toList();

      if (weightList.length != simplemomsList.length) {
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
          EditText(
              initialValue: name,
              hintText: 'Name',
              validate: (s) => validateStringNotEmpty(s, setName)),
          EditText(
            initialValue: weights.toString(),
            hintText: 'Weights as CSV',
            validate: (s) {
              if (s.isEmpty) {
                return 'Can not be empty';
              } else if (!csvIsValid(weights: s)) {
                return 'CSV must same length';
              }
              return null;
            },
          ),
          EditText(
            initialValue: simplemoms.toString(),
            hintText: 'Simple Moments as CSV',
            validate: (s) {
              if (s.isEmpty) {
                return 'Can not be empty';
              } else if (!csvIsValid(simplemoms: s)) {
                return 'CSV must same length';
              }
              return null;
            },
          ),
          BlackButton(() {
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
