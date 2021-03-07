import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../util.dart';
import '../../widgets/display/text.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Scaffold(
        key: Key('loading'),
        backgroundColor: background,
        body: Center(child:Column(
        children: [
        Spacer(),
        Container(height: 100,
      width: 300,
      child:Tex(getLoadingMessage(),maxLine: 2,),
      ),
      Spacer(),

      Container(
        width: 300.0,
        height: 300.0,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(focusedBorderColor)
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