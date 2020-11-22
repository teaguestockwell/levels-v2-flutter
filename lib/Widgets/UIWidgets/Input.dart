import 'package:five_level_one/Backend/cont.dart';
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
              keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
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
  CustomTextFieldText(this.t){width = Const.pickerWidth;}
  CustomTextFieldText.d(this.t){width = Const.pickerWidth * 2.0;}
  @override
  _CustomTextFieldTextState createState() => _CustomTextFieldTextState();
}

class _CustomTextFieldTextState extends State<CustomTextFieldText> {

  @override
  Widget build(BuildContext context) {
    return 
        Container(
            height: Const.pickerHeight,
            width: this.widget.width,
            child: TextField(
              keyboardType: TextInputType.name,
              textAlign: TextAlign.center,
              controller: this.widget.t,
              decoration: InputDec.wi
            )
        );  
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
    return 
        Container(
            height: Const.pickerHeight,
            child: TextField(
              keyboardType: TextInputType.name,
              textAlign: TextAlign.center,
              controller: this.widget.t,
              decoration: InputDec.wi
            )
        );  
  }
}

typedef void IntCallBack();

class CustomButton extends StatelessWidget {
  final String text;
  final IntCallBack onPressed;
  CustomButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight,
        width: Const.pickerWidth,
        child: FlatButton(
          onPressed: () {
            onPressed();
          },
          child: Text(this.text),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.white38),
          ),
        ));
  }
}

class InputDec{
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