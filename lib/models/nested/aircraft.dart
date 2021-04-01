import 'cargo.dart';
import 'config.dart';
import 'glossary.dart';
import 'tank.dart';

class Aircraft {
  /// pk in pg
  final num aircraftId;
  /// the name of the mds ex: C-17A-NON-ER, C-17A-ER
  /// mds of the same type will have diffrent models if their capabilitys are diffrent,
  /// for example, the two c17 variants have diffren fuel capacitys, and this changes, 
  /// the moment of fuel in the wings
  final String name;
  /// the minimun fuselage station that cargo can be placed at.
  final num fs0;
  /// the maximum fuselage station that cargo can be placed
  final num fs1;
  /// the minimum simple momment of the basic long moment of the acft in/lbs
  final num mom0;
  /// the maximum simple momment of the basic long moment of the acft in/lbs
  final num mom1;
  /// the minumum basic weight of the acft in lbs
  final num weight0;
  /// the max basic weight of the acft in lbs
  final num weight1;
  /// the simple moment modifier  basic moment * simple moment modifier = basic moment
  final num momMultiplier;
  /// leading edge of mean aerodynamic chord.
  final num lemac;
  /// mean aerodynamic width of the wing
  final num mac;
  /// 0 < valid cargo > cargo max weight 
  final num cargoWeight1;

  // below is 1-n relationship or models within models
  final List<Cargo> cargos = [];
  final List<Tank> tanks = [];
  final List<Config> configs = [];
  final List<Glossary> glossarys = [];

  // fields below are used to hold json while contructing addaCargo, tanks, and configs
  final List<dynamic> cargosJson;
  final List<dynamic> tanksJson;
  final List<dynamic> glossarysJson;
  final List<dynamic> configsJson;


  


  Aircraft.fromJson(Map<String,dynamic> json):
    aircraftId = json['aircraftId'],
    name = json['name'],
    fs0 = json['fs0'],
    fs1 = json['fs1'],
    mom0 = json['mom0'],
    mom1 = json['mom1'],
    weight0 = json['weight0'],
    weight1 = json['weight1'],
    cargoWeight1 = json['cargoWeight1'],
    lemac = json['lemac'],
    mac = json['mac'],
    momMultiplier = json['momMultiplyer'],

    cargosJson = json['cargos'],
    tanksJson = json['tanks'],
    glossarysJson = json['glossarys'],
    configsJson = json['configs']
    {
      // while an admin user is modifying these nested values,
      // they may be incomplete, so dont add them if they throw
      
      cargosJson.forEach((json) {
        // ignore: avoid_catches_without_on_clauses
        try{cargos.add(Cargo.fromJsonCargo(json));}catch(e){print(e);}
      });

      tanksJson.forEach((json) { 
        // ignore: avoid_catches_without_on_clauses
        try{tanks.add(Tank.fromJson(json, momMultiplier));}catch(e){print(e);};
      });

      glossarysJson.forEach((json) {
        // ignore: avoid_catches_without_on_clauses
        try{glossarys.add(Glossary.fromJson(json));} catch(e){print(e);};
      });

      //add empty config
      configs.add(Config.empty());
      
      configsJson.forEach((json) {
        // ignore: avoid_catches_without_on_clauses
         try{configs.add(Config.fromJson(json));} catch(e){print(e);}
      });
    }
}