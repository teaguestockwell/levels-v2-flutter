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
  maxCardWidth = 1000,
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
      focusedBorderColor = Color.fromRGBO(255,255,255,0.88),
      nonfocusedBoderColors = Colors.white30,
      
      textColor = Color.fromRGBO(255,255,255,0.88),

      modalPickerColor= Color.fromRGBO(55,55,55,1),
      
      focusedErrorBorderColor = Color.fromRGBO(253, 11, 30, 1),
     nonfocusedErrorBoderColor = Color.fromRGBO(254,112, 123, 1);
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
}