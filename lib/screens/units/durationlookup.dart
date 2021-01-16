import 'package:five_level_one/widgets/layout/div.dart';
import '../../widgets/display/constText.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/buttonDateTimePicker.dart';
import '../../widgets/layout/rows/row2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DurationLookup extends StatefulWidget {
  @override
  DurationLookupState createState() => DurationLookupState();
}

class DurationLookupState extends State<DurationLookup> {
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
          ButtonDateTimePicker(
            buttText: df.format(one),
            onChange: (var i)=>{setState(() {one = i;})}, 
            currentTime: one,
          )
        ),

        Div(),

        Row2(
          Tex('Date Time Two'),
          ButtonDateTimePicker(
            buttText: df.format(two),
            onChange: (var i)=>{setState(() {two = i;})}, 
            currentTime: one,
          )
        ),
      
        Div(),

        Row2(Tex('Duration hhhhh:mm:ss'), ConstText(getDiff()))
      ]
    );
  }
}
