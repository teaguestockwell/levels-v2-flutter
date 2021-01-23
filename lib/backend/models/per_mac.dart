import 'package:flutter/foundation.dart';
import '../utils.dart';
import 'name_weight_fs.dart';

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
    double simpMom = Util.parsedouble(nwfss[0].simplemom);
    double lemac = Util.parsedouble(lemacS);
    double mac = Util.parsedouble(macS.toString());

    //accumulator for grandTotQty
    int gtq = 0;

    nwfss.forEach((x) {
      gtq += Util.parseint(x.qty);
      //this is an important step because it will caculate the fs if it did not get assigned.
      //for example, if cargo from the add a was imported, but its fs was never changed, its fs
      // would never be stored in the model. the only fs stored in the model is user edited. All
      //imports from database are stored as simple mom as they apear in tech data. This is where that 
      //simple moment is converted to  raw moment with the nwfs simple moment modifier then into fs if
      //its fs was never assined by the user.
      x.fs = x.getFsCalculated();
      totWeight += Util.parsedouble(x.getTotalWeight());
      totMom += Util.parsedouble(x.getTotalMoment());
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