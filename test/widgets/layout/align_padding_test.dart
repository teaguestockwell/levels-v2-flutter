import 'package:five_level_one/widgets/layout/align_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets('given AlignPadding, when draws, then children will be found',
      (WidgetTester wt) async {
    //assemble
    final cont = Container();
    final testChild = AlignPadding(5, Alignment.center, cont);
    final testParent = makeWidgetTestable(testChild);

    //act
    await wt.pumpWidget(testParent);

    //assert

    //fields
    expect(find.byType(Align), findsOneWidget);
    expect(testChild.ali, Alignment.center);
    expect(testChild.padd, 5);
    expect(testChild.chil, cont);

    //build
    expect(find.byType(Align), findsOneWidget);
    expect(find.byType(Padding), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);

  });
}
