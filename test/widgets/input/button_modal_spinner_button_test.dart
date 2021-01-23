import 'package:five_level_one/widgets/input/button_modal_spinner_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  testWidgets(
      'given a buttonSpinnerModalButton, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = ButtonModalSpinnerButton(
      stringList: ['hi', 'bye', 'yo'],
      onSpin: (int i) {},
      onPress: () {},
      modalButtonText: 'select',
    );
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('hi'), findsOneWidget);
  });

  testWidgets(
      'given a buttonSpinnerModalButton, when pressed, then it will open a modal',
      (WidgetTester wt) async {
    //given
    final test = ButtonModalSpinnerButton(
      stringList: ['hi', 'bye', 'yo'],
      onSpin: (int i) {},
      onPress: () {},
      modalButtonText: 'select',
    );
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('hi'));
    await wt.pumpAndSettle();

    //then
    expect(find.byType(CupertinoPicker), findsOneWidget);
  });

  testWidgets(
      'given a buttonSpinnerModalButton, when pressed, then it will render string list text',
      (WidgetTester wt) async {
    //given
    final test = ButtonModalSpinnerButton(
      stringList: ['hi', 'bye', 'yo'],
      onSpin: (int i) {},
      onPress: () {},
      modalButtonText: 'select',
    );
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('hi'));
    await wt.pumpAndSettle();

    //then
    expect(find.text('hi'),
        findsNWidgets(2)); //one on the modal, another on the button underneath
    expect(find.text('bye'), findsOneWidget);
    expect(find.text('yo'), findsOneWidget);
  });

  testWidgets(
      'given a buttonSpinnerModalButton, when spun, then it will callback',
      (WidgetTester wt) async {
    bool didcall = false;
    //given
    final test = ButtonModalSpinnerButton(
      stringList: ['hi', 'bye', 'yo'],
      onSpin: (int i) {
        didcall = true;
      },
      onPress: () {},
      modalButtonText: 'select',
    );
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('hi'));
    await wt.pumpAndSettle();

    //when
    await wt.drag(find.text('bye'), Offset(0.0, -70.0));
    await wt.pumpAndSettle();

    //then
    expect(didcall, true);
  });

  testWidgets(
      'given a buttonSpinnerModalButton, when selected, then it will callback and close',
      (WidgetTester wt) async {
    bool didcall = false;
    //given
    final test = ButtonModalSpinnerButton(
      stringList: ['hi', 'bye', 'yo'],
      onSpin: (int i) {},
      onPress: () {
        didcall = true;
      },
      modalButtonText: 'select',
    );
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('hi'));
    await wt.pumpAndSettle();

    //when
    await wt.tap(find.text('select'));
    await wt.pumpAndSettle();

    //then
    expect(didcall, true);
    expect(find.byType(CupertinoPicker), findsNothing);
  });
}
