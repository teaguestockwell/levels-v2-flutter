import '../../../backend/cont.dart';
import 'package:flutter/material.dart';

class Row3 extends StatelessWidget {
  final Widget one, two, three;
  Row3(this.one, this.two, this.three);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Const.rowHeight,
      margin: EdgeInsets.all(Const.rowInset),
      child: Row(
        children: [
          Spacer(),
          Expanded(flex: 10,child:one), 
          Spacer(), 
          Expanded(flex: 10,child:two), 
          Spacer(), 
          Expanded(flex: 10,child:three),
          Spacer(),
        ]
      ),
    );
  }
}