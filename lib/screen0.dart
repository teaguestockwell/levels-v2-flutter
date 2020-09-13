import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      CCards('Now', TimeGrid()),
      CCards('Pre/Insp Expire', InspBody()),
      CCards('Julian Lookup', JulianLookupBody()),
      CCards('YYYY MM DD Lookup', YMDLookUp()),
      CCards('Duration', DateTimeDiffrence())
    ]);
  }
}
