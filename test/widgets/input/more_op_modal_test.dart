import 'package:five_level_one/backend/models/more_op.dart';
import 'package:five_level_one/widgets/input/more_op_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

Widget makeWidgetTestable(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

class MockMoreOp extends Mock implements MoreOp {}

void main() {
  testWidgets('given a moreop, when created, then the moreopmodal will draw',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn(['58712', '58713']);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpModal(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.text('Help'), findsOneWidget);
  });

  testWidgets(
      'given a moreop, when created, then the moreopmodal will be closed',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn(['58712', '58713']);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpModal(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    //when
    await wt.pumpWidget(wrapper);

    //then
    expect(find.byType(Text), findsOneWidget);
  });

  testWidgets('given a moreopModal, when tapped, then the modal will open',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn(['58712', '58713']);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpModal(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);

    //when
    await wt.tap(find.text('Help'));
    await wt.pumpAndSettle();

    //then
    expect(find.byType(CupertinoPicker), findsOneWidget);
  });

  testWidgets('given a moreopModal, when tapped, then the modal will draw text',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn(['58712', '58713']);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpModal(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);

    //when
    await wt.tap(find.text('Help'));
    await wt.pumpAndSettle();

    //then
    expect(find.byType(Text), findsNWidgets(4));
  });

  testWidgets('given a moreopModal, when tapped, then the modal will draw icons',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn(['58712', '58713']);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpModal(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);

    //when
    await wt.tap(find.text('Help'));
    await wt.pumpAndSettle();

    //then
    expect(find.byType(Icon), findsNWidgets(2));
  });

   testWidgets('given a moreopModal with invalid icon data, when tapped, then the modal will draw defaut icon',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn(['asdasdas', '58713']);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpModal(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);

    //when
    await wt.tap(find.text('Help'));
    await wt.pumpAndSettle();

    //then
    expect(find.byIcon(Icons.insert_link), findsOneWidget);
  });

  testWidgets(
      'given a moreopModal that is open, when not tapped, then the modal will close',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn(['58712', '58713']);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpModal(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('Help'));
    await wt.pumpAndSettle();

    //when
    await wt.tap(find.byType(MaterialApp));
    await wt.pumpAndSettle();

    //then
    expect(find.byType(CupertinoPicker), findsNothing);
  });

  testWidgets(
      'given a moreopModal that is open, when user swipes, then the spin index will change',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn(['58712', '58713']);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpModal(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('Help'));
    await wt.pumpAndSettle();

    //when
    await wt.drag(find.text('cold stuff'), Offset(0.0, -70.0));
    await wt.pumpAndSettle();

    //then
    final MoreOpModalState state2 = wt.state(find.byType(MoreOpModal));
    expect(state2.spinIdx, 1);
  });

  testWidgets(
      'given a moreopModal that is open, when user taps select, then link will try to launch',
      (WidgetTester wt) async {
    //given
    final mockMoreOp = MockMoreOp();
    when(mockMoreOp.icon).thenReturn(['58712', '58713']);
    when(mockMoreOp.name).thenReturn(['cold stuff', 'time to wake up']);
    when(mockMoreOp.url).thenReturn(['asdasd', 'asdad']);

    final test = MoreOpModal(mockMoreOp);
    final wrapper = makeWidgetTestable(test);

    await wt.pumpWidget(wrapper);
    await wt.tap(find.text('Help'));
    await wt.pumpAndSettle();

    //when 
    //then
    await wt.tap(find.text('Select'));
    await wt.pumpAndSettle();
  });
}
