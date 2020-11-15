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
            height: Const.pickerHeight,
            width: Const.pickerWidth,
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
              decoration: InputDecoration(
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
  )
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
