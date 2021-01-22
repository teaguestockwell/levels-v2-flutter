import 'package:five_level_one/widgets/input/getMacButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  testWidgets('given a getMacButton, when rendered, then it should draw',
      (WidgetTester wt) async {
    //given
    final test = GetMacButton(text: 'hi', onPressed: () {});
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('hi'), findsOneWidget);
  });

  testWidgets('given a getMacButton, when tapped, then it should callback',
      (WidgetTester wt) async {
    bool didcall = false;
    //given
    final test = GetMacButton(
        text: 'hi',
        onPressed: () {
          didcall = true;
        });
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('hi'));

    //then
    expect(didcall, true);
  });
}
