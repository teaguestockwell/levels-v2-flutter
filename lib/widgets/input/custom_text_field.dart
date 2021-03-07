import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant.dart';
import '../../util.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController c;
  CustomTextField(this.c) : assert(c != null);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final dec = InputDec.div;

  @override
  void initState() {
    super.initState();
    this.widget.c.addListener(() {
      setState(() {});
    });
  }

  // @override
  // void dispose(){
  //   this.widget.c.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight,
        width: Const.pickerWidth,
        child: TextField(
          cursorColor: Colors.white,
          controller: this.widget.c,
          decoration: dec,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[
            DecimalTextInputFormatter2(),
            LengthLimitingTextInputFormatter(12)
          ],
          textAlign: TextAlign.center,
        ));
  }
}
