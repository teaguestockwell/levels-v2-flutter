import 'package:five_level_one/widgets/display/rowCenterText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets(
      'given a rowcentertext, when it renders, then text will be displayed',
      (WidgetTester wt) async {
    //given
    final test = makeWidgetTestable(RowCenterText('s'));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.text('s'), findsOneWidget);
  });

  testWidgets('given a rowcentertext, when tapped , then try to launch url',
      (WidgetTester wt) async {
    //given
    final test = makeWidgetTestable(RowCenterText('s'));

    //when then
    await wt.pumpWidget(test);
    await wt.tap(find.text('s'));
  });
}
