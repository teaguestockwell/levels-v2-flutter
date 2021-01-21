import 'package:flutter/material.dart';

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





/// Tank builds a list of name weight fs from
///  weightcsv, momentcsv,  
///contained under a tank name
///
class Tank {
  final String name, _weightsCSV, _momCSV, simplemom;

  List<NameWeightFS> nameWeightFSs = [];

  List<String> _weights = [], _moms = [];

  Tank(
    this.name,
    this._weightsCSV,
    this._momCSV,
    this.simplemom,
  ) {
    _weights = _weightsCSV.split(',');
    _moms = _momCSV.split(',');

    for (int i = 0; i < _weights.length; i++) {
      nameWeightFSs.add(NameWeightFS(
          name: name,
          weight: _weights[i],
          mom: _moms[i],
          simplemom: simplemom));
    }
  }
}

class Config {
  List<NameWeightFS> nwfList = [];
  String name, simplemom;
  Config(String csv, this.simplemom) {
    var nameWeightMomentQtyList = csv.split(';');
    this.name = nameWeightMomentQtyList[0];

    for (int i = 1; i < nameWeightMomentQtyList.length; i++) {
      String nwmqAtIndex = nameWeightMomentQtyList[i];
      var nwmqAtIndexList = nwmqAtIndex.split(',');

      this.nwfList.add(NameWeightFS(
          name: nwmqAtIndexList[0].trim(),
          weight:
              (P.p(nwmqAtIndexList[1].trim()) / P.p(nwmqAtIndexList[3].trim()))
                  .toString(), // weight = totweight / qty
          mom: (P.p(nwmqAtIndexList[2].trim()) / P.p(nwmqAtIndexList[3].trim()))
              .toString(), // mom = totmom / qty
          simplemom: this.simplemom,
          qty: nwmqAtIndexList[3].trim() // qty = qty
          ));
    }
  }
}

/// NameWeightMom hold a String name,weight,fs,moment; of a cargo item;
class NameWeightFS {
  String simplemom,

      /// modifier for simple moment
      name,
      ///lbs
      weight,
      ///this is used to temperaly hold simple moment while it is converted to 
      ///fs with 2 decimal accuracy. this is never used for percent mac caculations directly.
      mom,
      ///in from refrence datum
      fs,
      qty;
  int id;
  NameWeightFS({
    this.name = '',
    this.weight = '',
    this.fs = '',
    this.mom = '',
    this.simplemom = '0',
    this.qty = '1',
  }) {
    this.id = P.getUniqueIdx();
  }

  ///used to create copy of another object, but assign it a new id
  NameWeightFS.copyNewID(NameWeightFS old) {
    this.name = old.name;
    this.weight = old.weight;
    this.fs = old.fs;
    this.mom = old.mom;
    this.simplemom = old.simplemom;
    this.qty = old.qty;
    this.id = P.getUniqueIdx();
  }

  // @override
  // String toString() {
  //   return ("name: " +
  //       name +
  //       " weight: " +
  //       weight +
  //       " fs: " +
  //       getFsCalculated() +
  //       ' qty: ' +
  //       qty +
  //       ' id: ' +
  //       id.toString());
  // }

  ///total simple moment
  String getMom() {
    return (P.p(fs) * P.p(weight) / P.p(simplemom)).toString();
  }

  /// ea simple momment with fraction digits
  String getMomAsStringFixes(int fractionDigits) {
    return (P.p(fs) * P.p(weight) / P.p(simplemom))
        .toStringAsFixed(fractionDigits);
  }

  /// tot simple momment with fraction digits
  String getTotSimpMomFixed(int fractionDigits) {
    return ((P.p(fs) * P.p(weight) / P.p(simplemom)) * P.p(qty))
        .toStringAsFixed(fractionDigits);
  }

  /// tot simple momment with fraction digits
  String getTotMomAsStringFixes(int fractionDigits) {
    return ((P.p(fs) * P.p(weight) / P.p(simplemom)) * P.p(qty))
        .toStringAsFixed(fractionDigits);
  }

  ///ea unsimplified moment as string with faction digits
  String getUnSimpMomAsStringFixed(int fractionDigits) {
    return (P.p(fs) * P.p(weight)).toStringAsFixed(fractionDigits);
  }

  /// tot unsimp mom as string fixed
  String getTotUnSimpMomAsStringFixed(int fractionDigits) {
    return ((P.p(fs) * P.p(weight)) * P.p(qty)).toStringAsFixed(fractionDigits);
  }

  String getTotalMoment() {
    return ((P.p(fs) * P.p(weight) / P.p(simplemom)) * P.p(qty)).toString();
  }

  String getTotalWeight() {
    return (P.p(weight) * P.p(qty)).toString();
  }

  ///This is used to pull fs from mom and weight
  ///given that mom is simplified moment, when multiplied by mom modifer = raw moment
  String getFsCalculated() {
    if (fs.isNotEmpty) {
      return fs;
    }
    
    //canot get fs if nsfs is invalid
    return (P.p(mom) * P.p(simplemom) / P.p(weight)).toStringAsFixed(2);
  }

  String getTotWeightFixed(int fractionDigits) {
    return (P.p(weight) * P.p(qty)).toStringAsFixed(fractionDigits);
  }

  ///determines to get caculated or non caculated fs
  String getfs() {
    if (mom.isNotEmpty && fs.isEmpty) {
      return getFsCalculated();
    }
    return fs;
  }

}

///used to store and caculate final variables for percent mac
class PerMac {
  final List<NameWeightFS> nwfss;
  String totMomAsString;
  String totUnSimpMomAsString;
  String totWeightAsSting;
  String simpleMomAsString;
  String balArmAsString;
  String lemacAsString;
  String macAsString;
  String perMacDecimalAsString;
  String perMacPercentAsString;
  String grandTotQty;

  PerMac({
    @required String lemacS,
    @required String macS,
    @required this.nwfss,
    int fractionDigits = 2,
  }) {
    //calculate per mac
    double perMacDecimal = 0;
    double perMacPercent = 0;
    double totMom = 0;
    double totWeight = 0;
    double balArm = 0;
    double simpMom = P.p(nwfss[0].simplemom);
    double lemac = P.p(lemacS);
    double mac = P.p(macS.toString());

    //accumulator for grandTotQty
    int gtq = 0;

    nwfss.forEach((x) {
      gtq += P.pi(x.qty);
      //this is an important step because it will caculate the fs if it did not get assigned.
      //for example, if cargo from the add a was imported, but its fs was never changed, its fs
      // would never be stored in the model. the only fs stored in the model is user edited. All
      //imports from database are stored as simple mom as they apear in tech data. This is where that 
      //simple moment is converted to  raw moment with the nwfs simple moment modifier then into fs if
      //its fs was never assined by the user.
      x.fs = x.getFsCalculated();
      totWeight += P.p(x.getTotalWeight());
      totMom += P.p(x.getTotalMoment());
    });

    balArm = (totMom * simpMom) / totWeight;
    perMacDecimal = (balArm - lemac) / mac;
    perMacPercent = perMacDecimal * 100;

    //assign strings
    totUnSimpMomAsString = (totMom * simpMom).toStringAsFixed(0);
    totMomAsString = totMom.toStringAsFixed(fractionDigits);
    totWeightAsSting = totWeight.toStringAsFixed(fractionDigits);
    simpleMomAsString = simpMom.toStringAsFixed(fractionDigits);

    balArmAsString = balArm.toStringAsFixed(fractionDigits);
    lemacAsString = lemac.toStringAsFixed(fractionDigits);
    macAsString = mac.toStringAsFixed(fractionDigits);

    perMacDecimalAsString = perMacDecimal.toStringAsFixed(fractionDigits + 2);
    perMacPercentAsString = perMacPercent.toStringAsFixed(fractionDigits);

    grandTotQty = gtq.toString();
  }
}

class Glossary {
  final String title, body;
  Glossary(this.title, this.body) :
  assert(title!=null),
  assert(title.isNotEmpty),
  assert(body!=null),
  assert(body.isNotEmpty);
}

///Helper class to try parsing doubles.
class P {
  static int idx = 0;

  ///Given a string try to parse into double. If fail make toast with error.
  static double p(String s) {
    double p = 0.0;
    try {
      p = double.parse(s);
      return p;
    } catch (Exeption) {
      throw Exception();
    }
  }

  static int getUniqueIdx() {
    idx++;
    return idx - 1;
  }

  static int pi(s) {
    int p = 0;
    try {
      p = int.parse(s);
      return p;
    } catch (Exeption) {
      throw Exception();
    }
  }
}

/// used as a model for a more options modal.
/// the name url and icons are all passed to this modal
class MoreOp {
  final List<dynamic> name, url, icon;
  MoreOp({
    @required this.name,
    @required this.url,
    @required this.icon,
  });
}

///home screen model
class HomeModel{
  final Glossary welcome;
  final MoreOp moreop;
  HomeModel({
    @required this.welcome,
    @required this.moreop
  }) : assert(welcome != null), assert(moreop != null);
}