import '../../../lib/widgets/input/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  testWidgets(
      'given a CustomTextField, when controller is passed, make sure controller resonds to listeners',
      (WidgetTester wt) async {

    //given
    bool called = false;
    final c = TextEditingController();
    c.addListener(() {
      called = true;
    });
    final test = CustomTextField(c);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.enterText(find.byType(TextField), 'Aloha');

    //then
    expect(find.byType(TextField), findsOneWidget);
    expect(test.c, c);
    expect(called, true);
  });
}
