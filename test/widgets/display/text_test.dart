import 'package:five_level_one/widgets/display/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets(
      'given all letters and numbers, when tex renders, it will display that text',
      (WidgetTester wt) async {

    //given
    final List<String> strings =
        '`1234567890-=][poiuytrewqasdfghjkl;/.,mnbvcxzZXCVBNM<>?:LKJHGFDSAQWERTYUIOP{}|+_)(*&^%#@!'
            .split('');

    for (String s in strings) {
      final test = makeWidgetTestable(Tex(s));

      //when
      await wt.pumpWidget(test);

      //then
      expect(find.text(s), findsOneWidget);
    }
  });
}
