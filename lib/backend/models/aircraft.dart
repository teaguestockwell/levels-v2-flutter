import 'package:flutter/foundation.dart';
import 'config.dart';
import 'glossary.dart';
import 'nameWeightFS.dart';
import 'tank.dart';

class Aircraft {
  /// the name of the mds ex: C-17A-NON-ER, C-17A-ER
  /// mds of the same type will have diffrent models if their capabilitys are diffrent,
  /// for example, the two c17 variants have diffren fuel capacitys, and this changes, 
  /// the moment of fuel in the wings
  final String name;
  /// the minimun fuselage station that cargo can be placed at.
  final String fs0;
  /// the maximum fuselage station that cargo can be placed
  final String fs1;
  /// the minimum simple momment of the basic long moment of the acft in/lbs
  final String mom0;
  /// the maximum simple momment of the basic long moment of the acft in/lbs
  final String mom1;
  /// the minumum basic weight of the acft in lbs
  final String weight0;
    /// the max basic weight of the acft in lbs
  final String weight1;
    /// the simple moment modifier  basic moment * simple moment modifier = basic moment
  final String simplemom;
  /// leading edge of mean aerodynamic chord.
  final String lemac;
  /// mean aerodynamic width of the wing
  final String mac;
  /// 0 < valid cargo > cargo max weight 
  final String cargomaxweight;


  final List<NameWeightFS> addaCargo = [];
  final List<Tank> tanks = [];
  final List<Config> configs = [];
  final List<Glossary> glossarys = [];
  // fields below are used to contruct addaCargo, tanks, and configs


  /// an array of names for each tank
  final List<dynamic> tanknames;
  /// an array of csv represeting simple moments for each weight of fuel in a tank
  /// tanksmoms[0] = tank one; tankone[0] = simple moment
  final List<dynamic> tankmoms;
  /// an array of csv represeting weight of fuel in lbs in a each tank
  /// tanksweights[0] = tank one; tankone[0] = weight
  final List<dynamic> tankweights;
  /// a list of titles for the glossary cards
  final List<dynamic> titles;
  /// a list of bodys for for each glossary card
  final List<dynamic> bodys;
  /// a list of names for each of the cargo items
  final List<dynamic> cargonames;
  /// a list of weights for each cargo item
  final List<dynamic> cargoweights;
  /// a lsit of simple moment for each cargo item
  final List<dynamic> cargomoms;
  /// a list of strings. Each string represents a cargo configuaration.
  /// each cargo item in a config is delimited by ';' each cargo item
  /// is delimited by ','
  ///  where [0] = cargo name, [1] = total cargo weight in lb
  /// [2] = total simple moment [3] = qty
  final List<dynamic> configstrings;


  Aircraft({
    @required this.name,
    @required this.fs0,
    @required this.fs1,
    @required this.mom0,
    @required this.mom1,
    @required this.weight0,
    @required this.weight1,
    @required this.simplemom,
    @required this.lemac,
    @required this.mac,
    @required this.cargomaxweight,
    @required this.tanknames,
    @required this.tankmoms,
    @required this.tankweights,
    @required this.titles,
    @required this.bodys,
    @required this.cargonames,
    @required this.cargoweights,
    @required this.cargomoms,
    @required this.configstrings,
  }) {

    // create tanks
    for (int i = 0; i < tanknames.length; i++) {
      tanks.add(Tank(
        tanknames[i],
        tankweights[i],
        tankmoms[i],
        simplemom,
      ));
    }

    //create addaA cargo
    for (int i = 0; i < cargomoms.length; i++) {
      addaCargo.add(NameWeightFS(
        name: cargonames[i],
        weight: cargoweights[i],
        mom: cargomoms[i],
        simplemom: this.simplemom,
      ));
    }

    //create configs
    for (int i = 0; i < configstrings.length; i++) {
      configs.add(Config(configstrings[i], this.simplemom));
    }

    // create glossarys
    for (int i = 0; i < titles.length; i++) {
      glossarys.add(Glossary(
        titles[i],
        bodys[i]
      ));
    }

  }
}