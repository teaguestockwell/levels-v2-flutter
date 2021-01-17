import '../../../lib/screens/units/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('given the units screen, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: Units()));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.byType(ListView), findsNWidgets(1));
  });
}
