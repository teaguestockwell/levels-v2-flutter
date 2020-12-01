import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class JJJLookup extends StatefulWidget {
  @override
  _JJJLookupState createState() => _JJJLookupState();
}

class _JJJLookupState extends State<JJJLookup> {
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
    return CCards('Julian Lookup', Column(
      children: [
        Row2(
            Tex('YYYY MM DD'),
            CustomButton(
              dfYMD.format(dateAcomp),
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: false,
                    theme: DatePickerTheme(
                        backgroundColor: Colors.black,
                        itemStyle: TextStyle(
                            color: Const.textColor,
                            fontWeight: Const.textWeight,
                            fontSize: Const.maxTextSize),
                        doneStyle:
                            TextStyle(color: Const.textColor, fontSize: Const.maxTextSize)),
                    onChanged: timeChange,
                    currentTime: dateAcomp,
                    locale: LocaleType.en);
              },
            )),
        Divider(thickness: Const.divThickness,),
        Row2(Tex('Julian Day'), ConstText(dfJJJ.format(dateAcomp)))
      ],
    ));
  }
}
