import '../../backend/cont.dart';
import '../../widgets/display/text.dart';
import 'package:flutter/material.dart';

class TitleText extends StatefulWidget {
  final String name;
  TitleTextState state;
  bool initValid;
  TitleText(this.name,{this.initValid=false});

  @override
  TitleTextState createState(){
    this.state = TitleTextState();
    return this.state;
  }
}

class TitleTextState extends State<TitleText> {
  bool _valid;

  @override
  void initState() {
    super.initState();
    _valid = this.widget.initValid;
  }

  void setValid(bool valid){  
    setState((){this._valid=valid;});
  }

  @override
  Widget build(BuildContext context) {
    if(_valid){
      return Tex(this.widget.name,fontWeight: FontWeight.normal, color: Const.nonfocusedBoderColors,);
    }
    else{
      return Tex(this.widget.name,fontWeight: FontWeight.normal, color: Const.nonfocusedErrorBoderColor);
    }
  }
}