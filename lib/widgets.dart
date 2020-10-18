import 'dart:ui';
import 'package:five_level_one/model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'uiwidgets.dart';

class TimeGrid extends StatefulWidget {
  _TimeGrid createState() => _TimeGrid();
}

class _TimeGrid extends State<TimeGrid> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var znow = now.toUtc();

    var lYYYYMMDD = DateFormat('yyyy MM dd').format(now).toString();
    var lJJJ = DateFormat('DDD').format(now).toString();
    var lHHMMSS = DateFormat('HH:mm:ss').format(now).toString();

    var zYYYYMMDD = DateFormat('yyyy MM dd').format(znow).toString();
    var zJJJ = DateFormat('DDD').format(znow).toString();
    var zHHMMSS = DateFormat('HH:mm:ss').format(znow).toString();

    return AlignPadding(
        2.0,
        Alignment.center,
        Table(
            border: TableBorder(
                horizontalInside: BorderSide(color: Colors.white60, width: 1),
                verticalInside: BorderSide(color: Colors.white60, width: 1)),
            children: [
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'Zone',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'hh:mm:ss',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'JJJ',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'YYYY MM DD',
                      textAlign: TextAlign.center,
                    )))
              ]),
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'Local',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      lHHMMSS,
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      lJJJ,
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      lYYYYMMDD,
                      textAlign: TextAlign.center,
                    )))
              ]),
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'Zulu',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      zHHMMSS,
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      zJJJ,
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      zYYYYMMDD,
                      textAlign: TextAlign.center,
                    )))
              ]),
            ]));
  }
}

class InspBody extends StatefulWidget {
  @override
  _InspBodyState createState() => _InspBodyState();
}

class _InspBodyState extends State<InspBody> {
  var f = DateFormat('yyyy MM dd HH:mm');
  var number = 48;
  var acompDate = DateTime.now().subtract(Duration(hours: 48));
  var acomp = DateFormat('yyyy MM dd HH:mm')
      .format(DateTime.now().subtract(Duration(hours: 48)))
      .toString();
  var expireAt =
      DateFormat('yyyy MM dd HH:mm').format(DateTime.now()).toString();

  timeChange(var date) {
    setState(() {
      acompDate = date;
      acomp = f.format(acompDate).toString();
      expireAt = f.format(acompDate.add(Duration(hours: number))).toString();
      print(
          '\n duration change: \n achompDate: $acompDate \n expireAt: $expireAt \n acomp: $acomp \n duration: $number');
    });
  }

  lenChange(var n) {
    print(n);
    setState(() {
      number = 48 - n;
      expireAt = f.format(acompDate.add(Duration(hours: number))).toString();
      print(
          '\n duration change: \n achompDate: $acompDate \n expireAt: $expireAt \n acomp: $acomp \n duration: $number');
    });
  }

  get1to48() {
    List<Widget> list = [];
    for (int i = 48; i > 0; i--) {
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: Text(
            i.toString(),
            style: TextStyle(color: Colors.white70, fontSize: 18),
          )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row2.padding(
            0,
            5.0,
            0,
            0,
            Text('Acomplished At'),
            CustomButton(
              acomp,
              onPressed: () {
                DatePicker.showDateTimePicker(context,
                    showTitleActions: false,
                    theme: DatePickerTheme(
                        backgroundColor: Colors.black,
                        itemStyle: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        doneStyle:
                            TextStyle(color: Colors.white60, fontSize: 18)),
                    onChanged: timeChange,
                    currentTime: acompDate,
                    locale: LocaleType.en);
              },
            )),
        Divider(),
        Row2(
            Text('Hours Until Expire'),
            Row(children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      width: 40,
                      height: 30,
                      child: CupertinoPicker(
                        children: get1to48(),
                        onSelectedItemChanged: lenChange,
                        itemExtent: 30,
                      )))
            ])),
        Divider(),
        Row2.padding(0, 0, 0, 5.0, Text('Expires At'), Text(expireAt))
      ],
    );
  }
}

class JulianLookupBody extends StatefulWidget {
  @override
  _JulianLookupBodyState createState() => _JulianLookupBodyState();
}

class _JulianLookupBodyState extends State<JulianLookupBody> {
  var dfYMD = DateFormat('yyyy MM dd');
  var dfJJJ = DateFormat('DDD');
  var dateAcomp = DateTime.now().toUtc();

  timeChange(var date) {
    setState(() {
      dateAcomp = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row2.padding(
            0,
            5.0,
            0,
            0,
            Text('YYYY MM DD'),
            CustomButton(
              dfYMD.format(dateAcomp),
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: false,
                    theme: DatePickerTheme(
                        backgroundColor: Colors.black,
                        itemStyle: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        doneStyle:
                            TextStyle(color: Colors.white60, fontSize: 18)),
                    onChanged: timeChange,
                    currentTime: dateAcomp,
                    locale: LocaleType.en);
              },
            )),
        Divider(),
        Row2.padding(
            0, 0, 0, 5.0, Text('Julian Day'), Text(dfJJJ.format(dateAcomp)))
      ],
    );
  }
}

class YMDLookUp extends StatefulWidget {
  @override
  _YMDLookUpState createState() => _YMDLookUpState();
}

class _YMDLookUpState extends State<YMDLookUp> {
  var year = 2060;
  var jjj = 366;
  var dfYMD = DateFormat('yyyy MM dd');
  var outYMD = DateTime(2060, 12, 31, 12, 00);
  int daysInyea = 366;

  getYear() {
    List<Widget> list = [];
    for (int i = 2060; i > 2000; i--) {
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            i.toString(),
            style: TextStyle(color: Colors.white70, fontSize: 18),
          )));
    }
    return list;
  }

  getDays() {
    List<Widget> list = [];
    for (int i = daysInyea; i > 0; i--) {
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            i.toString(),
            style: TextStyle(color: Colors.white70, fontSize: 18),
          )));
    }
    return list;
  }

  yearChange(var newyear) {
    //Complicated logic that handles leap years based on previous state
    setState(() {
      year = 2060 - newyear;
      var boy = DateTime(2060 - newyear, 1, 1, 12, 00);
      if (newyear % 4 == 0) {
        print('is leap');
        outYMD = boy.add(Duration(days: jjj));
        jjj += 1;
        daysInyea = 366;
      } else {
        print('is not leap');
        if (daysInyea == 366) {
          outYMD = boy.add(Duration(days: jjj - 2));
          jjj -= 1;
        } else {
          outYMD = boy.add(Duration(days: jjj - 1));
          jjj;
        }
        daysInyea = 365;
      }
    });
  }

  dayChange(var newjjj) {
    setState(() {
      jjj = daysInyea - newjjj;
      print(jjj);
      var boy = DateTime(year, 1, 1, 12, 00);
      outYMD = boy.add(Duration(days: jjj - 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row2.padding(
            0,
            5,
            0,
            0,
            Text('YYYY'),
            Row(children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      width: 80,
                      height: 30,
                      child: CupertinoPicker(
                        children: getYear(),
                        onSelectedItemChanged: yearChange,
                        itemExtent: 30,
                      )))
            ])),
        Divider(),
        Row2(
            Text('Julian Day'),
            Row(children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      width: 80,
                      height: 30,
                      child: CupertinoPicker(
                        children: getDays(),
                        onSelectedItemChanged: dayChange,
                        itemExtent: 30,
                      )))
            ])),
        Divider(),
        Row2.padding(
            0, 0, 0, 5.0, Text('YYYY MM DD'), Text(dfYMD.format(outYMD)))
      ],
    );
  }
}

class DateTimeDiffrence extends StatefulWidget {
  @override
  _DateTimeDiffrenceState createState() => _DateTimeDiffrenceState();
}

class _DateTimeDiffrenceState extends State<DateTimeDiffrence> {
  DateTime one = DateTime.now();
  DateTime two = DateTime.now().subtract(Duration(hours: 48));
  var df = DateFormat('yyyy MM dd HH:mm');

  changeOne(var o) {
    setState(() {
      one = o;
    });
  }

  changeTwo(var t) {
    setState(() {
      two = t;
    });
  }

  String getDiff() {
    return one.difference(two).abs().toString().substring(0, 8);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row2.padding(
          0,
          5.0,
          0,
          0,
          Text('Date Time One'),
          CustomButton(
            df.format(one),
            onPressed: () {
              DatePicker.showDateTimePicker(context,
                  showTitleActions: false,
                  theme: DatePickerTheme(
                      backgroundColor: Colors.black,
                      itemStyle: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      doneStyle:
                          TextStyle(color: Colors.white60, fontSize: 18)),
                  onChanged: changeOne,
                  currentTime: one,
                  locale: LocaleType.en);
            },
          )),
      Divider(),
      Row2(
          Text('Date Time Two'),
          CustomButton(
            df.format(two),
            onPressed: () {
              DatePicker.showDateTimePicker(context,
                  showTitleActions: false,
                  theme: DatePickerTheme(
                      backgroundColor: Colors.black,
                      itemStyle: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      doneStyle:
                          TextStyle(color: Colors.white60, fontSize: 18)),
                  onChanged: changeTwo,
                  currentTime: two,
                  locale: LocaleType.en);
            },
          )),
      Divider(),
      Row2.padding(0, 0, 0, 5.0, Text('Duration hhhhh:mm:ss'), Text(getDiff()))
    ]);
  }
}

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
    list.add(listElement('Length'));
    list.add(listElement('Mass'));
    list.add(listElement('Area'));
    list.add(listElement('Time'));
    list.add(listElement('Volume'));
    list.add(listElement('Speed'));
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

class SelectMDSBody extends StatefulWidget {
  String mdsCSV;
  String selection;
  final IntCallBack onPressed;
  SelectMDSBody(this.mdsCSV, {this.onPressed});
  @override
  _SelectMDSBodyState createState() => _SelectMDSBodyState();
}

class _SelectMDSBodyState extends State<SelectMDSBody> {
  List<String> mdss;
  String selectedMDS;

  @override
  void initState() {
    mdss = this.widget.mdsCSV.split(',');
    selectedMDS = mdss.elementAt(0);
    this.widget.selection = mdss.elementAt(0);
    super.initState();
  }

  getMDS() {
    List<Widget> list = [];
    for (var s in mdss) {
      print(s);
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: Text(
            s,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          )));
    }
    return list;
  }

  mdsChanged(int i) {
    setState(() {
      selectedMDS = mdss.elementAt(i);
      this.widget.selection = mdss.elementAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: RowCenter(CupertinoPicker(
            children: getMDS(),
            onSelectedItemChanged: mdsChanged,
            itemExtent: 30,
          ))),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: RowCenter(CustomButton(
            'Select',
            onPressed: () {
              this.widget.onPressed();
            },
          )))
    ]);
  }
}

//helper class /stless
typedef void IntCallBack();

class Unit {
  List<Distance> list = List();
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

class listElement extends StatelessWidget {
  String name;
  listElement(this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
        child: Text(
          name,
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ));
  }
}

class Distance extends StatelessWidget {
  // base is a meter
  double numOfBases;
  String name;
  Distance(this.name, this.numOfBases);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
        child: Text(name, style: TextStyle(color: Colors.white60)));
  }
}

class PerMacScreen extends StatefulWidget {
  Aircraft air;
  PerMacScreen(this.air);
  @override
  _PerMacScreenState createState() => _PerMacScreenState();
}

class _PerMacScreenState extends State<PerMacScreen> {
  Widget body;
  Aircraft air;
  List<TankRow> tankRows = List<TankRow>();

  @override
  void initState() {
    air = this.widget.air;

    //init default tank selection
   for (Tank t in air.tanks) {
      tankRows.add(TankRow(t));
    }
    super.initState();
  }

  // Widget buildTankRowsAtI(int i){
  //   var ret;
  //   if(i==0){ret = Row2.padding(0, 5, 0, 0, one, two);}
  //   else if(i!= air.tanknames.length-1){ret = Row2();}
  //   else{ret = Row2.padding(0, 0, 0, 5, one, two);}
  //   return ret;
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CCards("Aircraft", Row2(Text("MDS"),Text(air.name))),
        CCards(
          "Tanks",
           Column(
             children: tankRows
          ),
        ),
        ChartCRow(air),
      ]
    );
  }
}

// appon loading the permac widget, build a cc

//column
//cccard("fuel", fuelcardbody)
//ccardf("chart c", chartcbody)
//ccard("cargo", cargobody)

class TankRow extends StatefulWidget {
  Tank t;
  NameWeightFS selected;
  TankRow(this.t);
  @override
  _TankRowState createState() => _TankRowState();
}

class _TankRowState extends State<TankRow> {
  @override
  void initState() {
    this.widget.selected = this.widget.t.nameWeightFSs[0];
    super.initState();
  }

  lenChange(var n) {
    print(n);
    setState(() {
      this.widget.selected = this.widget.t.nameWeightFSs[n];
      print(this.widget.selected.toString());
    });
  }

  getTankWidgetsForSpinner() {
    List<Widget> list = [];
    for (int i = 0; i < this.widget.t.nameWeightFSs.length; i++) {
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: Text(
            this.widget.t.nameWeightFSs[i].weight,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row2(
        Text(this.widget.t.name),
        Row(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                  width: 120,
                  height: 30,
                  child: CupertinoPicker(
                    children: getTankWidgetsForSpinner(),
                    onSelectedItemChanged: lenChange,
                    itemExtent: 30,
                  )))
        ]),);
  }
}

class ChartCRow extends StatefulWidget {
  Aircraft a;
  ChartCRow(this.a);
  @override
  _ChartCRowState createState() => _ChartCRowState();
}

class _ChartCRowState extends State<ChartCRow> {

  @override
  Widget build(BuildContext context) {
    return CCards(
      "Chart C",
       Column(children: [
         RowCenterOne(

           Container(
             width: 240,
             height: 30,
             child: 
           TextField(
             decoration: InputDecoration(labelText: "Enter Basic Weight"),
             keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
                                ],
           )
         )
         ),
         Divider(),

         RowCenterOne(
           Container(
             width: 240,
             height: 30,
             child:
           
           TextField(
             decoration: InputDecoration(labelText: "Enter Basic Moment"),
             keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
                                ],
           )
         )
         ),
       ],));
  }
}

class custompick extends CommonPickerModel{
  
}
