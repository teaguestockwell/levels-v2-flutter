import 'package:five_level_one/screens/units/preinsp.dart';
import 'package:five_level_one/screens/units/timegrid.dart';
import 'package:five_level_one/screens/units/yyyymmddlookup2.dart';
import 'package:five_level_one/widgets/layout/cards/ccard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'durationlookup.dart';
import 'jjjlookup.dart';
import 'unitconversion.dart';

class Units extends StatelessWidget {
  List<Widget> widgets;
  
  Units(){
    widgets = <Widget>[
    CCards('Now',TimeGrid()),
    CCards('Pre/Insp Expire', PreInsp()),
    CCards('Julian Lookup',JJJLookup()),
    CCards('YYYY MM DD Lookup',YYYYMMDDLookup2()),
    CCards('Duration',DurationLookup()),
    CCards('Unit Conversion',UnitConversion()),
  ];
  }
  

  final sc = ScrollController();

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
