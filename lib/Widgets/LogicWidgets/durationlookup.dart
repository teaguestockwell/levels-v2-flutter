import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class DurationLookup extends StatefulWidget {
  @override
  _DurationLookupState createState() => _DurationLookupState();
}

class _DurationLookupState extends State<DurationLookup> {
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
    return CCards('Duration',Column(children: [
      Row2(
          Text('Date Time One'),
          CustomButton(
            df.format(one),
            onPressed: () {
              DatePicker.showDateTimePicker(context,
                  showTitleActions: false,
                  theme: DatePickerTheme(
                      backgroundColor: Colors.black,
                      itemStyle: TextStyle(
                          color: Const.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Const.maxTextSize),
                      doneStyle:
                          TextStyle(color: Const.textColor, fontSize: Const.maxTextSize)),
                  onChanged: changeOne,
                  currentTime: one,
                  locale: LocaleType.en);
            },
          )),
      Divider(thickness: Const.divThickness,),
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
                          fontSize: Const.maxTextSize),
                      doneStyle:
                          TextStyle(color: Colors.white60, fontSize: Const.maxTextSize)),
                  onChanged: changeTwo,
                  currentTime: two,
                  locale: LocaleType.en);
            },
          )),
      Divider(thickness: Const.divThickness,),
      Row2(Text('Duration hhhhh:mm:ss'), ConstText(getDiff()))
    ]));
  }
}
