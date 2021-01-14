import 'package:five_level_one/widgets/input/buttonDateTimePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  testWidgets('given a ButtonDateTimePicker, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = ButtonDateTimePicker(
        buttText: 'hi', onChange: (_) {}, currentTime: DateTime.now());
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('hi'), findsOneWidget);
  });

  testWidgets('given a ButtonDateTimePicker, when tapped, then it will oped',
      (WidgetTester wt) async {
    //given
    final test = ButtonDateTimePicker(
        buttText: 'hi', onChange: (_) {}, currentTime: DateTime.now());
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('hi'));
    await wt.pumpAndSettle();

    //then
    expect(find.byType(CupertinoPicker), findsWidgets);
  });
}
