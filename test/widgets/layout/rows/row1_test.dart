import 'package:five_level_one/widgets/layout/row1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets('given child widget, when row1 draws, then child will be found ',
      (WidgetTester wt) async {
    //assemble
    final key = UniqueKey();
    final test = Row1(Container(key: key));
    final wrapper = makeWidgetTestable(test);

    //act
    await wt.pumpWidget(wrapper);

    //assert
    expect(find.byType(Center), findsOneWidget);
    expect(find.byKey(key), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(2));
  });

  testWidgets(
      'given child widget, when rowcenter draws, then child will be found ',
      (WidgetTester wt) async {
    //assemble
    final key = UniqueKey();
    final child = Container(key: key);
    final test = RowCenter(child);
    final wrapper = makeWidgetTestable(test);

    //act
    await wt.pumpWidget(wrapper);

    //assert
    expect(find.byKey(key), findsOneWidget);
    expect(test.w, child);
  });
}
