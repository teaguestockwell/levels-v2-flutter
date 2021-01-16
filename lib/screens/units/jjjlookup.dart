import '../../backend/cont.dart';
import '../../widgets/display/constText.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/buttonDatePicker.dart';
import '../../widgets/layout/rows/row2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Column(
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
    );
  }
}
