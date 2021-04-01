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
typedef void UnitCategoriesCallBackUnitCategoriesPara(UnitCategories u);
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

Color getValidColor(bool isValid) {
  if (isValid) {
    return nonfocusedBoderColors;
  }
  return nonfocusedErrorBoderColor;
}

int idx = 0;

///Given a string try to parse into double. If fail make toast with error.
double parsedouble(String s) {
  if (s.isEmpty) {
    s = '0';
  }

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
  if (s.isEmpty) {
    s = '0';
  }
  try {
    return int.parse(s);
    // ignore: avoid_catches_without_on_clauses
  } catch (e) {
    throw Exception('${s} could not be parsed as an int');
  }
}

String fixed(double x) => x.toStringAsFixed(2);

class Unit {
  Unit(this.name, this.baseMultiplier);
  double baseMultiplier;
  String name;
}

enum UnitCategories { Distance, Mass, Area, Time, Volume, Speed }

final indexToUnitCatagory = {
  UnitCategories.Distance.index : UnitCategories.Distance,
  UnitCategories.Mass.index : UnitCategories.Mass,
  UnitCategories.Area.index : UnitCategories.Area,
  UnitCategories.Time.index : UnitCategories.Time,
  UnitCategories.Volume.index : UnitCategories.Volume,
  UnitCategories.Speed.index : UnitCategories.Speed,
};

// <UnitCategories
//[Unit]>{}=
final unitCategoryConversions = <UnitCategories, List<Unit>>{
  UnitCategories.Distance: [
    Unit('32nds Inch', 0.00079375),
    Unit('Milimeter', 0.001),
    Unit('16nths Inch', 0.0015875),
    Unit('Centimeter', 0.01),
    Unit('Inch', 0.0254),
    Unit('Foot', 0.3048),
    Unit('Yard', 0.9144),
    Unit('Meter', 1),
    Unit('Kiliometer', 1000),
    Unit('Mile', 1609.344),
    Unit('Nautical Mile', 1852),
    Unit('Light Year', 9460730472580938)
  ], // for space force and spock
  UnitCategories.Mass: [
    Unit('Microgram', 0.000000001),
    Unit('Miligram', 0.000001),
    Unit('Gram', 0.001),
    Unit('Ounce', 0.0283495),
    Unit('Pound', 0.453592),
    Unit('Kilogram', 1),
    Unit('Stone', 6.35029),
    Unit('US Ton', 907.185),
    Unit('Metric Ton', 1000),
    Unit('Imperial Ton', 1016.05)
  ],
  UnitCategories.Area: [
    Unit('Inch^2', 0.00064516),
    Unit('Foot^2', 0.092903),
    Unit('Yard^2', 0.092903),
    Unit('Meter^2', 1),
    Unit('Acre', 4046.86),
    Unit('Hectare', 10000),
    Unit('Kilometer^2', 1000000),
    Unit('Mile^2', 2589988.1103360000998)
  ],
  UnitCategories.Time: [
    Unit('Nanosecond', 0.000000000000011574),
    Unit('Microsecond', 0.000000000011574),
    Unit('Milisecond', 0.000000011574),
    Unit('Second', 0.000011574),
    Unit('Minute', 0.000694444),
    Unit('Hour', 0.0416667),
    Unit('Day', 1),
    Unit('Week', 7),
    Unit('Month', 30.4167243334),
    Unit('Year', 365),
    Unit('Decade', 3650),
    Unit('Century', 36500)
  ],
  UnitCategories.Volume: [
    Unit('Mililiter', 0.001),
    Unit('US Teaspoon', 0.00492892),
    Unit('US Tablespoon', 0.0147868),
    Unit('Inch^3', 0.0163871),
    Unit('US Fluid Ounce', 0.0295735),
    Unit('US Cup', 0.24),
    Unit('US Pint', 0.473176),
    Unit('US Quart', 0.946353),
    Unit('Liter', 1),
    Unit('US Gallon', 3.78541),
    Unit('Foot^3', 28.3168),
    Unit('Meter^3', 1000)
  ],
  UnitCategories.Speed: [
    Unit('Kilometer/Hr', 1),
    Unit('Foot/Sec', 1.09728),
    Unit('Miles/Hr', 1.60934),
    Unit('Knot', 1.852),
    Unit('Meter/Sec', 3.6)
  ]
};

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