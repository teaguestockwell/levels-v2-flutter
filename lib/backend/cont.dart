import 'dart:ui';
import 'package:flutter/material.dart';

class Const {
  static const double 
  pickerWidth = 160,
  pickerHeight = 30,
  timeGridDivSize = 1,
  rowHeight = 30,
  divThickness=1.5,
  rowInset = 10.0,
  modalSpinHeight = 210,
  cardP = 4,
  maxCardWidth = 700,
  cardTabSize =30,

  textSizeCardTitle = 14,
  textSizeModalSpinner = 22,
  textSize = 16;

  static final 
  fwSpinner=FontWeight.normal;

  static const int 
    animationDuration = 100;

  static const Color topBot = Colors.black87,
      navBarSelected = Colors.white70,
      navBarDeselected = Colors.white30,
      bottombarcolor = Colors.white10,
      background = Colors.black,

      cardColor = Colors.white10,
      buttonColor = Colors.white10,
      buttonColorGetMAC = Color.fromRGBO(255,255,255,0.19),
      cargoUIColor = Color.fromRGBO(255,255,255,0.07),

      divColor = Colors.white30,
      textColor = Color.fromRGBO(255,255,255,0.88),

      modalPickerColor= Color.fromRGBO(55,55,55,1),
      
      focusedBorderColor = Color.fromRGBO(165,214,167,1),//Color.fromRGBO(255,255,255,0.88),
      nonfocusedBoderColors = Color.fromRGBO(165,214,167,1), //Colors.white30,

      focusedErrorBorderColor = Color.fromRGBO(244,143,177,1),//Color.fromRGBO(254,112, 123, 1),
      nonfocusedErrorBoderColor = Color.fromRGBO(244,143,177,1);
     
    static const _funColors = <Color>[
      Color.fromRGBO(179,157,219,1),
      Color.fromRGBO(144,202,249,1),
      Color.fromRGBO(244,143,177,1),
      Color.fromRGBO(165,214,167,1),
      Color.fromRGBO(255,204,128,1),
      //Color.fromRGBO(62,98,210,1),
    ];

    static int next =-1;

    static Color rc(){
      next++; if(next>_funColors.length-1){next =0;}
      return _funColors[next];
    }
}

class InputDec {
  static final OutlineInputBorder _wi = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.focusedBorderColor,
        width: Const.divThickness,
      ),
    );

    static final OutlineInputBorder _wiNF = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.nonfocusedBoderColors,
        width: Const.divThickness,
      ),
    );

    static final OutlineInputBorder _div = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.divColor,
        width: Const.divThickness,
      ),
    );

    static final OutlineInputBorder _divNF = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.divColor,
        width: Const.divThickness,
      ),
    );

  static final OutlineInputBorder _re = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.focusedErrorBorderColor,
        width: Const.divThickness,
      ),
    );

    static final OutlineInputBorder _reNF = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Const.nonfocusedErrorBoderColor,
        width: Const.divThickness,
      ),
    );

  static final InputDecoration wi = InputDecoration(
    enabledBorder: _wiNF,
    focusedBorder: _wi,
  );

  static final InputDecoration re = InputDecoration(
    enabledBorder: _reNF,
    focusedBorder: _re,
  );

  static final InputDecoration div = InputDecoration(
    enabledBorder: _divNF,
    focusedBorder: _div,
  );

}