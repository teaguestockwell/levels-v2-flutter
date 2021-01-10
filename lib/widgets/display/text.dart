import '../../backend/cont.dart';
import 'package:flutter/material.dart';

class Tex extends StatefulWidget {
  final String text;
  final int maxLine;

  ///default const.textColor
  final Color color;

  ///default = Const.textSizeCardTitle
  final double size;

  ///default = bold
  final FontWeight fontWeight;

  Tex(this.text, {this.maxLine = 1, this.size, this.fontWeight, this.color});

  @override
  _TexState createState() => _TexState();
}

class _TexState extends State<Tex> {
  var size = Const.textSizeCardTitle;
  var color = Const.textColor;
  var fontWeight = FontWeight.bold;

  @override
  void initState() {
    super.initState();

    if (this.widget.color != null) {
      color = this.widget.color;
    }
    if (this.widget.size != null) {
      size = this.widget.size;
    }
    if (this.widget.fontWeight != null) {
      fontWeight = this.widget.fontWeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      this.widget.text,
      maxLines: this.widget.maxLine,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
      textAlign: TextAlign.center,
    );
  }
}
