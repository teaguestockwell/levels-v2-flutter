import 'package:five_level_one/screens/units/duration_lookup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('given a daration lookup, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: DurationLookup());

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.byType(Text), findsNWidgets(6));
  });

  testWidgets(
      'given a daration lookup, when rendered, then it initial be 48 hr seperation from now',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: DurationLookup());

    //when
    await wt.pumpWidget(test);

    //then
    final df = DateFormat('yyyy MM dd HH:mm');
    final one = df.format(DateTime.now());
    final two = df.format(DateTime.now().subtract(Duration(hours: 48)));

    expect(find.text(one), findsNWidgets(1));
    expect(find.text(two), findsNWidgets(1));
    expect(find.text('48:00:00.000'), findsNWidgets(1));
  });
}
