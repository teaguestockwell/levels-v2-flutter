import '../../backend/cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../utils.dart';

class ValidatedText extends StatefulWidget {
  ///=Const.pickerwidth
  final double width;
  final int maxChars;

  ///select input type 0=int, 1=double, 2=string
  final int inputType;

  ///updated when changed, also see bool void notifyIsValid(bool valid)

  ///updated when text is changed

  final String initText;

  ///called when text is changed
  final NotifyValid notifyIsValid;

  ///called when text is changed
  final OnTextChange onChange;

  ///called when text is changed, changes border around text
  final ValidateText validateText;

  // TextEditingController _c = TextEditingController();

  ValidatedText({
    this.inputType = 1,
    this.onChange,
    this.notifyIsValid,
    this.validateText,
    this.maxChars = 12,
    this.initText,
    this.width,
  });

  @override
  _ValidatedTextState createState() => _ValidatedTextState();
}

class _ValidatedTextState extends State<ValidatedText> {
  bool valid = false;
  InputDecoration dec;
  Widget ret;
  TextEditingController c = TextEditingController();

  String _getTruncated(String x) {
    var ret = x;
    if (ret.length <= this.widget.maxChars) {
      return ret;
    }
    return ret.substring(0, this.widget.maxChars - 3) + '...';
  }

  @override
  void initState() {
    c.text = _getTruncated(this.widget.initText ?? '');


    if (valid) {
      dec = InputDec.wi;
    } else {
      dec = InputDec.re;
    }
    _addListner();
    ret = _getCustomTextFeild(this.widget.inputType);
    super.initState();
  }

  void _addListner() {
    c.addListener(() {
      //validate the text and set outline to red or white
      String text = c.text;
      this.widget.onChange?.call(text);
      this.widget.notifyIsValid?.call(valid);
      if (this.widget.validateText(text)) {
        valid = true;
        setState(() {
          dec = InputDec.wi;
        });
      } else {
        valid = false;
        setState(() {
          dec = InputDec.re;
        });
      }
    });
  }

  Widget _getCustomTextFeild(int type) {
    switch (type) {
      case 0: //ints only
        return Container(
            height: Const.pickerHeight,
            width: this.widget.width ?? Const.pickerWidth,
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
            width: this.widget.width ?? Const.pickerWidth,
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
            width: this.widget.width ?? Const.pickerWidth,
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
      default:
        throw (type.toString() + ' is not 0, 1, or 2');
    }
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getCustomTextFeild(this.widget.inputType);
  }
}
