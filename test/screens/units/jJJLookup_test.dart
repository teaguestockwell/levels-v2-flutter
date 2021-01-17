import '../../../lib/screens/units/jjjlookup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('given a jjjlookup, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: JJJLookup());

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.byType(Text), findsNWidgets(4));
  });

  testWidgets('given a jjjlookup, when rendered, then it display zulu ',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: JJJLookup());

    //when
    await wt.pumpWidget(test);

    //then
    final dfYMD = DateFormat('yyyy MM dd');
    final dfJJJ = DateFormat('DDD');
    var n = DateTime.now().toUtc();

    expect(find.text(dfYMD.format(n)), findsNWidgets(1));
    expect(find.text(dfJJJ.format(n)), findsNWidgets(1));
  });

  testWidgets('given a jjjlookup, when date changed, jjj will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: JJJLookup());

    //when
    await wt.pumpWidget(test);
    final JJJLookupState state0 = wt.state(find.byType(JJJLookup));
    state0.timeChange(DateTime.now().add(Duration(days: 1)));
    await wt.pumpAndSettle();

    //then
    final dfJJJ = DateFormat('DDD');
    expect(find.text(dfJJJ.format(DateTime.now().add(Duration(days: 1)))), findsNWidgets(1));
  });
}
