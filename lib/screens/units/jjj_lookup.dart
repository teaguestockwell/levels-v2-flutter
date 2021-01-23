import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../backend/const.dart';
import '../../widgets/display/const_text.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/button_date_picker.dart';
import '../../widgets/layout/rows/row2.dart';

class JJJLookup extends StatefulWidget {
  @override
  JJJLookupState createState() => JJJLookupState();
}

class JJJLookupState extends State<JJJLookup> {
  final dfYMD = DateFormat('yyyy MM dd');
  final dfJJJ = DateFormat('DDD');
  var dateAcomp = DateTime.now().toUtc();
  var row;

  timeChange(var date) {
    setState(() {
      dateAcomp = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:5),
      child:Column(
      children: [
        row = Row2(
        Tex('YYYY MM DD'),
        ButtonDatePicker(
          buttText: dfYMD.format(dateAcomp),
          onChange: timeChange,
          currentTime: dateAcomp,
        )),
        Divider(
          color: Const.divColor,
          thickness: Const.divThickness,
        ),
        Row2(Tex('Julian Day'), ConstText(dfJJJ.format(dateAcomp)))
      ],
    ));
  }
}
