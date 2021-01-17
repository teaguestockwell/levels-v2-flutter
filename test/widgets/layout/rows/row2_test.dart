
import '../../../../lib/widgets/layout/rows/row2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets('given child widget, when row2 draws, then childred will be found ',
      (WidgetTester wt) async {
    //assemble
    final key1 = UniqueKey();
    final key2 = UniqueKey();

    final child1 = Container(key: key1,);
    final child2 = Container(key: key2,);

    final test = Row2(child1, child2);
    final wrapper = makeWidgetTestable(test);

    //act
    await wt.pumpWidget(wrapper);

    //assert
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byKey(key1), findsOneWidget);
    expect(find.byKey(key2), findsOneWidget);
  });
}
