import 'package:flutter/material.dart';
import 'package:five_level_one/backend/cont.dart';
import '../alignPadding.dart';

class RowCenterOne extends StatelessWidget {
  Widget w;
  RowCenterOne(this.w);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.rowHeight,
        margin: EdgeInsets.all(Const.rowInset),
        child: Center(child: w ),
      );
  }
}

class RowCenter extends StatelessWidget {
  final Widget w;
  RowCenter(this.w);

  @override
  Widget build(BuildContext context) {
    return AlignPadding(Const.rowInset, Alignment.center, this.w);
  }
}