import 'package:five_level_one/widgets/display/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets(
      'given a titletext, when render with name and true, that name will draw',
      (WidgetTester wt) async {
    //given
    final test = makeWidgetTestable(TitleText(name: 'hi', valid: true));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.text('hi'), findsOneWidget);
  });

   testWidgets(
      'given a titletext, when render with name and true, that name will draw',
      (WidgetTester wt) async {
    //given
    final test = makeWidgetTestable(TitleText(name: 'hi', valid: false));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.text('hi'), findsOneWidget);
  });
}
