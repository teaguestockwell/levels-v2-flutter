import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
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
  var one, two, oneIn, twoOut, unitIdx;
  CustomTextField tfOne, tfTwo;
  List<Distance> selectedUnitUnits = List();
  String unitName, selectedOne, selectedTwo;
  bool toggle = true;

  @override
  void initState() {
    controllerOne.addListener(() {
      oneChanged(toggle);
    });
    controllerTwo.addListener(() {
      twoChanged(toggle);
    });
    tfOne = CustomTextField(controllerOne);
    tfTwo = CustomTextField(controllerTwo);
    selectedUnitUnits = Unit(0).list;
    unitName = Unit.units[0];
    unitIdx = 0;
    one = 0;
    two = 0;
    oneIn = 0;
    twoOut = '';
    super.initState();
  }

  List<String> getListDistanceNames() {
    var ret = List<String>();
    for (Distance d in selectedUnitUnits) {
      ret.add(d.name);
    }
    return ret;
  }

  @override
  void dispose() {
    controllerTwo.dispose();
    controllerOne.dispose();
    super.dispose();
  }

  unitChange(int n) {
    setState(() {
      one = 0;
      two = 0;
      selectedUnitUnits = Unit(n).list;
      unitIdx = n;
      unitName = Unit.units[n];
      selectedOne = Unit(n).list[0].name;
      selectedTwo = Unit(n).list[0].name;
    });
  }

  void twoChanged(var i) {
    if (i is int) {
      //if not bool, try to get the int
      two = i;
      selectedTwo = selectedUnitUnits[i].name;
      toggle = true;
    }

    if (toggle) {
      toggle = !toggle;
      String x = controllerTwo.text;
      if (x == '' || x == null) {
        x = '0';
      }
      controllerOne.text = (double.parse(x) * //double from feild 1 times
              selectedUnitUnits[two].numOfBases / //double from spinner 1 base divided by
              selectedUnitUnits[one].numOfBases)
          .toStringAsPrecision(6); //spinner 2 base
    } else {
      toggle = !toggle;
    }
  }

  void oneChanged(var i) {
    if (i is int) {
      //if not bool, try to get the int
      one = i;
      selectedOne = selectedUnitUnits[i].name;
      toggle = true;
    }
    if (toggle) {
      toggle = !toggle;
      String x = controllerOne.text;
      if (x == '' || x == null) {
        x = '0';
      }
      controllerTwo.text = (double.parse(x) * //double from feild 1 times
              selectedUnitUnits[one].numOfBases / //double from spinner 1 base divided by
              selectedUnitUnits[two].numOfBases)
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
      //Divider(thickness: Const.divThickness,),
      Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white60),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(children: [
                  tfOne,
                  CustomButtomSpinnerModalString(
                    getListDistanceNames(),
                    onPressed: oneChanged,
                    selected: selectedOne,
                    spinIdx: one,
                  ),
                ])),
            Spacer(),
            Text('=',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white60)),
            Spacer(),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white60),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(children: [
                  tfTwo,
                  CustomButtomSpinnerModalString(
                    getListDistanceNames(),
                    onPressed: twoChanged,
                    selected: selectedOne,
                    spinIdx: two,
                  ),
                ])),
          ]))
    ]);
  }
}
