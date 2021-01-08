import '../../backend/cont.dart';
import '../../widgets/display/text.dart';
import '../../utils.dart';
import 'package:flutter/material.dart';

class GetMacButton extends StatelessWidget {
  final String text;
  final IntCallBack onPressed;
  GetMacButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Const.rowInset),
      child:
      
      Container(
        height: Const.pickerHeight*2,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Const.buttonColorGetMAC, borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FlatButton(
            onPressed: onPressed,
            child: Tex(
              this.text,
              fontWeight: FontWeight.normal,
            ),
          ),
        )));
  }
}