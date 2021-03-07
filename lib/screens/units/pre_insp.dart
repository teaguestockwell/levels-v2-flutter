import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';
import '../../widgets/display/const_text.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/button_date_time_picker.dart';
import '../../widgets/input/button_modal_spinner.dart';
import '../../widgets/layout/row2.dart';

class PreInsp extends StatefulWidget {
  @override
  PreInspState createState() => PreInspState();
}

class PreInspState extends State<PreInsp> {
  ButtonModalSpinner buttonDurration;
  final startHour = 48;
  final numHours = 144;
  final f = DateFormat('yyyy MM dd HH:mm');
  int duration = 48;
  DateTime acompDate;
  String acompString;
  var expireAt =
      DateFormat('yyyy MM dd HH:mm').format(DateTime.now()).toString();

  initState() {
    acompDate = DateTime.now().subtract(Duration(hours: startHour));

    acompString = DateFormat('yyyy MM dd HH:mm')
        .format(DateTime.now().subtract(Duration(hours: startHour)))
        .toString();

    buttonDurration = ButtonModalSpinner(
      stringList: List.generate(numHours, (i) => (i+1).toString()),
      onSpin: lenChange,
      initIdx: duration-1,
    );

    super.initState();
  }

  timeChange(var date) {
    setState(() {
      acompDate = date;
      acompString = f.format(acompDate).toString();
      expireAt = f.format(acompDate.add(Duration(hours: duration))).toString();
    });
  }

  lenChange(int n) {
    setState(() {
      duration = n + 1;
      expireAt = f.format(acompDate.add(Duration(hours: duration))).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:5),
      child:Column(
      children: [
        Row2(
            Tex('Acomplished At'),
            ButtonDateTimePicker(
              buttText: acompString,
              onChange: timeChange,
              currentTime: acompDate,
            )),
        Divider(
          color: divColor,
          thickness: divThickness,
        ),
        Row2(Tex('Hours Until Expire'), buttonDurration),
        Divider(
          color: divColor,
          thickness: divThickness,
        ),
        Row2(Tex('Expires At'), ConstText(expireAt))
      ],
    ));
  }
}
