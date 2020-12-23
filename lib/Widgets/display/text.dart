import 'package:flutter/material.dart';
import 'package:five_level_one/backend/cont.dart';

///AutoSizing Text
class Tex extends StatelessWidget {
  final String text;
  final int maxLine;
  ///default const.textColor
  Color color = Const.textColor; 
  ///default = Const.textSizeCardTitle
  double size = Const.textSizeCardTitle;
  ///default = bold
  FontWeight fontWeight=FontWeight.bold;
  Tex(this.text,{this.maxLine=1,this.size,this.fontWeight, this.color});
  @override
  Widget build(BuildContext context) {
    

    return Text(
      this.text,
       maxLines: maxLine,
       style: TextStyle(
         color: color,
        fontSize: size,
        fontWeight: fontWeight
        ),
        textAlign: TextAlign.center,
        );
    
  }
}