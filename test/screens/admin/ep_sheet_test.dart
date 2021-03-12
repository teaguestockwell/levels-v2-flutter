import 'package:five_level_one/constant.dart';
import 'package:five_level_one/screens/admin/ep_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

Widget wrap(Widget t) => MaterialApp(home: Scaffold(body: t));
final ep = 'user';
final airid = 1;
final title = 'title';
final apiResErrorMsgKey = 'Error';

class ResMock extends Mock implements Response {}

Future<List<dynamic>> getNLoading(String _,{Map<String,String> reqParam}) async {
  return null;
}

Future<List<dynamic>> getNEmpty(String _,{Map<String,String> reqParam}) async {
  return [];
}

Future<List<dynamic>> getN(String _,{Map<String,String> reqParam}) async {
  return <dynamic>[{'aircraftid': 1, 'userid':1, 'name':'joe', 'role': 1}];
}

Future<Response> delete1200(String _, Map<String, dynamic> __) async {
  final res = ResMock();
  when(res.statusCode).thenReturn(200);
  return res;
}

Future<Response> delete1400(String _, Map<String, dynamic> __) async {
  final res = ResMock();
  when(res.statusCode).thenReturn(400);
  when(res.body).thenReturn('''{"msg": "Error"}''');
  return res;
}

Future<Response> put1200(String _, Map<String, dynamic> __) async {
  final res = ResMock();
  when(res.statusCode).thenReturn(200);
  return res;
}

Future<Response> put1400(String _, Map<String, dynamic> __) async {
  final res = ResMock();
  when(res.statusCode).thenReturn(400);
  when(res.body).thenReturn('''{"msg": "Error"}''');
  return res;
}

void setScreenSize(WidgetTester wt){
  //set screen size to desktop
  wt.binding.window.physicalSizeTestValue = Size(1280, 700);
  wt.binding.window.devicePixelRatioTestValue = 1.0;
  // resets the screen to its orinal size after the test end
  addTearDown(wt.binding.window.clearPhysicalSizeTestValue);
}



main(){
  testWidgets('given a ep_sheet, when future is null, then it will be loading', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getNLoading,
      delete1: delete1400,
      put1: put1400,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);
    // do not pump and settle because rebuilds will perputualy schedule
    // because our future return null

    //await wt.pumpAndSettle();

    // then
    expect(find.byKey(Key('loading')),findsOneWidget);
  });

    testWidgets('given a ep_sheet, when future is empty, then it will render empty state', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getNEmpty,
      delete1: delete1400,
      put1: put1400,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);
    await wt.pumpAndSettle();

    // then
    expect(find.byKey(Key('empty')),findsOneWidget);
  });

      testWidgets('given a ep_sheet, when future completes, then it will render the json', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getN,
      delete1: delete1400,
      put1: put1400,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);
    await wt.pumpAndSettle();

    // then
    expect(find.byKey(Key('json')),findsOneWidget);
  });

        testWidgets('given a ep_sheet, when new button is clicked, then it it change state to is putting', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getN,
      delete1: delete1400,
      put1: put1400,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    await wt.pumpWidget(wrapper);
    await wt.pumpAndSettle();

    EPSheetState state = wt.state(find.byType(EPSheet));
    expect(state.isPuttingState, false);

    state.create();
    await wt.pumpAndSettle();
    state = wt.state(find.byType(EPSheet));

    expect(state.isPuttingState,true);
    expect(find.byKey(Key('putting')), findsOneWidget);
  });

    testWidgets('given a ep_sheet, when is back button is pressed, then it it change state to !putting', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getN,
      delete1: delete1400,
      put1: put1400,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    await wt.pumpWidget(wrapper);
    await wt.pumpAndSettle();

    EPSheetState state = wt.state(find.byType(EPSheet));
    expect(state.isPuttingState, false);

    //when 
    state.create();
    await wt.pumpAndSettle();
    expect(state.isPuttingState, true);
    expect(find.byKey(Key('back')), findsOneWidget);
    state = wt.state(find.byType(EPSheet));

    state.goBack();
    await wt.pumpAndSettle();
    state = wt.state(find.byType(EPSheet));

    //then
    expect(state.isPuttingState, false);
    expect(state.isNestedState, false);
  });


  testWidgets('given a ep_sheet, when put returns 400, then Error will be displayed', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getN,
      delete1: delete1400,
      put1: put1400,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);
    expect(find.text('Error'), findsNWidgets(0));

    EPSheetState state = wt.state(find.byType(EPSheet));
    state.put({});
    await wt.pump();

    expect(find.text('Error'), findsNWidgets(1));
  });

  testWidgets('given a ep_sheet, when put returns 200, then Saved will be displayed', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getN,
      delete1: delete1400,
      put1: put1200,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);
    expect(find.text('Saved'), findsNWidgets(0));

    EPSheetState state = wt.state(find.byType(EPSheet));
    state.put({});
    await wt.pump();

    expect(find.text('Saved'), findsNWidgets(1));
  });

  testWidgets('given a ep_sheet, when delete returns 400, then Error will be displayed', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getN,
      delete1: delete1400,
      put1: put1400,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);
    expect(find.text('Error'), findsNWidgets(0));

    EPSheetState state = wt.state(find.byType(EPSheet));
    state.delete({});
    await wt.pump();

    expect(find.text('Error'), findsNWidgets(1));
  });

  testWidgets('given a ep_sheet, when delete returns 200, then Deleted will be displayed', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getN,
      delete1: delete1200,
      put1: put1400,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);
    expect(find.text('Deleted'), findsNWidgets(0));

    EPSheetState state = wt.state(find.byType(EPSheet));
    state.delete({});
    await wt.pump();

    expect(find.text('Deleted'), findsNWidgets(1));
  });

   testWidgets('given a ep_sheet, update callback is called with a deep model (Config), then is nested will be true', 
  (WidgetTester wt) async {
    // given
    final test = EPSheet(
      getN: getN,
      delete1: delete1200,
      put1: put1400,
      apiResErrorMsgKey: apiResErrorMsgKey,
      ep: ep,
      title: title,
      rebuildCallback: (){},
      airid: airid,
    );

    final wrapper = wrap(test);
    setScreenSize(wt);

    //when
    await wt.pumpWidget(wrapper);
    EPSheetState state = wt.state(find.byType(EPSheet));
    expect(state.isNestedState, false);
    expect(state.configIDState, null);

    state.update(<String,dynamic>{searchField: 'ae1', configFK: [], configCargoPK: 1});
    await wt.pumpAndSettle();

    expect(state.isNestedState, true);
    expect(state.configIDState, 1);
  });
 
}