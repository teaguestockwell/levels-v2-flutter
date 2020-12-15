import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/input/buttonDateTimePicker.dart';
import 'package:five_level_one/Widgets/UIWidgets/input/buttonDateTimePicker.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:five_level_one/Widgets/UIWidgets/input/buttonModalSpinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PreInsp extends StatefulWidget {
  CustomButtomSpinnerModalString buttonDurration;
  @override
  _PreInspState createState() => _PreInspState();
}

class _PreInspState extends State<PreInsp> {
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

    var stringList = List<String>();
    for (int i = 1; i <= numHours; i++) {
      stringList.add(i.toString());
    }
    this.widget.buttonDurration = CustomButtomSpinnerModalString(
      stringList,
      onPressed: lenChange,
      spinIdx: startHour - 1,
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
      duration = this.widget.buttonDurration.spinIdx + 1;
      expireAt = f.format(acompDate.add(Duration(hours: duration))).toString();
    });
  }

  void p() {
    print(
        'achompDate: $acompDate \n expireAt: $expireAt \n acomp: $acompString \n duration: $duration');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row2(
          Tex('Acomplished At'),
          CustomButtonDateTimePicker(
            buttText: acompString,
            onChange: timeChange,
            currentTime: acompDate,
           )
        ),

        Divider(color: Const.divColor,
          thickness: Const.divThickness,
        ),

        Row2(Tex('Hours Until Expire'), this.widget.buttonDurration),
        
        Divider(color: Const.divColor,
          thickness: Const.divThickness,
        ),

        Row2(Tex('Expires At'), ConstText(expireAt))
      ],
    );
  }
}
