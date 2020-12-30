import 'package:five_level_one/backend/cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../utils.dart';

class ValidatedText extends StatefulWidget {
  ///=Const.pickerwidth
  double width;
  int maxChars;

  ///select input type 0=int, 1=double, 2=string
  int inputType;

  ///updated when changed, also see bool void notifyIsValid(bool valid)
  bool valid = false;

  ///updated when text is changed
  String text = '';
  String initText;

  ///called when text is changed
  NotifyValid notifyIsValid = (_) {};

  ///called when text is changed
  OnTextChange onChange = (_) {};

  ///called when text is changed, changes border around text
  ValidateText validateText = (_) {
    return true;
  };

  // TextEditingController _c = TextEditingController();

  ValidatedText({
    this.inputType = 1,
    this.onChange,
    this.notifyIsValid,
    this.validateText,
    this.maxChars = 12,
    this.initText,
    this.width,
  }) {
    if (initText != null) {

      text = _getTruncated(initText);
    }
    if (width == null) {
      width = Const.pickerWidth;
    }
    valid = validateText(text);
  }

  String _getTruncated(String x){
    var ret = x;
    if(ret.length<=maxChars){return ret;}
    return ret.substring(0,maxChars-3) + '...';
  }

  @override
  _ValidatedTextState createState() => _ValidatedTextState();
}

class _ValidatedTextState extends State<ValidatedText> {
  InputDecoration dec;
  Widget ret;
  TextEditingController c = TextEditingController();

  @override
  void initState() {
    c.text = this.widget.text;

    if (this.widget.valid) {
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
      this.widget.text = text;
      this.widget.onChange?.call(text);
      this.widget.notifyIsValid?.call(this.widget.valid);
      if (this.widget.validateText(text)) {
        this.widget.valid = true;
        setState(() {
          dec = InputDec.wi;
        });
      } else {
        this.widget.valid = false;
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
            width: this.widget.width,
            child: TextField(
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
