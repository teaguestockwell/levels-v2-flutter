import 'package:five_level_one/screens/units/yyyymmddlookup.dart';
import 'package:five_level_one/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('given a yyyymmddlookup, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: YYYYMMDDLookup());

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
      'given a yyyymmddlookup, when rendered, then it will display 2060 j366',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: YYYYMMDDLookup());

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.text('2060'), findsOneWidget);
    expect(find.text('366'), findsOneWidget);
  });

  testWidgets(
      'given a yyyymmddlookup, when rendered, then it will display 2060 j366',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: YYYYMMDDLookup());

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.text('2060'), findsOneWidget);
    expect(find.text('366'), findsOneWidget);
  });

  test(
      'given a year, when days in year is called, then return days int that year as int',
      () {
    final year = 2020;
    final daysInYear = Util.getDaysInYear(year);

    expect(daysInYear, 366);
  });
}
