import 'package:flutter/material.dart';
import 'package:five_level_one/backend/cont.dart';

///AutoSizing Text
class Tex extends StatelessWidget {
  final String text;
  final int maxLine;
  Color color = Const.textColor; 
  ///=Const.textSizeCardTitle
  double size;
  ///= bold
  FontWeight fontWeight;
  Tex(this.text,{this.maxLine=1,this.size,this.fontWeight, this.color}){
    if(this.size==null){this.size=Const.textSizeCardTitle;}
    if(this.fontWeight==null){this.fontWeight=FontWeight.bold;}
    }
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