import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YYYYMMDDLookup2 extends StatefulWidget {
 
  @override
  _YYYYMMDDLookup2State createState() => _YYYYMMDDLookup2State();
}

class _YYYYMMDDLookup2State extends State<YYYYMMDDLookup2> {
  var year = DateTime.now().year;
  var jjj = int.tryParse(DateFormat('DDD').format(DateTime.now()));
  var dfYMD = DateFormat('yyyy MM dd');
  var outYMD = DateTime.now();
  int daysInyea = 366;


  List<String> getStringYear() {
    var ret = List<String>();
    for (int i = 2060; i > 2000; i--) {
      ret.add(i.toString());
    }
    return ret;
  }

  List<String> getStringDays() {
    var ret = List<String>();
    for (int i = daysInyea; i > 0; i--) {
      ret.add(i.toString());
    }
    return ret;
  }

  yearChange(var newyear) {
    //Complicated logic that handles day spinner index for leap years
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
        Row2(
            Tex('YYYY'),
            CustomButtomSpinnerModalString(
              getStringYear(),
              onPressed: yearChange,
              spinIdx: 2060 - year,
              selected: year.toString(),
            )),
        Divider(color: Const.divColor,
          thickness: Const.divThickness,
        ),
        Row2(
            Tex('Julian Day'),
            CustomButtomSpinnerModalString(
              getStringDays(),
              onPressed: dayChange,
              spinIdx: daysInyea - jjj,
              selected: jjj.toString(),
            )),
        Divider(color: Const.divColor,
          thickness: Const.divThickness,
        ),
        Row2(Tex('YYYY MM DD'), ConstText(dfYMD.format(outYMD)))
      ],
    );
  }
}
