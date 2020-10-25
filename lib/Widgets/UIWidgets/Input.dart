import 'package:five_level_one/Backend/cont.dart';
import 'package:flutter/material.dart';

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
            height: 30,
            width: 160,
            child: TextField(
              controller: this.widget.c,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white60))),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ));
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
