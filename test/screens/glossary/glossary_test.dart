import 'package:five_level_one/backend/model.dart';
import 'package:five_level_one/screens/glossary/glossary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAircraft extends Mock implements Aircraft {}

main() {
  testWidgets(
    'as a user, when i click on glossary, build list of glossary cards',
     (WidgetTester wt) async {
    //assemble
    final a = MockAircraft();
    when(a.titles).thenReturn(['title 1', 'title 2', 'title 3']);
    when(a.bodys).thenReturn(['body 1', 'body 2', 'body 3']);

    //act
    await wt.pumpWidget(MaterialApp(home: GlossaryScreen(a)));

    //expect
    expect(find.text('title 1'), findsOneWidget);
    expect(find.text('title 2'), findsOneWidget);
    expect(find.text('title 3'), findsOneWidget);

    expect(find.text('body 1'), findsOneWidget);
    expect(find.text('body 2'), findsOneWidget);
    expect(find.text('body 3'), findsOneWidget);
  });
}
