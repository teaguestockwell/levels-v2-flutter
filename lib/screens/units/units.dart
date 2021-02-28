import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/layout/cards/ccard.dart';
import 'duration_lookup.dart';
import 'jjj_lookup.dart';
import 'pre_insp.dart';
import 'time_grid.dart';
import 'unit_conversion.dart';
import 'yyyy_mm_dd_lookup.dart';

class Units extends StatefulWidget {
  
  final Key key;
  Units({this.key}): super(key: PageStorageKey(UniqueKey()));
  _UnitsState createState() => _UnitsState();
}

class _UnitsState extends State<Units> 
with AutomaticKeepAliveClientMixin<Units>{
  @override
  bool get wantKeepAlive => true;
  final List<Widget> widgets = [
    CCard(
      name: 'Now',
      children: [TimeGrid()],
      initOpen: true,
    ),
    CCard(
      name: 'Pre/Insp Expire',
      children: [PreInsp()],
      initOpen: true,
    ),
    CCard(
      name: 'Julian Lookup',
      children: [JJJLookup()],
      initOpen: true,
    ),
    CCard(
      name: 'YYYY MM DD Lookup',
      children: [YYYYMMDDLookup()],
      initOpen: true,
    ),
    CCard(
      name: 'Duration',
      children: [DurationLookup()],
      initOpen: true,
    ),
    CCard(
      name: 'Unit Conversion',
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
    super.build(context);
    return CupertinoScrollbar(
        controller: sc,
        isAlwaysShown: true,
        child: ListView(
          children: widgets,
          controller: sc,
        ));
  }
}
