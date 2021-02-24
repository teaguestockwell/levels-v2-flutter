import 'package:five_level_one/widgets/input/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  testWidgets('given a CustomButton, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = CustomButton('hi');
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('hi'), findsOneWidget);
  });

  testWidgets('given a CustomButton, when tapped, then it will callback',
      (WidgetTester wt) async {
    bool didCall = false;
    //given
    final test = CustomButton('hi', onPressed: () {
      didCall = true;
    });
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('hi'));

    //then
    expect(didCall, true);
  });
}
