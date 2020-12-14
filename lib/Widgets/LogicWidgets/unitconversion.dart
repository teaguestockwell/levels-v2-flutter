import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/buttonDateTimePicker.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:five_level_one/Widgets/UIWidgets/input/buttonModalSpinner.dart';
import 'package:five_level_one/Widgets/UIWidgets/input/unitConversionCustomTextFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Uitls.dart';

class tDistanceBody extends StatefulWidget {
  @override
  _tDistanceBodyState createState() => _tDistanceBodyState();
}

class _tDistanceBodyState extends State<tDistanceBody> {
  var controllerOne = TextEditingController();
  var controllerTwo = TextEditingController();
  var leftUnitUnitIdx, rightUnitUnitIdx, unitIdx;
  CustomTextField tfOne, tfTwo;
  var selectedUnitUnits = List<Distance>();
  String unitName;
  bool toggle = true;

  @override
  void initState() {
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
    super.initState();
  }

  @override
  void dispose() {
    controllerTwo.dispose();
    controllerOne.dispose();
    super.dispose();
  }

  List<String> getListDistanceNames() {
    var ret = List<String>();
    for (Distance d in selectedUnitUnits) {
      ret.add(d.name);
    }
    return ret;
  }

  unitChange(int n) {
    setState(() {
      leftUnitUnitIdx = 0;
      rightUnitUnitIdx = 0;
      toggle = true;
      controllerOne.text = '';
      selectedUnitUnits = Unit(n).list;
      unitIdx = n;
      unitName = Unit.units[n];
    });
  }

  ///accepts bool to unlock toggle
  void rightUnitUnitChanged(var i) {
    if (i is int) {
      //if not bool, try to get the int
      rightUnitUnitIdx = i;
      toggle = true;
    }

    if (toggle) {
      toggle = !toggle;
      String x = controllerTwo.text;
      if (x == '' || x == null) {
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

  ///accepts bool to unlock toggle
  void leftUnitUnitChanged(var i) {
    if (i is int) {
      //if not bool, try to get the int
      leftUnitUnitIdx = i;
      toggle = true;
    }
    if (toggle) {
      toggle = !toggle;
      String x = controllerOne.text;
      if (x == '' || x == null) {
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
          child: CustomButtomSpinnerModalString(
            Unit.units,
            onPressed: unitChange,
            selected: unitName,
            spinIdx: unitIdx,
          ))),
      //Divider(color: Const.divColor,thickness: Const.divThickness,),
      Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Const.divColor, width: Const.divThickness),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(children: [
                  tfOne,
                  CustomButtomSpinnerModalString(
                    getListDistanceNames(),
                    onPressed: leftUnitUnitChanged,
                    selected: selectedUnitUnits[leftUnitUnitIdx].name,
                    spinIdx: leftUnitUnitIdx,
                  ),
                ])),
            Spacer(),
            Tex('=',),
            Spacer(),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Const.divColor, width: Const.divThickness),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(children: [
                  tfTwo,
                  CustomButtomSpinnerModalString(
                    getListDistanceNames(),
                    onPressed: rightUnitUnitChanged,
                    selected: selectedUnitUnits[rightUnitUnitIdx].name,
                    spinIdx: rightUnitUnitIdx,
                  ),
                ])),
          ]))
    ]);
  }
}
