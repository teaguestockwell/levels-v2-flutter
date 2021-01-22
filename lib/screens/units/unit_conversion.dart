import 'package:flutter/material.dart';

import '../../backend/const.dart';
import '../../backend/utils.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/button_modal_spinner.dart';
import '../../widgets/input/custom_text_field.dart';
import '../../widgets/layout/rows/row1.dart';

class UnitConversion extends StatefulWidget {
  @override
  UnitConversionState createState() => UnitConversionState();
}

class UnitConversionState extends State<UnitConversion> {
  final controllerOne = TextEditingController();
  final controllerTwo = TextEditingController();
  int leftUnitUnitIdx, rightUnitUnitIdx, unitIdx;
  Widget tfOne, tfTwo;
  List<Distance> selectedUnitUnits = [];
  String unitName;
  bool toggle = true;

  @override
  void initState() {
    super.initState();

    controllerOne.addListener(() {
      leftUnitUnitChanged(toggle);
    });
    controllerTwo.addListener(() {
      rightUnitUnitChanged(toggle);
    });

    tfOne = CustomTextField(controllerOne);
    tfTwo = CustomTextField(controllerTwo);

    selectedUnitUnits = Unit(0).list;
    unitName = Unit.units[0];
    unitIdx = 0;
    leftUnitUnitIdx = 0;
    rightUnitUnitIdx = 0;
  }

  @override
  void dispose() {
    controllerTwo.dispose();
    controllerOne.dispose();
    super.dispose();
  }

  List<String> getListDistanceNames() {
    List<String> ret = [];
    for (Distance d in selectedUnitUnits) {
      ret.add(d.name);
    }
    return ret;
  }

  void unitChange(int n) {
    setState(() {
      leftUnitUnitIdx = 0;
      rightUnitUnitIdx = 0;
      toggle = false;
      controllerOne.text = '';
      toggle = false;
      controllerTwo.text = '';
      selectedUnitUnits = Unit(n).list;
      unitIdx = n;
      unitName = Unit.units[n];
    });
  }

  ///accepts bool or ino unlock toggle and make opisite
  void rightUnitUnitChanged(var i) {
    if (i is int) {
      rightUnitUnitIdx = i;
      toggle = true;
    }

    if (toggle) {
      toggle = !toggle;
      String x = controllerTwo.text;
      if (x == '' || x == null || double.tryParse(x)==null) {
        x = '0';
      }
      controllerOne.text = (double.parse(x) * //double from feild 1 times
              selectedUnitUnits[rightUnitUnitIdx]
                  .numOfBases / //double from spinner 1 base divided by
              selectedUnitUnits[leftUnitUnitIdx].numOfBases)
          .toStringAsPrecision(6); //spinner 2 base
    } else {
      toggle = !toggle;
    }
  }

  ///accepts bool or ino unlock toggle and make opisite
  void leftUnitUnitChanged(var i) {
    if (i is int) {
      leftUnitUnitIdx = i;
      toggle = true;
    }
    if (toggle) {
      toggle = !toggle;
      String x = controllerOne.text;
      if (x == '' || x == null || double.tryParse(x)==null) {
        x = '0';
      }
      controllerTwo.text = (double.parse(x) * //double from feild 1 times
              selectedUnitUnits[leftUnitUnitIdx]
                  .numOfBases / //double from spinner 1 base divided by
              selectedUnitUnits[rightUnitUnitIdx].numOfBases)
          .toStringAsPrecision(6); //spinner 2 base
    } else {
      toggle = !toggle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RowCenter(Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          width: Const.pickerWidth,
          height: Const.pickerHeight,
          child: ButtonModalSpinner(
            stringList: Unit.units,
            onSpin: unitChange,
            initIdx: unitIdx,
          ))),
      Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Const.divColor, width: Const.divThickness),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(children: [
                  tfOne,
                  ButtonModalSpinner(
                    stringList: getListDistanceNames(),
                    onSpin: leftUnitUnitChanged,
                  ),
                ])),
            Spacer(),
            Tex(
              '=',
            ),
            Spacer(),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Const.divColor, width: Const.divThickness),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(children: [
                  tfTwo,
                  ButtonModalSpinner(
                    stringList: getListDistanceNames(),
                    onSpin: rightUnitUnitChanged,
                  ),
                ])),
          ]))
    ]);
  }
}
