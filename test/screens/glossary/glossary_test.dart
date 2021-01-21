import '../../../lib/backend/model.dart';
import '../../../lib/screens/glossary/glossary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets(
    'given aircraft a, when i click on glossary, build list of glossary cards',
     (WidgetTester wt) async {
    //assemble
    final glossarys = [
      Glossary('title 1', 'body 1'),
      Glossary('title 2', 'body 2'),
      Glossary('title 3', 'body 3'),
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
