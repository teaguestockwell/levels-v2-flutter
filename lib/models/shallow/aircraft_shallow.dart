import 'package:flutter/material.dart';
import '../../util.dart';
import '../../widgets/input/black_button_admin.dart';
import '../../widgets/input/edit_text_admin.dart';
import 'serializable.dart';

class AircraftShallow implements APISerialiable{
  int id;
  String name;
  void setName(String s) => name = s;
  double fs0;
  void setFs0(double s) => fs0 = s;
  double fs1;
  void setFs1(double s) => fs1 = s;
  double mom0;
  void setMom0(double s) => mom0 = s;
  double mom1;
  void setMom1(double s) => mom1 = s;
  double weight0;
  void setWeight0(double s) => weight0 = s;
  double weight1;
  void setWeight1(double s) => weight1 = s;
  double cargoweight1;
  void setCargoWeight1(double s) => cargoweight1 = s;
  double lemac;
  void setLemac(double s) => lemac = s;
  double mac;
  void setMac(double s) => mac = s;
  double mommultiplyer;
  void setMomMultiplyer(double s) => mommultiplyer = s;
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
        cargoweight1 = json["cargoweight1"] ?? 0,
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
        "cargoweight1": cargoweight1,
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
              validate: (s) => valiadateDoublePositive(s, setFs0)),
          EditTextAdmin(
              initialValue: fs1.toString(),
              hintText: 'Max Fuselage Station',
              validate: (s) => valiadateDoublePositive(s, setFs1)),
          EditTextAdmin(
              initialValue: mom0.toString(),
              hintText: 'Min Simple Moment',
              validate: (s) => valiadateDoublePositive(s, setMom0)),
          EditTextAdmin(
              initialValue: mom1.toString(),
              hintText: 'Max Simple Moment',
              validate: (s) => valiadateDoublePositive(s, setMom1)),
          EditTextAdmin(
              initialValue: weight0.toString(),
              hintText: 'Min Basic Weight',
              validate: (s) => valiadateDoublePositive(s, setWeight0)),
          EditTextAdmin(
              initialValue: weight1.toString(),
              hintText: 'Max Basic Weight',
              validate: (s) => valiadateDoublePositive(s, setWeight1)),
          EditTextAdmin(
              initialValue: cargoweight1.toString(),
              hintText: 'Max individual cargo weight',
              validate: (s) => valiadateDoublePositive(s, setCargoWeight1)),
          EditTextAdmin(
              initialValue: lemac.toString(),
              hintText: 'LEMAC',
              validate: (s) => valiadateDoublePositive(s, setLemac)),
          EditTextAdmin(
              initialValue: mac.toString(),
              hintText: 'MAC',
              validate: (s) => valiadateDoublePositive(s, setMac)),
          EditTextAdmin(
              initialValue: mommultiplyer.toString(),
              hintText: '"x" where: simple moment = moment / x',
              validate: (s) => valiadateDoublePositive(s, setMomMultiplyer)),
          BlackButtonAdmin(() {
            print(key.currentState.validate());
            if (key.currentState.validate()) {
              this.onSave(this.toJson());
            }
          })
        ])));
  }
}
