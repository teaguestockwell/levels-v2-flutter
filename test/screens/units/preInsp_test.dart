import 'package:five_level_one/screens/units/preinsp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('given a preIsnp, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: PreInsp()));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.byType(Text), findsNWidgets(6));
  });

  testWidgets('given a preIsnp, when rendered, then it achomp = 48 hr ago',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: PreInsp()));

    //when
    await wt.pumpWidget(test);

    //then
    expect(
        find.text(DateFormat('yyyy MM dd HH:mm')
            .format(DateTime.now().subtract(Duration(hours: 48)))
            .toString()),
        findsNWidgets(1));
  });

  testWidgets('given a preIsnp, when rendered, then it expire =  now',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: PreInsp()));

    //when
    await wt.pumpWidget(test);

    //then
    expect(
        find.text(
            DateFormat('yyyy MM dd HH:mm').format(DateTime.now()).toString()),
        findsNWidgets(1));
  });

  testWidgets(
      'given a preIsnp, when achomp changed, then expire at will reflect',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: PreInsp()));

    //when
    await wt.pumpWidget(test);
    final PreInspState state0 = wt.state(find.byType(PreInsp));
    state0.timeChange(DateTime(1990, 01, 1));
    await wt.pumpAndSettle();

    //then
    expect(
        find.text(DateFormat('yyyy MM dd HH:mm')
            .format(DateTime(1990, 01, 3))
            .toString()),
        findsNWidgets(1));
  });

  testWidgets('given a preIsnp, when hrs changed, then expire at will reflect',
      (WidgetTester wt) async {
    for (int i = 0; i < 144; i+=12) {
      //given
      final test = MaterialApp(home: Scaffold(body: PreInsp()));

      //when
      await wt.pumpWidget(test);
      final PreInspState state0 = wt.state(find.byType(PreInsp));
      state0.timeChange(DateTime(1990, 01, 1));
      await wt.pumpAndSettle();

      await wt.pumpWidget(test);
      final PreInspState state1 = wt.state(find.byType(PreInsp));
      state1.lenChange(i);
      await wt.pumpAndSettle();

      //then
      expect(
          find.text(DateFormat('yyyy MM dd HH:mm')
              .format(DateTime(1990, 1, 1).add(Duration(hours: i + 1)))),
          findsOneWidget);
    }
  });
}
