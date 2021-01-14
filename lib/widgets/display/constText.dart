import '../../backend/cont.dart';
import '../../widgets/display/text.dart';
import 'package:flutter/material.dart';

class ConstText extends StatelessWidget {
  final String text;
  ConstText(this.text) : assert(text != null);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Const.pickerWidth,
        height: Const.pickerHeight,
        child: Center(
            child: Tex(
          this.text,
          fontWeight: FontWeight.normal,
        )));
  }
}
