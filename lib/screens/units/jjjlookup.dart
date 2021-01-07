import '../../backend/cont.dart';
import '../../widgets/display/constText.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/buttonDatePicker.dart';
import '../../widgets/layout/rows/row2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JJJLookup extends StatefulWidget {
  @override
  _JJJLookupState createState() => _JJJLookupState();
}

class _JJJLookupState extends State<JJJLookup> {
  final dfYMD = DateFormat('yyyy MM dd');
  final dfJJJ = DateFormat('DDD');
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
        Row2(
          Tex('YYYY MM DD'),
          CustomButtonDatePicker(
            buttText: dfYMD.format(dateAcomp),
            onChange: timeChange,
            currentTime: dateAcomp,
          )
        ),

        Divider(color: Const.divColor,thickness: Const.divThickness,),

        Row2(Tex('Julian Day'), ConstText(dfJJJ.format(dateAcomp)))
      ],
    );
  }
}
