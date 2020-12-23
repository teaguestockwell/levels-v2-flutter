import 'package:five_level_one/backend/cont.dart';
import 'package:flutter/material.dart';

class Row2 extends StatelessWidget {
  final Widget one, two;
  final double height;
  Row2(this.one, this.two,{this.height=Const.pickerHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        margin: EdgeInsets.all(Const.rowInset),
        child: Center(
          child:Row(
            children:[
              one,
              Spacer(),
              two
            ]
          ),
        )
      );
  }
}