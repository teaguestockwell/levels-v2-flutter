import 'dart:math';
import 'package:five_level_one/constant.dart';
import 'package:five_level_one/util.dart';
import 'package:five_level_one/screens/units/yyyy_mm_dd_lookup.dart';
import 'package:five_level_one/widgets/input/button_modal_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jiffy/jiffy.dart';

void main() {
  testWidgets('given a yyyymmddlookup, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: YYYYMMDDLookup()));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.text('YYYY'), findsOneWidget);
    expect(find.text('Julian Day'), findsOneWidget);
    expect(find.text('YYYY MM DD'), findsOneWidget);
    expect(find.byType(Divider), findsNWidgets(2));
    expect(find.byType(FlatButton), findsNWidgets(2));
  });

  testWidgets(
      'given a yyyymmddlookup, when rendered, then it will display curent year and jjj',
      (WidgetTester wt) async {
    //given
    final jjj = Jiffy(DateTime.now()).dayOfYear.toString();
    final year = DateTime.now().year.toString();
    final test = MaterialApp(home: Scaffold(body: YYYYMMDDLookup()));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.text(year), findsOneWidget);
    expect(find.text(jjj), findsOneWidget);
  });

  testWidgets(
      'given a yyyymmddlookup, when jjj spun 10X up and down, then text reflects state',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(
        home: Scaffold(
      body: YYYYMMDDLookup(),
      backgroundColor: Const.background,
    ));
    final rnd = Random();

    //when
    for (int i = 0; i < 10; i++) {
      int spin = rnd.nextInt(355);

      //open modal
      await wt.pumpWidget(test);
      await wt.tap(find.byType(ButtonModalSpinner).last);
      await wt.pumpAndSettle();

      //simulate spin
      final YYYYMMDDLookupState state0 = wt.state(find.byType(YYYYMMDDLookup));
      state0.dayChange(spin);
      await wt.pumpAndSettle();

      //close modal
      await wt.tap(find.byType(MaterialApp));
      await wt.pumpAndSettle();

      final YYYYMMDDLookupState state = wt.state(find.byType(YYYYMMDDLookup));
      final diy = state.daysInyea;
      final jjj = state.jjjIdx + 1;
      final year = state.yearIdx + 1;
      final ymd = state.getYMDString();

      //then
      expect(find.byType(Text), findsNWidgets(6));
      expect(diy, Util.getDaysInYear(year));
      expect(find.text(jjj.toString()), findsOneWidget);
      expect(find.text(year.toString()), findsOneWidget);
      expect(find.text(ymd), findsOneWidget);
    }
  });

  testWidgets(
      'given a yyyymmddlookup, when yyyy spun 10X up and down, then text reflects state',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(
        home: Scaffold(
      body: YYYYMMDDLookup(),
      backgroundColor: Const.background,
    ));
    final rnd = Random();

    //when
    for (int i = 0; i < 10; i++) {
      int spin = rnd.nextInt(2999);

      //open modal
      await wt.pumpWidget(test);
      await wt.tap(find.byType(ButtonModalSpinner).first);
      await wt.pumpAndSettle();

      //simulate spin
      final YYYYMMDDLookupState state0 = wt.state(find.byType(YYYYMMDDLookup));
      state0.yearChange(spin);
      await wt.pumpAndSettle();

      //close modal
      await wt.tap(find.byType(MaterialApp));
      await wt.pumpAndSettle();

      final YYYYMMDDLookupState state = wt.state(find.byType(YYYYMMDDLookup));
      final diy = state.daysInyea;
      final jjj = state.jjjIdx + 1;
      final year = state.yearIdx + 1;
      final ymd = state.getYMDString();

      //then
      expect(find.byType(Text), findsNWidgets(6));
      expect(diy, Util.getDaysInYear(year));
      expect(find.text(jjj.toString()), findsOneWidget);
      expect(find.text(year.toString()), findsOneWidget);
      expect(find.text(ymd), findsOneWidget);
    }
  });
}
