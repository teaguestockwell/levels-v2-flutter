import 'package:five_level_one/constant.dart';
import 'package:five_level_one/screens/admin/json_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget wrap(Widget t) => MaterialApp(home: Scaffold(body: t));

void setScreenSize(WidgetTester wt){
  //set screen size to desktop
  wt.binding.window.physicalSizeTestValue = Size(1280, 700);
  wt.binding.window.devicePixelRatioTestValue = 1.0;
  // resets the screen to its orinal size after the test end
  addTearDown(wt.binding.window.clearPhysicalSizeTestValue);
}

main(){
testWidgets('given a json_table, when rendered, then it will draw', 
  (WidgetTester wt) async {
    // given
    final test = JsonTable(
      onDelete: (_){},
      onEdit: (_){},
      jsonList: [{searchField:'01234'},{searchField:'56789'}],
    );
    final wrapper = wrap(test);
    setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);

    // then
    expect(find.byType(JsonTable), findsOneWidget);
  });

  testWidgets('given a json_table, when searched, then it will only display vals matching that search', 
  (WidgetTester wt) async {
    // given
    final test = JsonTable(
      onDelete: (_){},
      onEdit: (_){},
      jsonList: [{searchField:'01234'},{searchField:'56789'}],
    );
    final wrapper = wrap(test);
    setScreenSize(wt);

    await wt.pumpWidget(wrapper);
    expect(find.text('01234'), findsNWidgets(1));
    expect(find.text('56789'), findsNWidgets(1));

    //when
    await wt.enterText(find.byKey(Key('searchbar')), '01');
    await wt.pumpAndSettle();

    // then
    expect(find.text('01234'), findsNWidgets(1));
    expect(find.text('56789'), findsNWidgets(0));
  });
}