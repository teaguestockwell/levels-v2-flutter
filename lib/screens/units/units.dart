import 'durationlookup.dart';
import 'jjjlookup.dart';
import 'unitconversion.dart';
import '../../screens/units/preinsp.dart';
import '../../screens/units/timegrid.dart';
import '../../screens/units/yyyymmddlookup2.dart';
import '../../widgets/layout/cards/ccard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Units extends StatelessWidget {
  final List<Widget> widgets = [];
  final sc = ScrollController();
  
  Units(){
    widgets.addAll([
      CCards('Now',TimeGrid()),
      CCards('Pre/Insp Expire', PreInsp()),
      CCards('Julian Lookup',JJJLookup()),
      CCards('YYYY MM DD Lookup',YYYYMMDDLookup2()),
      CCards('Duration',DurationLookup()),
      CCards('Unit Conversion',UnitConversion()),
    ]);
  }
  
  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      controller: sc,
        isAlwaysShown: true,
        child: ListView.builder(
          controller: sc,
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int index) {
            return widgets[index];
          },
        ));
  }
}
