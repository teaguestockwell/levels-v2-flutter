import 'customButton.dart';
import '../../utils.dart';
import '../../backend/cont.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CustomButtonDateTimePicker extends StatelessWidget {
  String buttText;
  ///use (DateTime)=>{your code here}
  DateCallBack onChange;
  DateTime currentTime;
  ///default yyyy MM dd
  DateFormat dateFormat;
  CustomButtonDateTimePicker(
    {
      @required this.buttText,
      @required this.onChange,
      @required this.currentTime,
      this.dateFormat,
    }
  ){
    this.dateFormat = DateFormat('yyyy MM dd HH:mm');
  }
  @override
  Widget build(BuildContext context) {
    return 
    CustomButton(
      buttText,
      onPressed: () {
        DatePicker.showDateTimePicker(
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
              fontWeight: Const.fwSpinner,
              fontSize: Const.textSizeModalSpinner
            )
          ), 
        );
      },
    );
  }
}