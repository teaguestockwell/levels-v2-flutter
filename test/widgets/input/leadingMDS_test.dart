import 'package:five_level_one/backend/model.dart';
import 'package:five_level_one/widgets/input/leadingMDS.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

class MockMoreOp extends Mock implements MoreOp {}

void main() {
  testWidgets(
      'given a moreop object, when a LeadingMDS is created, it will draw',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(null);
    when(mockMoreOp.icon).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_){}, moreOp: mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets(
      'given a moreop object, when a LeadingMDS is created, it will be closed',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(null);
    when(mockMoreOp.icon).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_){}, moreOp: mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('cold stuff'), findsNothing);
    expect(find.text('time to wake up'), findsNothing);
  });

  testWidgets('given a moreoppop, when clicked, it will open and create text',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn([
      ['58712', '58713']
    ]);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(null);
    when(mockMoreOp.icon).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_){}, moreOp: mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(Icon));
    await wt.pump();

    //then
    expect(find.text('cold stuff'), findsOneWidget);
    expect(find.text('time to wake up'), findsOneWidget);
  });

  testWidgets('given a leading mds, when clicked, it will open and create icons',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn([
      ['58712', '58713']
    ]);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(null);
    when(mockMoreOp.icon).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_){}, moreOp: mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(Icon));
    await wt.pump();

    //then
    expect(find.byType(PopupMenuItem), findsNWidgets(2));
  });

  testWidgets('given an open moreoppop, when clicking away, it will disapear',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn([
      ['58712', '58713']
    ]);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(null);
    when(mockMoreOp.icon).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_){}, moreOp: mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(Icon));
    await wt.pump();

    //when
    await wt.tapAt(Offset(0, 0));
    await wt.pump();

    //then
    expect(find.byType(PopupMenuItem), findsNothing);
  });
}
