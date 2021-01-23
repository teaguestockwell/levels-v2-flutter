import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../backend/const.dart';
import '../../backend/utils.dart';
import 'custom_button.dart';

class ButtonDatePicker extends StatelessWidget {
  final String buttText;
  final DateCallBack onChange;
  final DateTime currentTime;
  ButtonDatePicker({
    @required this.buttText,
    @required this.onChange,
    @required this.currentTime,
  })  : assert(buttText != null),
        assert(onChange != null),
        assert(currentTime != null);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
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
                  fontSize: Const.textSizeModalSpinner),
              doneStyle:
                  TextStyle(color: Const.textColor, fontSize: Const.textSize)),
        );
      },
    );
  }
}
