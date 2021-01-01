import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:flutter/material.dart';

class TitleText extends StatefulWidget {
  final String name;
  TitleTextState state;
  TitleText(this.name);

  @override
  TitleTextState createState(){
    this.state = TitleTextState();
    return this.state;
  }
}

class TitleTextState extends State<TitleText> {
  bool _valid = false;

  void setValid(bool valid){  
    setState((){this._valid=valid;});
  }

  @override
  Widget build(BuildContext context) {
    if(_valid){
      return Tex(this.widget.name,fontWeight: FontWeight.normal);
    }
    else{
      return Tex(this.widget.name,fontWeight: FontWeight.normal, color: Const.nonfocusedErrorBoderColor);
    }
  }
}