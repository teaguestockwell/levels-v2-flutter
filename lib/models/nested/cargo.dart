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
  final int aircraftid;
  final int configid;
  final int cargoid;
  final int configcargoid;

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
  aircraftid = -1,
  configid = -1,
  cargoid = -1,
  configcargoid = -1,
  type = CargoType.Nojson; 

  /// can be used to write cargo db
  Cargo.fromJsonCargo(Map<String,dynamic> json):
    oldjson = json,
    name = json['name'], // eryething is named
    weight = json['weight'], // everything has weight
    fs = json['fs'], // fs is allways non null beacuse db assied -1 as default 
    qty = 1,
    aircraftid = json['aircraftid'],
    cargoid = json['cargoid'],
    configid = - 1,
    configcargoid = -1,
    id = getUniqueIdx(),
    type = CargoType.Cargo;

  Cargo.fromJsonConfigCargo(Map<String,dynamic> json):
    oldjson = json,
    name = json['cargo']['name'],
    weight = json['cargo']['weight'],
    fs = json['fs'],
    qty = json['qty'],
    id = getUniqueIdx(),
    aircraftid = json['aircraftid'],
    configid = json['configid'],
    cargoid = json['cargoid'],
    configcargoid = json['configcargoid'],
    type = CargoType.ConfigCargo;

  Cargo.fromTank({
    @required this.name,
    @required this.weight,
    @required num simplemom,
    @required num mommultiplier,
  }) :
  oldjson = {},
  fs = (simplemom * mommultiplier) / weight,
  qty = 1,
  id = getUniqueIdx(),
  aircraftid = -1,
  cargoid = -1,
  configid =-1,
  configcargoid =-1,
  type = CargoType.Nojson; // tanks are modified using csv 


  Cargo.copyNewID(Cargo old) :
  oldjson = {}, 
  name = old.name,
  weight = old.weight,
  fs = old.fs,
  qty = old.qty,
  id = getUniqueIdx(),
  aircraftid = -1,
  cargoid = -1,
  configid =-1,
  configcargoid =-1,
  type = CargoType.Nojson;

  num get mom => fs * weight;
  num get momTot => fs * weight * qty;

  num simpleMom(num mommultiplier) => this.mom/mommultiplier;
  num simpleMomTot(num mommultipler) => this.momTot/mommultipler;

  //weight is a field
  num get weightTot => weight * qty;

  void setSimpleMom(num simpleMom, num mommultipler){
    fs = (simpleMom * mommultipler) / (weight * qty);
  }

  void setMom(num mom){
    fs = mom / weight;
  }

  Map<String, dynamic> get json{
    Map<String, dynamic> ret = {};
    
    switch (type) {
      case CargoType.Cargo: {
        ret['aircraftid'] = aircraftid;
        ret['cargoid'] = cargoid;
        ret['name'] = name;
        ret['fs'] = fs;
      }break;
      case CargoType.ConfigCargo: {
        ret['configid'] = configid;
        ret['aircraftid'] = aircraftid;
        ret['cargoid'] = cargoid;
        ret['configcargoid'] = configcargoid;
        ret['fs'] = fs;
        ret['qty'] = qty;
        // relation to cargo
        Map<String,dynamic> cargo = {};
        cargo['aircraftid'] = aircraftid;
        cargo['cargoid'] = cargoid;
        cargo['name'] = name;
        cargo['weight'] = weight;
        cargo['fs'] = oldjson['cargo']['fs'];
      }break;
      default: throw Exception('.json called on UI Cargo');
    }

    return ret;
  }
}