import 'package:flutter/material.dart';

import '../../constant.dart';
import 'align_padding.dart';


class Row1 extends StatelessWidget {
  final Widget w;
  Row1(this.w);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: rowHeight,
        margin: EdgeInsets.all(rowInset),
        child: Center(child: w ),
      );
  }
}

class RowCenter extends StatelessWidget {
  final Widget w;
  RowCenter(this.w);

  @override
  Widget build(BuildContext context) {
    return AlignPadding(rowInset, Alignment.center, this.w);
  }
}