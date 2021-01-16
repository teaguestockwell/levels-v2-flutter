import 'durationlookup.dart';
import 'jjjlookup.dart';
import 'unitConversion.dart';
import '../../screens/units/preinsp.dart';
import '../../screens/units/timegrid.dart';
import 'yYYYMMDDLookup.dart';
import '../../widgets/layout/cards/ccard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Units extends StatelessWidget {
  final List<Widget> widgets = [
    CCard(
      title: 'Now',
      children: [TimeGrid()],
      initOpen: true,
    ),
    CCard(
      title: 'Pre/Insp Expire',
      children: [PreInsp()],
      initOpen: true,
    ),
    CCard(
      title: 'Julian Lookup',
      children: [JJJLookup()],
      initOpen: true,
    ),
    CCard(
      title: 'YYYY MM DD Lookup',
      children: [YYYYMMDDLookup()],
      initOpen: true,
    ),
    CCard(
      title: 'Duration',
      children: [DurationLookup()],
      initOpen: true,
    ),
    CCard(
      title: 'Unit Conversion',
      children: [UnitConversion()],
      initOpen: true,
    ),
  ];
  final sc = ScrollController();

  Units();

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
        controller: sc,
        isAlwaysShown: true,
        child: ListView(children: widgets, controller: sc,));
  }
}
