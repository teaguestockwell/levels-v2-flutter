import 'package:flutter/material.dart';
import '../../constant.dart';
import 'aircraft_shallow.dart';
import 'cargo_shallow.dart';
import 'config_shallow.dart';
import 'configcargo_shallow.dart';
import 'glossary_shallow.dart';
import 'tank_shallow.dart';
import 'user_shallow.dart';

abstract class APISerialiable {
  String ep;
  void Function(Map<String, dynamic> obj) onSave;
  Map<String, dynamic> toJson();
  Widget getForm();
}

APISerialiable getAPISerializableOfEP({
  @required String ep,
  @required Map<String,dynamic> obj,
  @required void Function(Map<String,dynamic>) put
}){
  switch (ep) {
    case aircraftS: return AircraftShallow.fromJson(obj, put);
    case cargoS: return CargoShallow.fromJson(obj, put);
    case configS: return ConfigShallow.fromJson(obj, put);
    case tankS:return TankShallow.fromJson(obj, put);
    case userS: return UserShallow.fromJson(obj, put);
    case glossaryS:return GlossaryShallow.fromJson(obj, put);
    case configCargosS: return ConfigCargoShallow.fromJson(obj, put);
    default: throw Exception('invalid ep passed to getAPISerializableOfEP');
  }
}