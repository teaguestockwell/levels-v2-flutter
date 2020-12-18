import 'package:five_level_one/backend/cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../utils.dart';
import 'customButton.dart';

class CustomButtonDatePicker extends StatelessWidget {
  String buttText;
  DateCallBack onChange;
  DateTime currentTime;
  CustomButtonDatePicker(
    {
      @required this.buttText,
      @required this.onChange,
      @required this.currentTime,
    }
  );
  @override
  Widget build(BuildContext context) {
    return 
    CustomButton(
      buttText,
      onPressed: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: false,
          onChanged: this.onChange,
          currentTime: this.currentTime,
          locale: LocaleType.en,
          theme: DatePickerTheme(
            backgroundColor: Const.modalPickerColor,
            itemStyle: TextStyle(
              color: Const.textColor,
              fontWeight: Const.fwSpinner,
              fontSize: Const.textSizeModalSpinner
            ),
            doneStyle: TextStyle(
            color: Const.textColor,
              fontSize: Const.textSize
            )
          ), 
        );
      },
    );
  }
}