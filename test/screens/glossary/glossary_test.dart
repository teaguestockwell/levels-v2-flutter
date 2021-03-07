import 'package:five_level_one/models/nested/glossary.dart';
import 'package:five_level_one/screens/glossary/glossary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets(
    'given aircraft a, when i click on glossary, build list of glossary cards',
     (WidgetTester wt) async {
    //assemble
    final glossarys = [
      Glossary(aircraftid:-1, id: -1, name: 'title 1', body: 'body 1'),
      Glossary(aircraftid:-1, id: -1, name: 'title 2', body: 'body 2'),
      Glossary(aircraftid:-1, id: -1, name: 'title 3', body: 'body 3')
    ];

    //act
    await wt.pumpWidget(MaterialApp(home: GlossaryScreen(glossarys)));

    //expect
    expect(find.text('title 1'), findsOneWidget);
    expect(find.text('title 2'), findsOneWidget);
    expect(find.text('title 3'), findsOneWidget);

    expect(find.text('body 1'), findsOneWidget);
    expect(find.text('body 2'), findsOneWidget);
    expect(find.text('body 3'), findsOneWidget);
  });
}
