import 'dart:collection';
import 'package:five_level_one/backend/model.dart';
import 'package:five_level_one/screens/home/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

Widget mkTest(Widget c) {
  return MaterialApp(home: c);
}

LinkedHashMap<int, List<Widget>> tabPages() {
  final ret = LinkedHashMap<int, List<Widget>>();
  ret[0] = [
    Container(
      key: Key('00'),
    ),
    Container(
      key: Key('01'),
    ),
    Container(
      key: Key('02'),
    )
  ];
  ret[1] = [
    Container(
      key: Key('10'),
    ),
    Container(
      key: Key('11'),
    ),
    Container(
      key: Key('12'),
    )
  ];
  ret[2] = [
    Container(
      key: Key('20'),
    ),
    Container(
      key: Key('21'),
    ),
    Container(
      key: Key('22'),
    )
  ];
  return ret;
}

class MoreOpm extends Mock implements MoreOp {}

MoreOpm moreOp() {
  final ret = MoreOpm();
  when(ret.icon).thenReturn([
    '234',
    '234',
  ]);
  when(ret.name).thenReturn([
    'op 1',
    'op2',
  ]);
  when(ret.url).thenReturn(['url1', 'url2']);
  return ret;
}

List<String> airNames() {
  return ['air 1', 'air 2', 'air 3'];
}

void main() {
  testWidgets(
      'given a bottom nav, when rendered on desktop, then it will draw all children of first idx',
      (WidgetTester wt) async {
    //given

    //set screen size to desktop
    wt.binding.window.physicalSizeTestValue = Size(1280, 700);
    wt.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its orinal size after the test end
    addTearDown(wt.binding.window.clearPhysicalSizeTestValue);

    final test = mkTest(BottomNav(
        tabPages: tabPages(), moreOp: moreOp(), airNames: airNames()));

    //when
    await wt.pumpWidget(test);
    await wt.pumpAndSettle();

    //then
    expect(find.byKey(Key('00')), findsNWidgets(1));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(1));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));
  });

  testWidgets(
      'given a bottom nav rendered on desktop, when changed to mobile, then it will draw child[1] of first idx',
      (WidgetTester wt) async {
    //given

    //set screen size to desktop
    wt.binding.window.physicalSizeTestValue = Size(1280, 700);
    wt.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its orinal size after the test end
    addTearDown(wt.binding.window.clearPhysicalSizeTestValue);

    final test = mkTest(BottomNav(
        tabPages: tabPages(), moreOp: moreOp(), airNames: airNames()));

    //when
    await wt.pumpWidget(test);
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(1));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(1));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));

    //set screen size to mobile
    wt.binding.window.physicalSizeTestValue = Size(1080, 1920);
    wt.binding.window.devicePixelRatioTestValue = 1.0;
    await wt.pumpAndSettle();

    //then
    expect(find.byKey(Key('00')), findsNWidgets(0));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(0));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));
  });

  testWidgets(
      'given a bottom nav, when rendered on mobile, then it will draw first child of first idx',
      (WidgetTester wt) async {
    //given

    //set screen size to desktop
    wt.binding.window.physicalSizeTestValue = Size(
      1080,
      1920,
    );
    wt.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its orinal size after the test end
    addTearDown(wt.binding.window.clearPhysicalSizeTestValue);

    final test = mkTest(BottomNav(
        tabPages: tabPages(), moreOp: moreOp(), airNames: airNames()));

    //when
    await wt.pumpWidget(test);
    await wt.pumpAndSettle();

    //then
    expect(find.byKey(Key('00')), findsNWidgets(0));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(0));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));
  });

  testWidgets(
      'given a bottom nav on mobile, when changing to desktop, then it will draw all children of first idx',
      (WidgetTester wt) async {
    //given

    //set screen size to mobile
    wt.binding.window.physicalSizeTestValue = Size(
      1080,
      1920,
    );
    wt.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its orinal size after the test end
    addTearDown(wt.binding.window.clearPhysicalSizeTestValue);

    final test = mkTest(BottomNav(
        tabPages: tabPages(), moreOp: moreOp(), airNames: airNames()));

    await wt.pumpWidget(test);
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(0));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(0));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));

    //when
    wt.binding.window.physicalSizeTestValue = Size(
      1280,
      700,
    );
    wt.binding.window.devicePixelRatioTestValue = 1.0;
    await wt.pumpAndSettle();

    //then
    expect(find.byKey(Key('00')), findsNWidgets(1));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(1));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));
  });

  testWidgets(
      'given a bottom nav, when rendered on mobile, then bn icons will change page',
      (WidgetTester wt) async {
    //given

    //set screen size to desktop
    wt.binding.window.physicalSizeTestValue = Size(
      1080,
      1920,
    );
    wt.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its orinal size after the test end
    addTearDown(wt.binding.window.clearPhysicalSizeTestValue);

    final test = mkTest(BottomNav(
        tabPages: tabPages(), moreOp: moreOp(), airNames: airNames()));

    //when
    await wt.pumpWidget(test);
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(0));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(0));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));

    await wt.tap(find.byIcon(Icons.access_alarm));
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(1));
    expect(find.byKey(Key('01')), findsNWidgets(0));
    expect(find.byKey(Key('02')), findsNWidgets(0));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));

    await wt.tap(find.byIcon(Icons.receipt));
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(0));
    expect(find.byKey(Key('01')), findsNWidgets(0));
    expect(find.byKey(Key('02')), findsNWidgets(1));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));

    await wt.tap(find.byIcon(Icons.flight_land));
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(0));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(0));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));
  });

  testWidgets(
      'given a bn mobile, when mds change, then bn will show child[bn.buttons] of new mds',
      (WidgetTester wt) async {
    //given

    //set screen size to mobile
    wt.binding.window.physicalSizeTestValue = Size(
      1080,
      1920,
    );
    wt.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its orinal size after the test end
    addTearDown(wt.binding.window.clearPhysicalSizeTestValue);

    final test = mkTest(BottomNav(
        tabPages: tabPages(), moreOp: moreOp(), airNames: airNames()));

    for (int i = 0; i < 3; i++) {
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();
      final BottomNavState state0 = wt.state(find.byType(BottomNav));
      state0.airChange(i);
      await wt.pumpAndSettle();

      if (i == 0) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(1));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      if (i == 1) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(1));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      if (i == 2) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(1));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      await wt.tap(find.byIcon(Icons.access_alarm));
      await wt.pumpAndSettle();

      if (i == 0) {
        expect(find.byKey(Key('00')), findsNWidgets(1));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      if (i == 1) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(1));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      if (i == 2) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(1));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      await wt.tap(find.byIcon(Icons.receipt));
      await wt.pumpAndSettle();

      if (i == 0) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(1));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      if (i == 1) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(1));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      if (i == 2) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(1));
      }

      await wt.tap(find.byIcon(Icons.access_alarm));
      await wt.pumpAndSettle();

      if (i == 0) {
        expect(find.byKey(Key('00')), findsNWidgets(1));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      if (i == 1) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(1));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }

      if (i == 2) {
        expect(find.byKey(Key('00')), findsNWidgets(0));
        expect(find.byKey(Key('01')), findsNWidgets(0));
        expect(find.byKey(Key('02')), findsNWidgets(0));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(1));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));
      }
    }
  });

  testWidgets(
      'given a bottom nav, when rendered on mobile, then bn icons will change page',
      (WidgetTester wt) async {
    //given

    //set screen size to desktop
    wt.binding.window.physicalSizeTestValue = Size(
      1080,
      1920,
    );
    wt.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its orinal size after the test end
    addTearDown(wt.binding.window.clearPhysicalSizeTestValue);

    final test = mkTest(BottomNav(
        tabPages: tabPages(), moreOp: moreOp(), airNames: airNames()));

    //when
    await wt.pumpWidget(test);
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(0));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(0));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));

    await wt.tap(find.byIcon(Icons.access_alarm));
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(1));
    expect(find.byKey(Key('01')), findsNWidgets(0));
    expect(find.byKey(Key('02')), findsNWidgets(0));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));

    await wt.tap(find.byIcon(Icons.receipt));
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(0));
    expect(find.byKey(Key('01')), findsNWidgets(0));
    expect(find.byKey(Key('02')), findsNWidgets(1));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));

    await wt.tap(find.byIcon(Icons.flight_land));
    await wt.pumpAndSettle();

    expect(find.byKey(Key('00')), findsNWidgets(0));
    expect(find.byKey(Key('01')), findsNWidgets(1));
    expect(find.byKey(Key('02')), findsNWidgets(0));

    expect(find.byKey(Key('10')), findsNWidgets(0));
    expect(find.byKey(Key('11')), findsNWidgets(0));
    expect(find.byKey(Key('12')), findsNWidgets(0));

    expect(find.byKey(Key('20')), findsNWidgets(0));
    expect(find.byKey(Key('21')), findsNWidgets(0));
    expect(find.byKey(Key('22')), findsNWidgets(0));
  });

  testWidgets(
      'given a bn web, when mds change, then bn will show all children of new mds',
      (WidgetTester wt) async {
    //given

    //set screen size to mobile
    wt.binding.window.physicalSizeTestValue = Size(
      1280,
      700,
    );
    wt.binding.window.devicePixelRatioTestValue = 1.0;

    // resets the screen to its orinal size after the test end
    addTearDown(wt.binding.window.clearPhysicalSizeTestValue);

    final test = mkTest(BottomNav(
        tabPages: tabPages(), moreOp: moreOp(), airNames: airNames()));

    for (int i = 0; i < 3; i++) {
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();
      final BottomNavState state0 = wt.state(find.byType(BottomNav));
      state0.airChange(i);
      await wt.pumpAndSettle();

      if (i == 0) {
        expect(find.byKey(Key('00')), findsNWidgets(1));
        expect(find.byKey(Key('01')), findsNWidgets(1));
        expect(find.byKey(Key('02')), findsNWidgets(1));

        expect(find.byKey(Key('10')), findsNWidgets(0));
        expect(find.byKey(Key('11')), findsNWidgets(0));
        expect(find.byKey(Key('12')), findsNWidgets(0));

        expect(find.byKey(Key('20')), findsNWidgets(0));
        expect(find.byKey(Key('21')), findsNWidgets(0));
        expect(find.byKey(Key('22')), findsNWidgets(0));

        if (i == 1) {
          expect(find.byKey(Key('00')), findsNWidgets(0));
          expect(find.byKey(Key('01')), findsNWidgets(0));
          expect(find.byKey(Key('02')), findsNWidgets(0));

          expect(find.byKey(Key('10')), findsNWidgets(1));
          expect(find.byKey(Key('11')), findsNWidgets(1));
          expect(find.byKey(Key('12')), findsNWidgets(1));

          expect(find.byKey(Key('20')), findsNWidgets(0));
          expect(find.byKey(Key('21')), findsNWidgets(0));
          expect(find.byKey(Key('22')), findsNWidgets(0));
        }

        if (i == 2) {
          expect(find.byKey(Key('00')), findsNWidgets(0));
          expect(find.byKey(Key('01')), findsNWidgets(0));
          expect(find.byKey(Key('02')), findsNWidgets(0));

          expect(find.byKey(Key('10')), findsNWidgets(0));
          expect(find.byKey(Key('11')), findsNWidgets(0));
          expect(find.byKey(Key('12')), findsNWidgets(0));

          expect(find.byKey(Key('20')), findsNWidgets(1));
          expect(find.byKey(Key('21')), findsNWidgets(1));
          expect(find.byKey(Key('22')), findsNWidgets(1));
        }
      }
    }
  });
}
