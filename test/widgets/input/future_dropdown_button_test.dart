import 'package:five_level_one/util.dart';
import 'package:five_level_one/widgets/input/future_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget wrap(Widget t) => MaterialApp(home: Scaffold(body: t));

Future<List<dynamic>> getNLoading() async {
  return null;
}

Future<List<dynamic>> getNEmpty() async {
  return [];
}

// mock api res for getN of model
Future<List<dynamic>> getN() async {
  return <dynamic>[
    {'id': 1, 'userid':1, 'name':'joe', 'role': 1},
    {'id': 1, 'userid':10, 'name':'dan', 'role': 1}
  ];
}

// this is what api res looks like after each element is transformed
// into 1 map where key = searchField && val = apiModelPK
final map = <String,dynamic>{
  'joe':1,
  'dan':10
};
const emptyMsg = 'empty';
const apiModelPK = 'id';

main(){

test('given an api res that contains list of models, when mapOfNameIDFromAPIGetN is called, then return map', ()async{
  final ret = await mapOfNameIDFromAPIGetN(await getN(),'userid');
  expect(ret,map);
});
testWidgets('given a future_drop_down_button, when future is null, then it will render loading state', 
  (WidgetTester wt) async {
    // given
    final test = FutureDropDownButton(
      future: getNLoading(),
      onChange: (_){},
      onEmptyMSG: emptyMsg,
      apiModelPK: apiModelPK,
    );
    final wrapper = wrap(test);

    //when
    await wt.pumpWidget(wrapper);

    // then
    expect(find.byKey(Key('loading')), findsOneWidget);
  });

  testWidgets('given a future_drop_down_button, when future is empty, then it will render empty state', 
  (WidgetTester wt) async {
    // given
    final test = FutureDropDownButton(
      future: getNEmpty(),
      onChange: (_){},
      onEmptyMSG: emptyMsg,
      apiModelPK: apiModelPK,
    );
    final wrapper = wrap(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.pumpAndSettle();

    // then
    expect(find.byKey(Key('empty')), findsOneWidget);
  });

  testWidgets('given a future_drop_down_button, when future is !empty && !null, then it will render dropdownbutton', 
  (WidgetTester wt) async {
    // given
    final test = FutureDropDownButton(
      future: getN(),
      onChange: (_){},
      onEmptyMSG: emptyMsg,
      apiModelPK: apiModelPK,
    );
    final wrapper = wrap(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.pumpAndSettle();

    // then
    expect(find.byType(DropDownButton), findsOneWidget);
  });

   testWidgets('given a down_button without an initid, when redered, then it will draw val 1 of map', 
  (WidgetTester wt) async {
    // given
    final test = DropDownButton(
      onChange: (_){},
      map: map,
      initID: -1,
    );
    final wrapper = wrap(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.pumpAndSettle();
    DropDownButtonState state = wt.state(find.byType(DropDownButton));

    // then
    expect(state.selected, 'joe');
  });

   testWidgets('given a down_button with initid 10, when redered, then it will draw name of model where initid = model[pk]', 
  (WidgetTester wt) async {
    // given
    final test = DropDownButton(
      onChange: (_){},
      map: map,
      initID: 10,
    );
    final wrapper = wrap(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.pumpAndSettle();
    DropDownButtonState state = wt.state(find.byType(DropDownButton));

    // then
    expect(state.selected, 'dan');
  });

  testWidgets('given a down_button with initid 10, when redered, then it will callback with model where pk = 10', 
  (WidgetTester wt) async {
    Map<String, dynamic> acctualCallBack;
    // given
    final test = DropDownButton(
      onChange: (x) => acctualCallBack = x,
      map: map,
      /// dan has a pkid of 10, so this should be reflected in the callback on initstate
      initID: 10,
    );
    final wrapper = wrap(test);

    //when
    await wt.pumpWidget(wrapper);
    await wt.pumpAndSettle();
    final expectedCallbackPKID = map['dan'];

    // then
    expect(acctualCallBack.entries.elementAt(0).value,expectedCallbackPKID,);
  });
}