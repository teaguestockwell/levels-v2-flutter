import 'package:five_level_one/screens/admin/ep_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget wrap(Widget t) => MaterialApp(home: t);
main(){
  testWidgets('given a ep_sheet, when rendered, then it will draw', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      ep: 'notarealep',
      reqParam: {'fake':'fake'},
      title: 'inittitle',
      airid: -1,
      rebuildCallback: (){}
    );
    final wrapper = wrap(test);
    //set screen size to desktop
    wt.binding.window.physicalSizeTestValue = Size(1280, 700);
    wt.binding.window.devicePixelRatioTestValue = 1.0;
    // resets the screen to its orinal size after the test end
    addTearDown(wt.binding.window.clearPhysicalSizeTestValue);

    //when
    await wt.pumpWidget(wrapper);

    // then
    expect(find.byType(EPSheet),findsOneWidget);
  });
}