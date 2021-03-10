import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../util.dart';
import '../../widgets/display/text.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IntCallBack onPressed;
  final Color color;
  CustomButton(this.text, {this.onPressed, this.color, Key key}): assert(text != null), super(key:key);
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: pickerHeight,
        width: pickerWidth,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TextButton(
            onPressed: this.widget.onPressed ?? () {},
            child: Tex(
              this.widget.text,
              color: this.widget.color ?? textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ));
  }
}
