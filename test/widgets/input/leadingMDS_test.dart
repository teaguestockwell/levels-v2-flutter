import 'package:five_level_one/widgets/input/leadingMDS.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  testWidgets('given a leadingmds, when rendered, then it should draw',
      (WidgetTester wt) async {
    //given
    final test = LeadingMDS(text: 'hi', onPressed: () {});
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets('given a leadingmds, when tapped, then it should callback',
      (WidgetTester wt) async {
    bool didCall = false;
    //given
    final test = LeadingMDS(
        text: 'hi',
        onPressed: () {
          didCall = true;
        });
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(IconButton));

    //then
    expect(didCall, true);
  });
}
