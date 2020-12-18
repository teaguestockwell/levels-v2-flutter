import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/Widgets/Uitls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils.dart';

class CustomTextField extends StatefulWidget {
  var c = TextEditingController();

  CustomTextField(this.c);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  InputDecoration dec;

  @override
  initState() {
    dec = InputDec.wi;
    this.widget.c.addListener(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight,
        width: Const.pickerWidth,
        child: TextField(
          controller: this.widget.c,
          decoration: dec,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[DecimalTextInputFormatter()],
          textAlign: TextAlign.center,
        ));
  }
}
