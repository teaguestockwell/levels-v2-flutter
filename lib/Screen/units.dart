import 'package:five_level_one/Widgets/LogicWidgets/jjjlookup.dart';
import 'package:five_level_one/Widgets/LogicWidgets/durationlookup.dart';
import 'package:five_level_one/Widgets/LogicWidgets/preinsp.dart';
import 'package:five_level_one/Widgets/LogicWidgets/timegrid.dart';
import 'package:five_level_one/Widgets/LogicWidgets/unitconversion.dart';
import 'package:five_level_one/Widgets/LogicWidgets/yyyymmddlookup2.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Units extends StatelessWidget {
  var widgets = <Widget>[
    CCards('Now',TimeGrid()),
    CCards('Pre/Insp Expire', PreInsp()),
    CCards('Julian Lookup',JJJLookup()),
    CCards('YYYY MM DD Lookup',YYYYMMDDLookup2()),
    CCards('Duration',DurationLookup()),
    CCards('Unit Conversion',tDistanceBody()),
  ];

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
