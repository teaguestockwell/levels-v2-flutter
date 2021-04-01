import 'package:flutter/material.dart';
import '../../util.dart';
import '../../widgets/input/black_button_admin.dart';
import '../../widgets/input/edit_text_admin.dart';
import 'serializable.dart';

class AircraftShallow implements APISerialiable{
  int id;
  String name;
  void setName(String s) => name = s;
  num fs0;
  void setFs0(num s) => fs0 = s;
  num fs1;
  void setFs1(num s) => fs1 = s;
  num mom0;
  void setMom0(num s) => mom0 = s;
  num mom1;
  void setMom1(num s) => mom1 = s;
  num weight0;
  void setWeight0(num s) => weight0 = s;
  num weight1;
  void setWeight1(num s) => weight1 = s;
  num cargoWeight1;
  void setCargoWeight1(num s) => cargoWeight1 = s;
  num lemac;
  void setLemac(num s) => lemac = s;
  num mac;
  void setMac(num s) => mac = s;
  num mommultiplyer;
  void setMomMultiplyer(num s) => mommultiplyer = s;
  void Function(Map<String, dynamic>) onSave;
  String ep = 'aircraft';

  AircraftShallow.fromJson(Map<String, dynamic> json, this.onSave)
      : id = json["id"] ?? 0,
        name = json["name"] ?? '',
        fs0 = json["fs0"] ?? 0,
        fs1 = json["fs1"] ?? 0,
        mom0 = json["mom0"] ?? 0,
        mom1 = json["mom1"] ?? 0,
        weight0 = json["weight0"] ?? 0,
        weight1 = json["weight1"] ?? 0,
        cargoWeight1 = json["cargoWeight1"] ?? 0,
        lemac = json["lemac"] ?? 0,
        mac = json["mac"] ?? 0,
        mommultiplyer = json["mommultiplyer"] ?? 0;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fs0": fs0,
        "fs1": fs1,
        "mom0": mom0,
        "mom1": mom1,
        "weight0": weight0,
        "weight1": weight1,
        "cargoWeight1": cargoWeight1,
        "lemac": lemac,
        'mac': mac,
        'mommultiplyer': mommultiplyer,
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
          EditTextAdmin(
              initialValue: fs0.toString(),
              hintText: 'Min Fuselage Station',
              validate: (s) => valiadateNumPositive(s, setFs0)),
          EditTextAdmin(
              initialValue: fs1.toString(),
              hintText: 'Max Fuselage Station',
              validate: (s) => valiadateNumPositive(s, setFs1)),
          EditTextAdmin(
              initialValue: mom0.toString(),
              hintText: 'Min Simple Moment',
              validate: (s) => valiadateNumPositive(s, setMom0)),
          EditTextAdmin(
              initialValue: mom1.toString(),
              hintText: 'Max Simple Moment',
              validate: (s) => valiadateNumPositive(s, setMom1)),
          EditTextAdmin(
              initialValue: weight0.toString(),
              hintText: 'Min Basic Weight',
              validate: (s) => valiadateNumPositive(s, setWeight0)),
          EditTextAdmin(
              initialValue: weight1.toString(),
              hintText: 'Max Basic Weight',
              validate: (s) => valiadateNumPositive(s, setWeight1)),
          EditTextAdmin(
              initialValue: cargoWeight1.toString(),
              hintText: 'Max individual cargo weight',
              validate: (s) => valiadateNumPositive(s, setCargoWeight1)),
          EditTextAdmin(
              initialValue: lemac.toString(),
              hintText: 'LEMAC',
              validate: (s) => valiadateNumPositive(s, setLemac)),
          EditTextAdmin(
              initialValue: mac.toString(),
              hintText: 'MAC',
              validate: (s) => valiadateNumPositive(s, setMac)),
          EditTextAdmin(
              initialValue: mommultiplyer.toString(),
              hintText: '"x" where: simple moment = moment / x',
              validate: (s) => valiadateNumPositive(s, setMomMultiplyer)),
          BlackButtonAdmin(() {
            //print(key.currentState.validate());
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
