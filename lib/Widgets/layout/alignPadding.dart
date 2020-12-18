import 'package:flutter/material.dart';

class AlignPadding extends StatelessWidget {
  final Alignment ali;
  final double padd;
  Widget chil;
  AlignPadding(this.padd, this.ali, this.chil);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: ali,
        child: Padding(
          padding: EdgeInsets.all(padd),
          child: chil,
        )
    );
  }
}