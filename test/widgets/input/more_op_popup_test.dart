import 'package:five_level_one/models/nested/general.dart';
import 'package:five_level_one/widgets/input/more_op_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

class MockMoreOp extends Mock implements General {}

void main() {
  testWidgets(
      'given a moreop object, when a moreoppopup is created, it will draw',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icondatas).thenReturn([58712, 58713]);
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpPopup(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets(
      'given a moreop object, when a moreoppopup is created, it will be closed',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icondatas).thenReturn([58712, 58713]);
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpPopup(mockMoreOp);
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
    when(mockMoreOp.icondatas).thenReturn(
      [58712, 58713]
    );
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(['asasd', 'asdasd']);

    final test = MoreOpPopup(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(Icon));
    await wt.pump();

    //then
    expect(find.text('cold stuff'), findsOneWidget);
    expect(find.text('time to wake up'), findsOneWidget);
  });

  testWidgets('given a moreoppop, when clicked, it will open and create icondatass',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icondatas).thenReturn(
      [58712, 58713]
    );
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(['asdasd', 'asdasd']);

    final test = MoreOpPopup(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(Icon));
    await wt.pump();

    //then
    expect(find.byType(PopupMenuItem), findsNWidgets(2));
  });

  // testWidgets('given a moreoppop with bad icon data, when clicked, it will open and create  default icon',
  //     (WidgetTester wt) async {
  //   //given
  //   final mockMoreOp = MockMoreOp();
  //   when(mockMoreOp.icondatas).thenReturn([0, -1]);
  //   when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
  //   when(mockMoreOp.urls).thenReturn(['asdadf', 'asdasd']);

  //   final test = MoreOpPopup(mockMoreOp);
  //   final wrapper = makeWidgetTestable(test);

  //   //when
  //   await wt.pumpWidget(wrapper);
  //   await wt.tap(find.byType(Icon));
  //   await wt.pump();

  //   //then
  //   expect(find.byIcon(Icons.insert_link), findsWidgets);
  // });

  testWidgets('given an open moreoppop, when clicking away, it will disapear',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icondatas).thenReturn(
      [58712, 58713]
    );
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(['web', 'asdasd']);

    final test = MoreOpPopup(mockMoreOp);
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

  testWidgets(
      'given an open moreoppop, when clicking button, it will try to open links',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icondatas).thenReturn([58712, 58713]);
    when(mockMoreOp.names).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.urls).thenReturn(['web', 'asdasd']);

    final test = MoreOpPopup(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);
    await wt.tap(find.byType(Icon));
    await wt.pump();

    //when
    await wt.tap(find.byType(PopupMenuItem).first);
    await wt.pump();

    //then
    expect(find.byType(PopupMenuItem), findsWidgets);
  });
}
