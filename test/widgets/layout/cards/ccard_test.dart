import 'package:five_level_one/widgets/display/text.dart';
import 'package:five_level_one/widgets/layout/cards/ccard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: child);
}

void main() {
  testWidgets(
      'given title text open, when draws, then title will display 2 open icon',
      (WidgetTester wt) async {
    //given
    final tex = Tex('open');
    final open = false;
    final wrapper = makeWidgetTestable(TitleCC(tex: tex, open: open));

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('open'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_drop_down), findsNWidgets(2));
    expect(find.byType(Spacer), findsNWidgets(2));
  });

  testWidgets(
      'given title text closed, when draws, then title will display  2 closed icon',
      (WidgetTester wt) async {
    //given
    final tex = Tex('closed');
    final open = true;
    final wrapper = makeWidgetTestable(TitleCC(tex: tex, open: open));

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('closed'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_drop_up), findsNWidgets(2));
    expect(find.byType(Spacer), findsNWidgets(2));
  });

  testWidgets(
    'given a ccard that starts closed, when clicked, it will open',
      (WidgetTester wt) async {
  //given
    final title = 'card title';
    final key1 = UniqueKey();
    final key2 = UniqueKey();
    final initOpen = false;
    final callBack = () {};
    final children = [
      Container(
        key: key1,
      ),
      Container(
        key: key2,
      )
    ];

    final test = CCard(
      children: children,
      name: title,
      initOpen: initOpen,
      callBack: callBack,
    );
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);

    //init state
    expect(find.byKey(key1), findsNothing);
    expect(find.byKey(key2), findsNothing);

  //when
    await wt.tap(find.byType(InkWell));
    await wt.pump();

  //then
    //open state
    expect(find.byKey(key1), findsOneWidget);
    expect(find.byKey(key2), findsOneWidget);
  });

  testWidgets(
    'given a ccard that starts open, when clicked, it will close',
      (WidgetTester wt) async {
  //given
    final title = 'card title';
    final key1 = UniqueKey();
    final key2 = UniqueKey();
    final initOpen = true;
    final callBack = () {};
    final children = [
      Container(
        key: key1,
      ),
      Container(
        key: key2,
      )
    ];

    final test = CCard(
      children: children,
      name: title,
      initOpen: initOpen,
      callBack: callBack,
    );
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);

    //open state
    expect(find.byKey(key1), findsOneWidget);
    expect(find.byKey(key2), findsOneWidget);

  //when
    await wt.tap(find.byType(InkWell));
    await wt.pump();

  //then
    //closed state
    expect(find.byKey(key1), findsNothing);
    expect(find.byKey(key2), findsNothing);
  });
}
