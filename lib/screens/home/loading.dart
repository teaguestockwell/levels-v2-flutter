import '../../widgets/display/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
//import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import '../../utils.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Column(
        children: [
        Spacer(),
        Container(height: 100,
      width: 300,
      child:Tex(LoadingMessage.getText(),maxLine: 2,),
      ),
      Spacer(),

      // Container(
      //   width: 300.0,
      //   height: 300.0,
      //   child: CircularProgressIndicator(
      //     valueColor: AlwaysStoppedAnimation<Color>(Const.focusedBorderColor)
      //   )
      // ),
      

      Container(child:SpinningWheel(
        Image.asset('assets/jet.png'),
        width: 300.0,
        height: 300.0, dividers: 6,
        onEnd: (_){},
        onUpdate: (_){},
        spinResistance: 0.2,
        )
      ),
    
      Spacer(),
        ]
      )
    );
  }
}