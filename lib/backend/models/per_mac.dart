import 'package:flutter/foundation.dart';
import 'cargo.dart';

///used to store and caculate final variables for percent mac
class PerMac {
  final List<Cargo> nwfss;
  String totSimpleMomAsString;
  String totUnSimpMomAsString;
  String totWeightAsSting;
  String simpleMomAsString;
  String balArmAsString;
  String lemacAsString;
  String macAsString;
  String perMacDecimalAsString;
  String perMacPercentAsString;
  String grandTotQty;
  num mommultipler;
  final num lemac;
  final num mac;

  PerMac({
    @required this.mommultipler,
    @required this.lemac,
    @required this.mac,
    @required this.nwfss,
    int fractionDigits = 2,
  }) {
    //calculate per mac
    double perMacDecimal = 0;
    double perMacPercent = 0;
    double totMom = 0;
    double totWeight = 0;
    double balArm = 0;

    //accumulator for grandTotQty
    int gtq = 0;

    nwfss.forEach((x) {
      gtq += x.qty;
      totWeight += x.weightTot;
      totMom += x.momTot;
    });

    balArm = totMom  / totWeight;
    perMacDecimal = (balArm - lemac) / mac;
    perMacPercent = perMacDecimal * 100;

    //assign strings
    totUnSimpMomAsString = totMom.toStringAsFixed(0);
    totSimpleMomAsString = (totMom / mommultipler).toStringAsFixed(fractionDigits);
    totWeightAsSting = totWeight.toStringAsFixed(fractionDigits);
    simpleMomAsString = mommultipler.toStringAsFixed(fractionDigits);

    balArmAsString = balArm.toStringAsFixed(fractionDigits);
    lemacAsString = lemac.toStringAsFixed(fractionDigits);
    macAsString = mac.toStringAsFixed(fractionDigits);

    perMacDecimalAsString = perMacDecimal.toStringAsFixed(fractionDigits + 2);
    perMacPercentAsString = perMacPercent.toStringAsFixed(fractionDigits);

    grandTotQty = gtq.toString();
  }
}