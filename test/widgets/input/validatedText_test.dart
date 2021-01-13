import 'package:five_level_one/widgets/input/validatedText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  testWidgets(
      'given validated text of int, when text is changed, then call onChange',
      (WidgetTester wt) async {
    //testing for call back
    bool called = false;

    //given
    final wrapper = makeWidgetTestable(ValidatedText(
      inputType: 0,
      maxChars: 12,
      initText: '',
      width: 120,
      onChange: (_) {
        called = true;
      },
      notifyIsValid: (_) {},
      validateText: (_) {
        return true;
      },
    ));
    await wt.pumpWidget(wrapper);

    //when
    await wt.enterText(find.byType(TextField), '1');
    await wt.pump();

    //then
    expect(called, true);
  });

  testWidgets(
      'given validated text of int, when text is changed to invalid, then set state to invalid',
      (WidgetTester wt) async {
    //given
    final wrapper = makeWidgetTestable(ValidatedText(
      inputType: 0,
      maxChars: 12,
      initText: '',
      width: 120,
      onChange: (_) {},
      notifyIsValid: (_) {},
      validateText: (String x) {
        if (x.contains('9')) {
          return false;
        }
        return true;
      },
    ));
    await wt.pumpWidget(wrapper);

    //when
    await wt.enterText(find.byType(TextField), '9');
    await wt.pump();

    //then
    final ValidatedTextState state2 = wt.state(find.byType(ValidatedText));
    expect(state2.valid, false);
  });

  testWidgets(
      'given validated text of int, when text is changed to invalid, then notify isValid',
      (WidgetTester wt) async {
    //testing for callbacks
    bool isValid = false;

    //given
    final wrapper = makeWidgetTestable(ValidatedText(
      inputType: 0,
      maxChars: 12,
      initText: '',
      width: 120,
      onChange: (_) {},
      notifyIsValid: (bool x) {
        isValid = x;
      },
      validateText: (String x) {
        if (x.contains('invalid')) {
          return false;
        }
        return true;
      },
    ));
    await wt.pumpWidget(wrapper);

    //when
    await wt.enterText(find.byType(TextField), 'invalid');
    await wt.pump();

    //then
    final ValidatedTextState state2 = wt.state(find.byType(ValidatedText));
    expect(state2.valid, isValid);
  });

  testWidgets(
      'given validated text of double, when text is changed, then call onChange',
      (WidgetTester wt) async {
    //testing for call back
    bool called = false;

    //given
    final wrapper = makeWidgetTestable(ValidatedText(
      inputType: 1,
      maxChars: 12,
      initText: '',
      width: 120,
      onChange: (_) {
        called = true;
      },
      notifyIsValid: (_) {},
      validateText: (_) {
        return true;
      },
    ));
    await wt.pumpWidget(wrapper);

    //when
    await wt.enterText(find.byType(TextField), '1.0');
    await wt.pump();

    //then
    expect(called, true);
  });

  testWidgets(
      'given validated text of double, when text is changed to invalid, then set state to invalid',
      (WidgetTester wt) async {
    //given
    final wrapper = makeWidgetTestable(ValidatedText(
      inputType: 1,
      maxChars: 12,
      initText: '',
      width: 120,
      onChange: (_) {},
      notifyIsValid: (_) {},
      validateText: (String x) {
        if (x.contains('1.0')) {
          return false;
        }
        return true;
      },
    ));
    await wt.pumpWidget(wrapper);

    //when
    await wt.enterText(find.byType(TextField), '1.0');
    await wt.pump();

    //then
    final ValidatedTextState state2 = wt.state(find.byType(ValidatedText));
    expect(state2.valid, false);
  });

  testWidgets(
      'given validated text of double, when text is changed to invalid, then notify isValid',
      (WidgetTester wt) async {
    //testing for callbacks
    bool isValid = false;

    //given
    final wrapper = makeWidgetTestable(ValidatedText(
      inputType: 1,
      maxChars: 12,
      initText: '',
      width: 120,
      onChange: (_) {},
      notifyIsValid: (bool x) {
        isValid = x;
      },
      validateText: (String x) {
        if (x.contains('invalid')) {
          return false;
        }
        return true;
      },
    ));
    await wt.pumpWidget(wrapper);

    //when
    await wt.enterText(find.byType(TextField), 'invalid');
    await wt.pump();

    //then
    final ValidatedTextState state2 = wt.state(find.byType(ValidatedText));
    expect(state2.valid, isValid);
  });

  testWidgets(
      'given validated text of String, when text is changed, then call onChange',
      (WidgetTester wt) async {

    //testing for call back
    bool called = false;

    //given
    final wrapper = makeWidgetTestable(ValidatedText(
      inputType: 2,
      maxChars: 12,
      initText: '',
      width: 120,
      onChange: (_) {
        called = true;
      },
      notifyIsValid: (_) {},
      validateText: (_) {
        return true;
      },
    ));
    await wt.pumpWidget(wrapper);

    //when
    await wt.enterText(find.byType(TextField), '1');
    await wt.pump();

    //then
    expect(called, true);
  });

  testWidgets(
      'given validated text of String, when text is changed to invalid, then set state to invalid',
      (WidgetTester wt) async {
    //given
    final wrapper = makeWidgetTestable(ValidatedText(
      inputType: 2,
      maxChars: 12,
      initText: '',
      width: 120,
      onChange: (_) {},
      notifyIsValid: (_) {},
      validateText: (String x) {
        if (x.contains('9')) {
          return false;
        }
        return true;
      },
    ));
    await wt.pumpWidget(wrapper);

    //when
    await wt.enterText(find.byType(TextField), '9');
    await wt.pump();

    //then
    final ValidatedTextState state2 = wt.state(find.byType(ValidatedText));
    expect(state2.valid, false);
  });

  testWidgets(
      'given validated text of String, when text is changed to invalid, then notify isValid',
      (WidgetTester wt) async {
    //testing for callbacks
    bool isValid = false;

    //given
    final wrapper = makeWidgetTestable(ValidatedText(
      inputType: 1,
      maxChars: 12,
      initText: '',
      width: 120,
      onChange: (_) {},
      notifyIsValid: (bool x) {
        isValid = x;
      },
      validateText: (String x) {
        if (x.contains('invalid')) {
          return false;
        }
        return true;
      },
    ));
    await wt.pumpWidget(wrapper);

    //when
    await wt.enterText(find.byType(TextField), 'invalid');
    await wt.pump();

    //then
    final ValidatedTextState state2 = wt.state(find.byType(ValidatedText));
    expect(state2.valid, isValid);
  });

}
