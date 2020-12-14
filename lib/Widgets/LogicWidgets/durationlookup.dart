import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/buttonDateTimePicker.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DurationLookup extends StatefulWidget {
  @override
  _DurationLookupState createState() => _DurationLookupState();
}

class _DurationLookupState extends State<DurationLookup> {
  DateTime one = DateTime.now();
  DateTime two = DateTime.now().subtract(Duration(hours: 48));
  final df = DateFormat('yyyy MM dd HH:mm');

  String getDiff() {
    //round to nearest min
    int sec = one.difference(two).inSeconds;
    if(sec %60 !=0){
      int rem = sec%60;
      if(rem >=30){while(sec%60!=0){sec++;}}
      while(sec%60!=0){sec--;}
    }

    return Duration(seconds: sec).abs().toString().substring(0, 12);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row2(
          Tex('Date Time One'),
          CustomButtonDateTimePicker(
            buttText: df.format(one),
            onChange: (var i)=>{setState(() {one = i;})}, 
            currentTime: one,
          )
        ),

        Divider(color: Const.divColor,thickness: Const.divThickness,),

        Row2(
          Tex('Date Time Two'),
          CustomButtonDateTimePicker(
            buttText: df.format(two),
            onChange: (var i)=>{setState(() {two = i;})}, 
            currentTime: one,
          )
        ),
      
        Divider(color: Const.divColor,thickness: Const.divThickness,),

        Row2(Tex('Duration hhhhh:mm:ss'), ConstText(getDiff()))
      ]
    );
  }
}
