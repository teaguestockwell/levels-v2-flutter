import 'package:five_level_one/constant.dart';
import 'package:five_level_one/backend/models/nested/general.dart';
import 'package:five_level_one/widgets/input/leading_mds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(
      home: Scaffold(
    appBar: AppBar(
        backgroundColor: Const.bottombarcolor,
        leadingWidth: Const.pickerWidth,
        leading: child),
    body: Container(),
    backgroundColor: Const.background,
  ));
}

class MockMoreOp extends Mock implements General {}

void main() {
  testWidgets(
      'given a moreop object, when a LeadingMDS is created, it will draw',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(null);
    when(mockMoreOp.icondatas).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_) {}, general: mockMoreOp);
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
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(null);
    when(mockMoreOp.icondatas).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_) {}, general: mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('cold stuff'), findsNothing);
    expect(find.text('time to wake up'), findsNothing);
  });

  testWidgets('given a leading mds, when clicked, it will open and create text',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icondatas).thenReturn([
      58712, 58713
    ]);
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(null);
    when(mockMoreOp.icondatas).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_) {}, general: mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(Icon));
    await wt.pump();

    //then
    expect(find.text('cold stuff'), findsOneWidget);
    expect(find.text('time to wake up'), findsOneWidget);
  });

  testWidgets(
      'given a leading mds, when clicked, it will open and create icons',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icondatas).thenReturn([
      58712, 58713
    ]);
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(null);
    when(mockMoreOp.icondatas).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_) {}, general: mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(Icon));
    await wt.pump();

    //then
    expect(find.byType(PopupMenuItem), findsNWidgets(2));
  });

  testWidgets('given a leading mds, when open, then it will not overflow',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.names).thenReturn(List.generate(50, (i) => i.toString()));
    when(mockMoreOp.urls).thenReturn(null);
    when(mockMoreOp.icondatas).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_) {}, general: mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(Icon));
    await wt.pump(Duration(seconds: 20));

    //then
    expect(find.byType(Icon), findsNWidgets(51));
  });

  testWidgets('given an open leading mds, when clicking away, it will disapear',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icondatas).thenReturn(
      [58712, 58713]
    );
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(null);
    when(mockMoreOp.icondatas).thenReturn(null);

    final test = LeadingMDS(text: 'hi', onPressed: (_) {}, general: mockMoreOp);
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
