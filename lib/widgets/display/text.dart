import 'package:flutter/material.dart';
import '../../constant.dart';

class Tex extends StatelessWidget {
  final String text;
  final int maxLine;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  Tex(this.text,{
    this.maxLine = 1,
    this.size=Const.textSizeCardTitle,
    this.fontWeight=FontWeight.bold,
    this.color=Const.textColor,
  }):assert(text!=null),super(key:UniqueKey());


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
      textAlign: TextAlign.center,
    );
  }
}
