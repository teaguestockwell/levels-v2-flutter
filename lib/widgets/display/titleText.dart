import '../../backend/cont.dart';
import 'text.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String name;
  final bool valid;

  TitleText({@required this.name, @required this.valid});

  @override
  Widget build(BuildContext context) {
    if (valid) {
      return Tex(
        name,
        fontWeight: FontWeight.normal,
        color: Const.nonfocusedBoderColors,
      );
    } else {
      return Tex(name,
          fontWeight: FontWeight.normal,
          color: Const.nonfocusedErrorBoderColor);
    }
  }
}
