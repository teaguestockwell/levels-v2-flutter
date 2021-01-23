import 'package:flutter/material.dart';
import '../../backend/const.dart';
import '../../backend/utils.dart';
import '../../widgets/display/text.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Scaffold(
        key: Key('loading'),
        backgroundColor: Const.background,
        body: Center(child:Column(
        children: [
        Spacer(),
        Container(height: 100,
      width: 300,
      child:Tex(LoadingMessage.getText(),maxLine: 2,),
      ),
      Spacer(),

      Container(
        width: 300.0,
        height: 300.0,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Const.focusedBorderColor)
        )
      ),
      

      // Container(child:SpinningWheel(
      //   Image.asset('assets/jet.png'),
      //   width: 300.0,
      //   height: 300.0, dividers: 6,
      //   onEnd: (_){},
      //   onUpdate: (_){},
      //   spinResistance: 0.2,
      //   )
      // ),
    
      Spacer(),
        ]
      )))
    );
  }
}