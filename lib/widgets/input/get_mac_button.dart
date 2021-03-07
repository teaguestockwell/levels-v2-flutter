import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../util.dart';
import '../../widgets/display/text.dart';

class GetMacButton extends StatelessWidget {
  final String text;
  final IntCallBack onPressed;
  GetMacButton({@required this.text, @required this.onPressed})
      : assert(text != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(rowInset),
        child: Container(
            height: pickerHeight * 2,
            width: double.infinity,
            decoration: BoxDecoration(
                color: buttonColorGetMAC,
                borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FlatButton(
                key: Key('get mac'),
                onPressed: onPressed,
                child: Tex(
                  this.text,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )));
  }
}
