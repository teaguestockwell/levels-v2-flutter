import 'package:flutter/material.dart';

class Aircraft {
  final String name,
      fs0,
      fs1,
      mom0,
      mom1,
      weight0,
      weight1,
      simplemom,
      lemac,
      mac,
      cargomaxweight;

  final List<dynamic> tanknames,
      tankmoms,
      tankweights,
      titles,
      bodys,
      cargonames,
      cargoweights,
      cargomoms,
      configStrings;

  var tanks = List<Tank>();

  var configs = List<Config>();

  var addaCargo = List<NameWeightFS>();

  ///the dynamicly created list of NameWeightFS consisting of fuel, cargo, basic mom, basic w

  Aircraft(
    this.name,
    this.fs0,
    this.fs1,
    this.mom0,
    this.mom1,
    this.weight0,
    this.weight1,
    this.simplemom,
    this.lemac,
    this.mac,
    this.cargomaxweight,
    this.tanknames,
    this.tankmoms,
    this.tankweights,
    this.titles,
    this.bodys,
    this.cargonames,
    this.cargoweights,
    this.cargomoms,
    this.configStrings,
  ) {
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
    for(int i=0;i<configStrings.length;i++) {
      configs.add(
        Config(configStrings[i],this.simplemom)
      );
    }
  }
}
//}

///Tank is a list of NameWeightMoment
class Tank {
  final String name, _weightsCSV, _momCSV, simplemom;

  List<NameWeightFS> nameWeightFSs = List<NameWeightFS>();

  List<String> _weights = List<String>(), _moms = List<String>();

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
class Config{
  var nwfList = List<NameWeightFS>();
  String 
  name,
  simplemom;
  Config(String csv,this.simplemom){
    var nameWeightMomentQtyList = csv.split(';');
    this.name=nameWeightMomentQtyList[0];
    //print(name);

    for(int i=1;i<nameWeightMomentQtyList.length;i++){
      String nwmqAtIndex = nameWeightMomentQtyList[i];
      var nwmqAtIndexList = nwmqAtIndex.split(',');

    this.nwfList.add(
      NameWeightFS(
        name: nwmqAtIndexList[0].trim(),
        weight: (P.p(nwmqAtIndexList[1].trim()) / P.p(nwmqAtIndexList[3].trim())).toString(), // weight = totweight / qty
        mom: (P.p(nwmqAtIndexList[2].trim()) / P.p(nwmqAtIndexList[3].trim())).toString(), // mom = totmom / qty
        simplemom: this.simplemom,
        qty: nwmqAtIndexList[3].trim() // qty = qty
      )
    );  
    }
  }
}

/// NameWeightMom hold a String name,weight,fs,moment; of a cargo item;
class NameWeightFS {
  String simplemom,/// modifier for simple moment
      name,
      weight,
      mom,///simple moment
      fs,
      qty;
    int id;
  NameWeightFS(
      {
      //these are named optinal params
      //default value is given
      this.name = '',
      this.weight = '',
      this.fs = '',
      this.mom = '',
      this.simplemom = '0',
      this.qty = '1',
      }) {
    this.id = P.getUniqueIdx();
    //print(this.toString());
  }

  ///used to create copy of another object, but assign it a new id
  NameWeightFS.copyNewID(
    NameWeightFS old
  ){
    this.name = old.name;
    this.weight = old.weight;
    this.fs = old.fs;
    this.mom = old.mom;
    this.simplemom = old.simplemom;
    this.qty = old.qty;
    this.id = P.getUniqueIdx();
  }

  @override
  String toString() {
    return ("name: " +
        name +
        " weight: " +
        weight +
        " fs: " +
        getFS() +
        ' qty: ' +
        qty +
        ' id: ' +
        id.toString());
  }

  ///total simple moment
  String getMom() {
    return (P.p(fs) * P.p(weight) / P.p(simplemom)).toString();
  }
  /// ea simple momment with fraction digits
  String getMomAsStringFixes(int fractionDigits){
    return (P.p(fs) * P.p(weight) / P.p(simplemom)).toStringAsFixed(fractionDigits);
  }

   /// tot simple momment with fraction digits
  String getTotSimpMomFixed(int fractionDigits){
    return (( P.p(fs) * P.p(weight) / P.p(simplemom))*P.p(qty) ).toStringAsFixed(fractionDigits);
  }

   /// tot simple momment with fraction digits
  String getTotMomAsStringFixes(int fractionDigits){
    return ((P.p(fs) * P.p(weight) / P.p(simplemom))*P.p(qty)).toStringAsFixed(fractionDigits);
  }

  ///ea unsimplified moment as string with faction digits
  String getUnSimpMomAsStringFixed(int fractionDigits){
    return (P.p(fs) * P.p(weight)).toStringAsFixed(fractionDigits);
  }

  /// tot unsimp mom as string fixed
   String getTotUnSimpMomAsStringFixed(int fractionDigits){
    return ((P.p(fs) * P.p(weight)) * P.p(qty)).toStringAsFixed(fractionDigits);
  }

  String getTotalMoment(){
     return ((P.p(fs) * P.p(weight) / P.p(simplemom))*P.p(qty)).toString();
  }

  String getTotalWeight(){
    return (P.p(weight)*P.p(qty)).toString();
  }

  String getFS() {
    if (fs.isNotEmpty) {
      return fs;
    }

    //canot get fs if nsfs is invalid
    return (P.p(mom) * P.p(simplemom) / P.p(weight)).toStringAsFixed(2);
  }

  bool valid(String fs0, String fs1, String weight1,){
    if(
      this.name.isNotEmpty &&
      P.p(this.qty) > 0 &&
      P.p(this.weight) < P.p(weight1) &&
      P.p(this.fs) > P.p(fs0) &&
      P.p(this.fs) < P.p(fs1)
    ){return true;}
    return false;
  }
  String getTotWeightFixed(int fractionDigits){
    return ( P.p(weight) * P.p(qty) ).toStringAsFixed(fractionDigits);
  }
}

class PerMac{
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
    int fractionDigits=2,
  }){
    //calculate per mac
    double perMacDecimal=0;
    double perMacPercent=0;
    double totMom=0;
    double totWeight=0;
    double balArm=0;
    double simpMom = P.p(nwfss[0].simplemom);
    double lemac = P.p(lemacS);
    double mac = P.p(macS.toString());

    //accumulator for grandTotQty
    int gtq=0;

    nwfss.forEach((x){
      gtq += P.pi(x.qty);
      x.fs = x.getFS();
      totWeight+= P.p(x.getTotalWeight());
      totMom+= P.p(x.getTotalMoment());
    });

    balArm = (totMom * simpMom) / totWeight;
    perMacDecimal = (balArm - lemac) / mac;
    perMacPercent = perMacDecimal*100;
    
    //assign strings
    totUnSimpMomAsString = (totMom*simpMom).toStringAsFixed(0);
    totMomAsString = totMom.toStringAsFixed(fractionDigits);
    totWeightAsSting = totWeight.toStringAsFixed(fractionDigits);
    simpleMomAsString = simpMom.toStringAsFixed(fractionDigits);

    balArmAsString = balArm.toStringAsFixed(fractionDigits);
    lemacAsString = lemac.toStringAsFixed(fractionDigits);
    macAsString = mac.toStringAsFixed(fractionDigits);

    perMacDecimalAsString = perMacDecimal.toStringAsFixed(fractionDigits+2);
    perMacPercentAsString = perMacPercent.toStringAsFixed(fractionDigits);

    grandTotQty = gtq.toString();
  }
  
  void printString(){
    nwfss.forEach((x) {
       print(
        ' name '+x.name+
        ' qty '+x.qty+
        ' totweight '+x.getTotalWeight()+
        ' fs '+x.getFS()+
        ' totmom '+x.getTotalMoment()
      );
    });
    print('totMom '+totMomAsString);
    print('totWeight '+totWeightAsSting);
    print('simpleMom '+simpleMomAsString);
    print('balArm '+balArmAsString);
    print('lemac '+lemacAsString);
    print('mac '+macAsString);
    print('permac dec '+perMacDecimalAsString);
    print('permac % '+perMacPercentAsString);
  }
}

class General {
  String csvAllMds, welcometitle, welcomebody;
  List<String> mdsNames;

  General(this.csvAllMds, this.welcometitle, this.welcomebody){
    mdsNames = csvAllMds.split(',');
  }
}

class Glossary {
  final String title, body;

  Glossary(this.title, this.body);
}

///Helper class to try parsing doubles.
class P {
  static int idx=0;
  ///Given a string try to parse into double. If fail make toast with error.
  static double p(String s) {
    double p = 0.0;
    try{
    p = double.parse(s);
    return p;
    }
    catch (Exeption){throw Exception();}
  }
  static int getUniqueIdx(){
    idx++;
    return idx-1;
  }
  static int pi(s){
    int p = 0;
    try{
      p = int.parse(s);
      return p;
    }
    catch (Exeption){throw Exception();}
  }
  }

class MoreOp{
  final List<dynamic> name,url,icon;
  MoreOp({
    @required this.name, 
    @required this.url,
    @required this.icon,
  });
}
