import 'cargo.dart';
import 'config.dart';
import 'glossary.dart';
import 'tank.dart';

class Aircraft {
  /// pk in pg
  final num id;
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
  final num mommultiplier;
  /// leading edge of mean aerodynamic chord.
  final num lemac;
  /// mean aerodynamic width of the wing
  final num mac;
  /// 0 < valid cargo > cargo max weight 
  final num cargoweight1;

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
    id = json['id'],
    name = json['name'],
    fs0 = json['fs0'],
    fs1 = json['fs1'],
    mom0 = json['mom0'],
    mom1 = json['mom1'],
    weight0 = json['weight0'],
    weight1 = json['weight1'],
    cargoweight1 = json['cargoweight1'],
    lemac = json['lemac'],
    mac = json['mac'],
    mommultiplier = json['mommultiplyer'],

    cargosJson = json['cargos'],
    tanksJson = json['tanks'],
    glossarysJson = json['glossarys'],
    configsJson = json['configs']
    {
      cargosJson.forEach((json) => cargos.add(Cargo.fromJsonCargo(json)));
      tanksJson.forEach((json) => tanks.add(Tank.fromJson(json, mommultiplier)));
      glossarysJson.forEach((json) => glossarys.add(Glossary.fromJson(json)));
      configsJson.forEach((json) => configs.add(Config.fromJson(json)));
    }

    Map<String, dynamic> get json {
      Map<String, dynamic> ret = {};
      ret['id'] = id;
      ret['name'] = name;
      ret['fs0'] = fs0;
      ret['fs1'] = fs1;
      ret['mom0'] = mom0;
      ret['mom1'] = mom1;
      ret['weight0'] = weight0;
      ret['weight1'] = weight1;
      ret['cargoweight1'] = cargoweight1;
      ret['lemac'] = lemac;
      ret['mac'] = mac;
      ret['mommultiplyer'] = mommultiplier;

      var cargolist = [];
      cargos.forEach((x) => cargolist.add(x.json));
      ret['cargos'] = cargolist;

      var tanklist = [];
      tanks.forEach((x) => tanklist.add(x.json));
      ret['tanks'] = tanklist;
      
      var glossarylist = [];
      glossarys.forEach((x) => glossarylist.add(x.json));
      ret['glossarys'] = glossarylist;

      var configlist = [];
      configs.forEach((x) => configlist.add(x.json));
      ret['glossarys'] = configlist;
      return ret;
    }


  // Aircraft({
  //   @required this.name,
  //   @required this.fs0,
  //   @required this.fs1,
  //   @required this.mom0,
  //   @required this.mom1,
  //   @required this.weight0,
  //   @required this.weight1,
  //   @required this.mommultiplier,
  //   @required this.lemac,
  //   @required this.mac,
  //   @required this.cargoweight1,
  //   @required this.tanknames,
  //   @required this.tankmoms,
  //   @required this.tankweights,
  //   @required this.titles,
  //   @required this.bodys,
  //   @required this.cargonames,
  //   @required this.cargoweights,
  //   @required this.cargomoms,
  //   @required this.configstrings,
  // }) {

  //   // create tanks
  //   for (int i = 0; i < tanknames.length; i++) {
  //     tanks.add(Tank(
  //       tanknames[i],
  //       tankweights[i],
  //       tankmoms[i],
  //       mommultiplier,
  //     ));
  //   }

  //   //create addaA cargo
  //   for (int i = 0; i < cargomoms.length; i++) {
  //     addaCargo.add(NameWeightFS(
  //       name: cargonames[i],
  //       weight: cargoweights[i],
  //       mom: cargomoms[i],
  //       simplemom: this.mommultiplier,
  //     ));
  //   }

  //   //create configs
  //   for (int i = 0; i < configstrings.length; i++) {
  //     configs.add(Config(configstrings[i], this.mommultiplier));
  //   }

  //   // create glossarys
  //   for (int i = 0; i < titles.length; i++) {
  //     glossarys.add(Glossary(
  //       titles[i],
  //       bodys[i]
  //     ));
  //   }

  // }
}