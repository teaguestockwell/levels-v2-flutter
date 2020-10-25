import 'package:five_level_one/Widgets/LogicWidgets/jjjlookup.dart';
import 'package:five_level_one/Widgets/LogicWidgets/durationlookup.dart';
import 'package:five_level_one/Widgets/LogicWidgets/preinsp.dart';
import 'package:five_level_one/Widgets/LogicWidgets/timegrid.dart';
import 'package:five_level_one/Widgets/LogicWidgets/unitconversion.dart';
import 'package:five_level_one/Widgets/LogicWidgets/yyyymmddlookup.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Units extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        //reverse: true,
        children: <Widget>[
          CCards('Now', TimeGrid()),
          CCards.C('Pre/Insp Expire', PreInsp()),
          CCards.C('Julian Lookup', JJJLookup()),
          CCards.C('YYYY MM DD Lookup', YYYYMMDDLookup()),
          CCards.C('Duration', DurationLookup()),
          CCards.C('Unit Conversion', tDistanceBody()),
        ]);
  }
}
