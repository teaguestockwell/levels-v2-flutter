import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YYYYMMDDLookup extends StatefulWidget {
  @override
  _YYYYMMDDLookupState createState() => _YYYYMMDDLookupState();
}

class _YYYYMMDDLookupState extends State<YYYYMMDDLookup> {
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
                      width: Const.pickerWidth,
                      height: 30,
                      child: CupertinoPicker(
                        children: getYear(),
                        onSelectedItemChanged: yearChange,
                        itemExtent: 30,
                      )))
            ])),
        Divider(thickness: Const.divThickness,),
        Row2(
            Text('Julian Day'),
            Row(children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      width: Const.pickerWidth,
                      height: 30,
                      child: CupertinoPicker(
                        children: getDays(),
                        onSelectedItemChanged: dayChange,
                        itemExtent: 30,
                      )))
            ])),
        Divider(thickness: Const.divThickness,),
        Row2.padding(
            0, 0, 0, 5.0, Text('YYYY MM DD'), ConstText(dfYMD.format(outYMD)))
      ],
    );
  }
}
