import 'package:five_level_one/Backend/cont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Uitls.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController c;
  CustomTextField(this.c);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return //Flexible(child:
        Container(
            height: Const.pickerHeight,
            width: Const.pickerWidth,
            child: TextField(
              controller: this.widget.c,
              decoration: InputDec.wi,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                DecimalTextInputFormatter()
              ],
              textAlign: TextAlign.center,
            ));
  }
}

class CustomTextFieldText extends StatefulWidget {
  TextEditingController t;
  double width;
  int maxSize;
  CustomTextFieldText(this.t) {
    width = Const.pickerWidth;
  }
  CustomTextFieldText.d(this.t) {
    width = Const.pickerWidth * 2.0;
  }
  @override
  _CustomTextFieldTextState createState() => _CustomTextFieldTextState();
}

class _CustomTextFieldTextState extends State<CustomTextFieldText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight,
        width: this.widget.width,
        child: TextField(
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            controller: this.widget.t,
            decoration: InputDec.wi));
  }
}
class CustomTextFieldNumSize extends StatefulWidget {
  final TextEditingController t;
  final int maxSize;
  final bool decimal;
  CustomTextFieldNumSize(this.t,this.maxSize,{this.decimal=true});
  @override
  _CustomTextFieldNumSizeState createState() => _CustomTextFieldNumSizeState();
}

class _CustomTextFieldNumSizeState extends State<CustomTextFieldNumSize> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight*1.7,
        width: Const.pickerWidth,
        child: TextField(
            maxLength: this.widget.maxSize,
            keyboardType: TextInputType.numberWithOptions(decimal: this.widget.decimal),
            textAlign: TextAlign.center,
            controller: this.widget.t,
            decoration: InputDec.wi));
  }
}

class CustomTextFieldTextMax extends StatefulWidget {
  TextEditingController t;
  CustomTextFieldTextMax(this.t);

  @override
  _CustomTextFieldTextMaxState createState() => _CustomTextFieldTextMaxState();
}

class _CustomTextFieldTextMaxState extends State<CustomTextFieldTextMax> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight*1.7,
        child: TextField(
          maxLength: 45,
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            controller: this.widget.t,
            decoration: InputDec.wi));
  }
}

typedef void IntCallBack();
typedef void IntCallBackIntPara(int i);

class CustomButton extends StatelessWidget {
  final String text;
  final IntCallBack onPressed;
  CustomButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Const.pickerHeight,
      width: Const.pickerWidth,
      decoration: BoxDecoration(
        color: Const.buttonColor,
        borderRadius: BorderRadius.circular(8)
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child:FlatButton(
          onPressed: onPressed,
          child: Text(this.text),
          ),
    )
    );
  }
}

class InputDec {
  static InputDecoration wi = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 1.0,
      ),
    ),
  );

  static InputDecoration re = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 1.0,
      ),
    ),
  );
}

class CustomButtomSpinnerModalString extends StatefulWidget {
  int spinIdx;
  String selected;
  List<String> stringList;
  IntCallBackIntPara onPressed;
  CustomButtomSpinnerModalString(this.stringList,
      {this.spinIdx, this.onPressed});
  @override
  _CustomButtomSpinnerModalStringState createState() =>
      _CustomButtomSpinnerModalStringState();
}

class _CustomButtomSpinnerModalStringState
    extends State<CustomButtomSpinnerModalString> {
  @override
  void initState() {
    this.widget.spinIdx ??= 0;
    this.widget.selected = this.widget.stringList[this.widget.spinIdx];
    super.initState();
  }

  void _spin(int newIdx) {
    this.widget.spinIdx = newIdx;
    this.widget.selected = this.widget.stringList[newIdx];

    this.widget.onPressed ?? (newIdx);
    //rebuild to change button text
    setState(() {});
  }

  List<Widget> _getSpinnerWidgets() {
    var ret = List<Widget>();
    for (String x in this.widget.stringList) {
      ret.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            x,
            style: TextStyle(color: Colors.white70, fontSize: 22),
          )));
      print(x);
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      this.widget.selected,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 210,
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        height: 210,
                        child: Center(
                            child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                              initialItem: this.widget.spinIdx),
                          children: _getSpinnerWidgets(),
                          onSelectedItemChanged: _spin,
                          itemExtent: 35,
                        ))),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
