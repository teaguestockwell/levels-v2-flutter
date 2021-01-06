import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:flutter/material.dart';

class ConstText extends StatelessWidget {
  final String text;
  ConstText(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Const.pickerWidth,
      height: Const.pickerHeight,
      child: Center(
        child: Tex(
          this.text,
          fontWeight: FontWeight.normal,
        )
      )
    );
  }
}