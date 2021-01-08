import '../../backend/cont.dart';
import '../../widgets/display/text.dart';
import '../../utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IntCallBack onPressed;
  Color color;
  CustomButton(this.text, {this.onPressed, this.color}){if(color==null){color=Const.textColor;}}

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight,
        width: Const.pickerWidth,
        decoration: BoxDecoration(
            color: Const.buttonColor, borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FlatButton(
            onPressed: onPressed,
            child: Tex(
              this.text,
              color: color,
              fontWeight: FontWeight.normal,
            ),
          ),
        ));
  }
}
