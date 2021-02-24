import 'package:five_level_one/widgets/display/const_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets('given a contText, when rendered, then given string will draw',
      (WidgetTester wt) async {
    //given
    final test = makeWidgetTestable(ConstText('s'));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.text('s'), findsOneWidget);
  });
}
