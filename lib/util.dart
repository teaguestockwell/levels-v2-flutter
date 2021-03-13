import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiffy/jiffy.dart';
import './models/nested/cargo.dart';
import 'constant.dart';

typedef void NotifyCargoValid(int nwfID, bool valid);
typedef void OnTextChange(String text);
typedef bool ValidateText(String text);
typedef void NotifyValid(bool valid);
typedef void IntCallBack();
typedef void IntCallBackIntPara(int i);
typedef void StringCallBack(String x);
typedef void DateCallBack(DateTime dateTime);
typedef void NWFSCallBack(int key, Cargo value);
typedef void UnitChangeCB(var i);

// /// for each model in api response, add the model.name as key and model[pk] as val into map
// Map<String,dynamic> mapOfNameIDFromAPIGetN(List<dynamic> x, String apiModelPK) {
//   return Map.fromEntries(
//     x.map<MapEntry<String,dynamic>>(
//       (x) => MapEntry(x[searchField],x[apiModelPK])
//     )
//   );
// }

String getTruncated(String s, int max) {
  if (s.length <= max) {
    return s;
  }
  return s.substring(0, max - 3) + '...';
}

int getDaysInYear(int year) {
  final isLeap = Jiffy({'year': year}).isLeapYear;
  if (isLeap) {
    return 366;
  } else {
    return 365;
  }
}

Color getValidColor(bool isValid){
    if (isValid) {
    return nonfocusedBoderColors;
  }
  return nonfocusedErrorBoderColor;
}

int idx = 0;
///Given a string try to parse into double. If fail make toast with error.
double parsedouble(String s) {

  if(s.isEmpty){s = '0';}

  try {
    return double.parse(s);
  // ignore: avoid_catches_without_on_clauses
  } catch (e) {
    throw Exception('${s} could not be parsed as a double');
  }
}

int getUniqueIdx() {
  idx++;
  return idx - 1;
}

int parseint(s) {
  if(s.isEmpty){s = '0';}
  try {
    return int.parse(s);
  // ignore: avoid_catches_without_on_clauses
  } catch (e) {
    throw Exception('${s} could not be parsed as an int');
  }
}

String fixed(double x) => x.toStringAsFixed(2);

class Distance {
  double numOfBases;
  String name;
  Distance(this.name, this.numOfBases);
}

class Unit {
  List<Distance> list = [];
  static final units = ['Length', 'Mass', 'Area', 'Time', 'Volume', 'Speed'];
  int unit;
  Unit(this.unit) {
    // list.add(Distance('',));
    //if distance 'x',1 then that unit is the base multiplier
    switch (unit) {
      case 0:
        list.add(Distance('32nds Inch', 0.00079375));
        list.add(Distance('Milimeter', 0.001));
        list.add(Distance('16nths Inch', 0.0015875));
        list.add(Distance('Centimeter', 0.01));
        list.add(Distance('Inch', 0.0254));
        list.add(Distance('Foot', 0.3048));
        list.add(Distance('Yard', 0.9144));
        list.add(Distance('Meter', 1));
        list.add(Distance('Kiliometer', 1000));
        list.add(Distance('Mile', 1609.344));
        list.add(Distance('Nautical Mile', 1852));
        break;
      case 1:
        list.add(Distance('Microgram', 0.000000001));
        list.add(Distance('Miligram', 0.000001));
        list.add(Distance('Gram', 0.001));
        list.add(Distance('Ounce', 0.0283495));
        list.add(Distance('Pound', 0.453592));
        list.add(Distance('Kilogram', 1));
        list.add(Distance('Stone', 6.35029));
        list.add(Distance('US Ton', 907.185));
        list.add(Distance('Metric Ton', 1000));
        list.add(Distance('Imperial Ton', 1016.05));
        break;
      case 2:
        list.add(Distance('Inch^2', 0.00064516));
        list.add(Distance('Foot^2', 0.092903));
        list.add(Distance('Yard^2', 0.092903));
        list.add(Distance('Meter^2', 1));
        list.add(Distance('Acre', 4046.86));
        list.add(Distance('Hectare', 10000));
        list.add(Distance('Kilometer^2', 1000000));
        list.add(Distance('Mile^2', 2589988.1103360000998));
        break;
      case 3:
        list.add(Distance('Nanosecond', 0.000000000000011574));
        list.add(Distance('Microsecond', 0.000000000011574));
        list.add(Distance('Milisecond', 0.000000011574));
        list.add(Distance('Second', 0.000011574));
        list.add(Distance('Minute', 0.000694444));
        list.add(Distance('Hour', 0.0416667));
        list.add(Distance('Day', 1));
        list.add(Distance('Week', 7));
        list.add(Distance('Month', 30.4167243334));
        list.add(Distance('Year', 365));
        list.add(Distance('Decade', 3650));
        list.add(Distance('Century', 36500));
        break;
      case 4:
        list.add(Distance('Mililiter', 0.001));
        list.add(Distance('US Teaspoon', 0.00492892));
        list.add(Distance('US Tablespoon', 0.0147868));
        list.add(Distance('Inch^3', 0.0163871));
        list.add(Distance('US Fluid Ounce', 0.0295735));
        list.add(Distance('US Cup', 0.24));
        list.add(Distance('US Pint', 0.473176));
        list.add(Distance('US Quart', 0.946353));
        list.add(Distance('Liter', 1));
        list.add(Distance('US Gallon', 3.78541));
        list.add(Distance('Foot^3', 28.3168));
        list.add(Distance('Meter^3', 1000));
        break;
      case 5:
        list.add(Distance('Kilometer/Hr', 1));
        list.add(Distance('Foot/Sec', 1.09728));
        list.add(Distance('Miles/Hr', 1.60934));
        list.add(Distance('Knot', 1.852));
        list.add(Distance('Meter/Sec', 3.6));
        break;
    }
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regEx = RegExp(r"^\-?\d*\.?\d*");
    String newString = regEx.stringMatch(newValue.text) ?? "";
    return newString == newValue.text ? newValue : oldValue;
  }
}
///allows 'decimal,nums,+,-,e' to not lock exponents 
class DecimalTextInputFormatter2 extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    //final regEx = RegExp(r'[0-9.+-e]+$');
    final regEx = RegExp(r'[0-9.+e-]+$');
    String newString = regEx.stringMatch(newValue.text) ?? "";
    return newString == newValue.text ? newValue : oldValue;
  }
}

String validateIntPositive(String s, void Function(int) setter) {
  if (s.isEmpty) {
    return 'Can not be empty';
  } else if (int.tryParse(s) == null || int.tryParse(s) < 0) {
    return 'Must be a positive integer';
  } else {
    setter(int.parse(s));
    return null;
  }
}

String validateStringNotEmpty(String s, void Function(String) setter) {
  if (s.isEmpty) {
    return 'Can not be empty';
  } else {
    setter(s);
    return null;
  }
}

String valiadateNumAny(String s, void Function(num) setter) {
  if (s.isEmpty) {
    return 'Can not be empty';
  } else if (num.tryParse(s) == null) {
    return 'Must be a number';
  } else {
    setter(num.parse(s));
    return null;
  }
}

String valiadateNumPositive(String s, void Function(num) setter) {
  if (s.isEmpty) {
    return 'Can not be empty';
  } else if (num.tryParse(s) == null) {
    return 'Must be a number';
  } else if (num.tryParse(s) != null && num.tryParse(s) <= 0) {
    return 'Must be a positive number';
  } else {
    setter(num.parse(s));
    return null;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}


String getLoadingMessage() {
  final r = Random();
  return loadingTexts[r.nextInt(loadingTexts.length - 1)];
}

