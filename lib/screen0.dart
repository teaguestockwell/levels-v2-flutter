import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'uiwidgets.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      children: <Widget>[
      CCards('Now', TimeGrid()),
      CCards.C('Pre/Insp Expire', InspBody()),
      CCards.C('Julian Lookup', JulianLookupBody()),
      CCards.C('YYYY MM DD Lookup', YMDLookUp()),
      CCards.C('Duration', DateTimeDiffrence()),
      CCards.C('Unit Conversion', tDistanceBody()),
    ]);
  }
}
