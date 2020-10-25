import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Uitls.dart';

class DistanceBody extends StatefulWidget {
  @override
  _DistanceBodyState createState() => _DistanceBodyState();
}

class _DistanceBodyState extends State<DistanceBody> {
  var controllerOne = TextEditingController();
  var controllerTwo = TextEditingController();
  var one, two, oneIn, twoOut;
  CustomTextField tfOne, tfTwo;
  List<Distance> list = List();
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
    one = 0;
    two = 0;
    oneIn = 0;
    twoOut = '';
    super.initState();
  }

  @override
  void dispose() {
    controllerTwo.dispose();
    controllerOne.dispose();
    super.dispose();
  }

  void twoChanged(var i) {
    if (i is int) {
      //if not bool, try to get the int
      two = i;
      toggle = true;
    }

    if (toggle) {
      toggle = !toggle;
      String x = controllerTwo.text;
      if (x == '' || x == null) {
        x = '0';
      }
      controllerOne.text = (double.parse(x) * //double from feild 1 times
              list[two].numOfBases / //double from spinner 1 base divided by
              list[one].numOfBases)
          .toStringAsPrecision(6); //spinner 2 base
    } else {
      toggle = !toggle;
    }
  }

  void oneChanged(var i) {
    if (i is int) {
      //if not bool, try to get the int
      one = i;
      toggle = true;
    }
    if (toggle) {
      toggle = !toggle;
      String x = controllerOne.text;
      if (x == '' || x == null) {
        x = '0';
      }
      controllerTwo.text = (double.parse(x) * //double from feild 1 times
              list[one].numOfBases / //double from spinner 1 base divided by
              list[two].numOfBases)
          .toStringAsPrecision(6); //spinner 2 base
    } else {
      toggle = !toggle;
    }
  }

  distanceChanges() {}
  @override
  Widget build(BuildContext context) {
    return //Column(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Row(children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(children: [
                    tfOne,
                    Container(
                        width: 160,
                        height: 30,
                        child: CupertinoPicker(
                          children: list,
                          onSelectedItemChanged: (int i) => {
                            oneChanged(i),
                          },
                          itemExtent: 30,
                        )),
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
                    Container(
                        width: 160,
                        height: 30,
                        child: CupertinoPicker(
                          children: list,
                          onSelectedItemChanged: (int i) => {twoChanged(i)},
                          itemExtent: 30,
                        )),
                  ])),
            ]));
  }
}

class tDistanceBody extends StatefulWidget {
  @override
  _tDistanceBodyState createState() => _tDistanceBodyState();
}

class _tDistanceBodyState extends State<tDistanceBody> {
  var controllerOne = TextEditingController();
  var controllerTwo = TextEditingController();
  var one, two, oneIn, twoOut, number;
  CustomTextField tfOne, tfTwo;
  List<Distance> list = List();

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
    list = Unit(0).list;
    one = 0;
    two = 0;
    oneIn = 0;
    twoOut = '';
    number = 0;
    super.initState();
  }

  @override
  void dispose() {
    controllerTwo.dispose();
    controllerOne.dispose();
    super.dispose();
  }

  getUnits() {
    List<Widget> list = [];
    list.add(ListElement('Length'));
    list.add(ListElement('Mass'));
    list.add(ListElement('Area'));
    list.add(ListElement('Time'));
    list.add(ListElement('Volume'));
    list.add(ListElement('Speed'));
    return list;
  }

  unitChange(var n) {
    print(n);
    setState(() {
      list = Unit(n).list;
    });
  }

  void twoChanged(var i) {
    if (i is int) {
      //if not bool, try to get the int
      two = i;
      toggle = true;
    }

    if (toggle) {
      toggle = !toggle;
      String x = controllerTwo.text;
      if (x == '' || x == null) {
        x = '0';
      }
      controllerOne.text = (double.parse(x) * //double from feild 1 times
              list[two].numOfBases / //double from spinner 1 base divided by
              list[one].numOfBases)
          .toStringAsPrecision(6); //spinner 2 base
    } else {
      toggle = !toggle;
    }
  }

  void oneChanged(var i) {
    if (i is int) {
      //if not bool, try to get the int
      one = i;
      toggle = true;
    }
    if (toggle) {
      toggle = !toggle;
      String x = controllerOne.text;
      if (x == '' || x == null) {
        x = '0';
      }
      controllerTwo.text = (double.parse(x) * //double from feild 1 times
              list[one].numOfBases / //double from spinner 1 base divided by
              list[two].numOfBases)
          .toStringAsPrecision(6); //spinner 2 base
    } else {
      toggle = !toggle;
    }
  }

  distanceChanges() {}
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RowCenter(Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          width: 160,
          height: 30,
          child: CupertinoPicker(
            children: getUnits(),
            onSelectedItemChanged: unitChange,
            itemExtent: 30,
          ))),
      Divider(),
      Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Row(children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white60),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(children: [
                  tfOne,
                  Container(
                      width: 160,
                      height: 30,
                      child: CupertinoPicker(
                        children: list,
                        onSelectedItemChanged: (int i) => {
                          oneChanged(i),
                        },
                        itemExtent: 30,
                      )),
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
                  Container(
                      width: 160,
                      height: 30,
                      child: CupertinoPicker(
                        children: list,
                        onSelectedItemChanged: (int i) => {twoChanged(i)},
                        itemExtent: 30,
                      )),
                ])),
          ]))
    ]);
  }
}
