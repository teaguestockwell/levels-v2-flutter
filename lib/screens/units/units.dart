import 'durationlookup.dart';
import 'jjjlookup.dart';
import 'unitConversion.dart';
import '../../screens/units/preinsp.dart';
import 'timeGrid.dart';
import 'yYYYMMDDLookup.dart';
import '../../widgets/layout/cards/ccard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Units extends StatefulWidget {
  final Key key;
  Units({this.key}): super(key: key);
  _UnitsState createState() => _UnitsState();
}

class _UnitsState extends State<Units> {
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

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
        controller: sc,
        isAlwaysShown: true,
        child: ListView(
          children: widgets,
          controller: sc,
        ));
  }
}
