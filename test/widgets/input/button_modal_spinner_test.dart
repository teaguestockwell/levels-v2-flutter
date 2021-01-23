import 'package:five_level_one/widgets/input/button_modal_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  testWidgets('given a buttonSpinnerModal, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = ButtonModalSpinner(
      initIdx: 0,
      onSpin: (int i) {},
      stringList: ['hi'],
    );
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('hi'), findsOneWidget);
  });

  testWidgets(
      'given a buttonSpinnerModal with non deafult initindx, when rendered, then it will draw to that indx',
      (WidgetTester wt) async {
    //given
    final test = ButtonModalSpinner(
      initIdx: 1,
      onSpin: (int i) {},
      stringList: ['hi', 'hi again'],
    );
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('hi again'), findsOneWidget);
    expect(find.text('hi'), findsNothing);
  });

  testWidgets(
      'given a buttonSpinnerModal, when pressed, then it will open a modal',
      (WidgetTester wt) async {
    //given
    final test = ButtonModalSpinner(
      initIdx: 0,
      onSpin: (int i) {},
      stringList: ['hi'],
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
      'given a buttonSpinnerModal, when pressed, then it will render string list text',
      (WidgetTester wt) async {
    //given
    final test = ButtonModalSpinner(
      initIdx: 0,
      onSpin: (int i) {},
      stringList: [
        'hi',
        'hi1',
        'hi2',
      ],
    );
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('hi'));
    await wt.pumpAndSettle();

    //then
    expect(find.text('hi'),findsNWidgets(2)); //one on the modal, another on the button underneath
    expect(find.text('hi1'), findsOneWidget);
    expect(find.text('hi2'), findsOneWidget);
  });

  testWidgets('given a buttonSpinnerModal, when spun, then it will callback',
      (WidgetTester wt) async {
    bool didcall = false;
    //given
    final test = ButtonModalSpinner(
      initIdx: 0,
      onSpin: (int i) {
        didcall = true;
      },
      stringList: [
        'hi0',
        'hi1',
        'hi2',
      ],
    );
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('hi0'));
    await wt.pumpAndSettle();

    //when
    await wt.drag(find.text('hi1'), Offset(0.0, -70.0));
    await wt.pumpAndSettle();

    //then
    expect(didcall, true);
  });
}