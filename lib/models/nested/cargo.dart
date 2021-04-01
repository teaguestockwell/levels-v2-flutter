import 'package:flutter/foundation.dart';
import '../../util.dart';

/// NameWeightMom hold a String name,weight,fs,moment; of a cargo item;
enum CargoType {Cargo,ConfigCargo,Nojson}
class Cargo {
  //handles this.json baed on type
  final CargoType type;
  final dynamic oldjson;

  final dig = 2;

  String name;
  num weight;
  num fs; 
  int qty;

  String get weightS => weight.toStringAsFixed(dig);
  String get fsS => fs.toStringAsFixed(dig);
  String get qtyS => qty.toString();

  /// db refrence
  final int aircraftId;
  final int configId;
  final int cargoId;
  final int configCargoId;

  /// ui refrence, not final for testing 
  int id; 

  /// only to be used when constructing UI object that will not write to db
  Cargo({
    this.name = '',
    this.weight = 0,
    this.fs = -1,
    this.qty = 1, 
  }) : 
  oldjson = {},
  id = getUniqueIdx(),
  aircraftId = -1,
  configId = -1,
  cargoId = -1,
  configCargoId = -1,
  type = CargoType.Nojson; 

  Cargo.fromJsonCargo(Map<String,dynamic> json):
    oldjson = json,
    name = json['name'], // eryething is named
    weight = json['weight'], // everything has weight
    fs = json['fs'], // fs is allways non null beacuse db assied -1 as default 
    qty = 1,
    aircraftId = json['aircraftId'],
    cargoId = json['cargoId'],
    configId = - 1,
    configCargoId = -1,
    id = getUniqueIdx(),
    type = CargoType.Cargo;

  Cargo.fromJsonConfigCargo(Map<String,dynamic> json):
    oldjson = json,
    name = json['cargo']['name'],
    weight = json['cargo']['weight'],
    fs = json['fs'],
    qty = json['qty'],
    id = getUniqueIdx(),
    aircraftId = json['aircraftId'],
    configId = json['configId'],
    cargoId = json['cargoId'],
    configCargoId = json['configCargoId'],
    type = CargoType.ConfigCargo;

  Cargo.fromTank({
    @required this.name,
    @required this.weight,
    @required num simplemom,
    @required num momMultiplier,
  }) :
  oldjson = {},
  fs = (simplemom * momMultiplier) / weight,
  qty = 1,
  id = getUniqueIdx(),
  aircraftId = -1,
  cargoId = -1,
  configId =-1,
  configCargoId =-1,
  type = CargoType.Nojson; // tanks are modified using csv 


  Cargo.copyNewID(Cargo old) :
  oldjson = {}, 
  name = old.name,
  weight = old.weight,
  fs = old.fs,
  qty = old.qty,
  id = getUniqueIdx(),
  aircraftId = -1,
  cargoId = -1,
  configId =-1,
  configCargoId =-1,
  type = CargoType.Nojson;

  num get mom => fs * weight;
  num get momTot => fs * weight * qty;

  num simpleMom(num momMultiplier) => this.mom/momMultiplier;
  num simpleMomTot(num mommultipler) => this.momTot/mommultipler;

  //weight is a field
  num get weightTot => weight * qty;

  void setSimpleMom(num simpleMom, num mommultipler){
    fs = (simpleMom * mommultipler) / (weight * qty);
  }

  void setMom(num mom){
    fs = mom / weight;
  }
}