import 'package:five_level_one/widgets/layout/div.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets('given Div, when div draws, then Divider will be found',
      (WidgetTester wt) async {
    //assemble
    final test = makeWidgetTestable(Div());

    //act
    await wt.pumpWidget(test);

    //assert
    expect(find.byType(Divider), findsOneWidget);
  });
}
