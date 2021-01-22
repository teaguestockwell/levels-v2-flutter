import 'package:five_level_one/screens/home/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('given a loading, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Loading());

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.byType(Text), findsNWidgets(1));
  });
}
