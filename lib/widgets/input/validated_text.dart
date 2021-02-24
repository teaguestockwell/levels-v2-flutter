import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../backend/const.dart';
import '../../backend/utils.dart';

class ValidatedText extends StatefulWidget {
  ///0=int, 1=double, 2=String
  final int inputType;
  final double width;
  final int maxChars;
  final String initText;
  final NotifyValid notifyIsValid;
  final OnTextChange onChange;
  final ValidateText validateText;

  ValidatedText({
    @required this.inputType,
    @required this.onChange,
    @required this.notifyIsValid,
    @required this.validateText,
    @required this.maxChars,
    this.initText = '',
    this.width = Const.pickerWidth,
  }) : assert(inputType >= 0 && inputType <= 2);

  @override
  ValidatedTextState createState() => ValidatedTextState();
}

class ValidatedTextState extends State<ValidatedText> {
  bool valid = false;
  InputDecoration dec = InputDec.re;
  final c = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ignore: invalid_use_of_protected_member,invalid_use_of_visible_for_testing_member
      if(c!=null){c.notifyListeners();}
    });

    c.text = Util.getTruncated(this.widget.initText, this.widget.maxChars);

    c.addListener(() {
      //validate the text and set outline to red or white
      String text = c.text;

      this.widget.onChange(text);
      valid = this.widget.validateText(text);
      this.widget.notifyIsValid(valid);

      setState(() {
        if (valid) {dec = InputDec.wi;} 
        else {dec = InputDec.re;}
      });
      
    });
  }

  // ignore: missing_return
  Widget _getCustomTextFeild(int type) {
    switch (type) {
      case 0: //ints only
        return Container(
            height: Const.pickerHeight,
            width: this.widget.width,
            child: TextField(
              cursorColor: Colors.white,
              controller: c,
              decoration: dec,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              inputFormatters: [
                DecimalTextInputFormatter(),
                LengthLimitingTextInputFormatter(this.widget.maxChars),
              ],
              textAlign: TextAlign.center,
            ));
      case 1: //doubles only
        return Container(
            height: Const.pickerHeight,
            width: this.widget.width,
            child: TextField(
              cursorColor: Colors.white,
              controller: c,
              decoration: dec,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                DecimalTextInputFormatter(),
                LengthLimitingTextInputFormatter(this.widget.maxChars),
              ],
              textAlign: TextAlign.center,
            ));
      case 2: //all chars
        return Container(
            height: Const.pickerHeight,
            width: this.widget.width,
            child: TextField(
              cursorColor: Colors.white,
              controller: c,
              decoration: dec,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(this.widget.maxChars),
              ],
            ));
    }
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(_) {
    return _getCustomTextFeild(this.widget.inputType);
  }
}
