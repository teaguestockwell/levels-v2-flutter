import '../utils.dart';

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
    this.id = Util.getUniqueIdx();
  }

  ///used to create copy of another object, but assign it a new id
  NameWeightFS.copyNewID(NameWeightFS old) {
    this.name = old.name;
    this.weight = old.weight;
    this.fs = old.fs;
    this.mom = old.mom;
    this.simplemom = old.simplemom;
    this.qty = old.qty;
    this.id = Util.getUniqueIdx();
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
    return (Util.parsedouble(fs) * Util.parsedouble(weight) / Util.parsedouble(simplemom)).toString();
  }

  /// ea simple momment with fraction digits
  String getMomAsStringFixes(int fractionDigits) {
    return (Util.parsedouble(fs) * Util.parsedouble(weight) / Util.parsedouble(simplemom))
        .toStringAsFixed(fractionDigits);
  }

  /// tot simple momment with fraction digits
  String getTotSimpMomFixed(int fractionDigits) {
    return ((Util.parsedouble(fs) * Util.parsedouble(weight) / Util.parsedouble(simplemom)) * Util.parsedouble(qty))
        .toStringAsFixed(fractionDigits);
  }

  /// tot simple momment with fraction digits
  String getTotMomAsStringFixes(int fractionDigits) {
    return ((Util.parsedouble(fs) * Util.parsedouble(weight) / Util.parsedouble(simplemom)) * Util.parsedouble(qty))
        .toStringAsFixed(fractionDigits);
  }

  ///ea unsimplified moment as string with faction digits
  String getUnSimpMomAsStringFixed(int fractionDigits) {
    return (Util.parsedouble(fs) * Util.parsedouble(weight)).toStringAsFixed(fractionDigits);
  }

  /// tot unsimp mom as string fixed
  String getTotUnSimpMomAsStringFixed(int fractionDigits) {
    return ((Util.parsedouble(fs) * Util.parsedouble(weight)) * Util.parsedouble(qty)).toStringAsFixed(fractionDigits);
  }

  String getTotalMoment() {
    return ((Util.parsedouble(fs) * Util.parsedouble(weight) / Util.parsedouble(simplemom)) * Util.parsedouble(qty)).toString();
  }

  String getTotalWeight() {
    return (Util.parsedouble(weight) * Util.parsedouble(qty)).toString();
  }

  ///This is used to pull fs from mom and weight
  ///given that mom is simplified moment, when multiplied by mom modifer = raw moment
  String getFsCalculated() {
    if (fs.isNotEmpty) {
      return fs;
    }
    
    //canot get fs if nsfs is invalid
    return (Util.parsedouble(mom) * Util.parsedouble(simplemom) / Util.parsedouble(weight)).toStringAsFixed(2);
  }

  String getTotWeightFixed(int fractionDigits) {
    return (Util.parsedouble(weight) * Util.parsedouble(qty)).toStringAsFixed(fractionDigits);
  }

  ///determines to get caculated or non caculated fs
  String getfs() {
    if (mom.isNotEmpty && fs.isEmpty) {
      return getFsCalculated();
    }
    return fs;
  }

}