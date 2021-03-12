import 'package:five_level_one/screens/admin/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget wrap(Widget t) => MaterialApp(home: t);

void setScreenSize(WidgetTester wt){
  //set screen size to desktop
  wt.binding.window.physicalSizeTestValue = Size(1280, 700);
  wt.binding.window.devicePixelRatioTestValue = 1.0;
  // resets the screen to its orinal size after the test end
  addTearDown(wt.binding.window.clearPhysicalSizeTestValue);
}

main(){
testWidgets('given a side_bar, when rendered, then it will draw', 
  (WidgetTester wt) async {
    // given
    final test = SideBar();
    final wrapper = wrap(test);
setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);

    // then
    expect(find.byType(SideBar), findsOneWidget);
  });

  testWidgets('given a side_bar, when rendered, then it will begin idx 0', 
  (WidgetTester wt) async {
    // given
    final test = SideBar();
    final wrapper = wrap(test);
setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);
    SideBarState state0 = wt.state(find.byType(SideBar));

    // then
    expect(state0.airIdx,0);
    expect(state0.menuIdx,0);
  });

  testWidgets('given a side_bar, when menu item is tapped, then it change to it', 
  (WidgetTester wt) async {
    // given
    final test = SideBar();
    final wrapper = wrap(test);
    await wt.pumpWidget(wrapper);
setScreenSize(wt);

    //when
    await wt.tap(find.byKey(Key('sidebar menu item 1')));
    SideBarState state0 = wt.state(find.byType(SideBar));

    // then
    expect(state0.airIdx,0);
    expect(state0.menuIdx,1);
  });

   testWidgets('given a side_bar, when rebuild callback is called, then it build', 
  (WidgetTester wt) async {
    // given
    final test = SideBar();
    final wrapper = wrap(test);
    await wt.pumpWidget(wrapper);
setScreenSize(wt);

    //when
    SideBarState state0 = wt.state(find.byType(SideBar));
    state0.rebuild();
    await wt.pumpAndSettle();
    SideBarState state1 = wt.state(find.byType(SideBar));

    // then
    expect(state1.buildCount, isNot(0));
  });

  testWidgets('given a side_bar, when setAirCallback is called, then it update airIdx in state', 
  (WidgetTester wt) async {
    // given
    final test = SideBar();
    final wrapper = wrap(test);
    await wt.pumpWidget(wrapper);
setScreenSize(wt);
    final mockDropDownSpinnerCallbackParams = <String,dynamic>{'c17':1};

    //when
    SideBarState state0 = wt.state(find.byType(SideBar));
    state0.setAirState(mockDropDownSpinnerCallbackParams);
    await wt.pumpAndSettle();
    SideBarState state1 = wt.state(find.byType(SideBar));

    // then
    expect(state1.airIdx, isNot(0));
  });
}