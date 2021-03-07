import 'package:flutter/material.dart';

import '../../constant.dart';

class Row2 extends StatelessWidget {
  final Widget one, two;
  final double height;
  Row2(this.one, this.two,{this.height=pickerHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        margin: EdgeInsets.all(rowInset),
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