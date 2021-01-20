


import 'dart:collection';

import '../../../lib/screens/percentMac/cargoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/backend/model.dart';
import 'package:mockito/mockito.dart';

import 'chartcCard_test.dart';

class AirMock extends Mock implements Aircraft{}

Widget mk(Widget child){
  return MaterialApp(home: child);
}

List<>

void main(){
  testWidgets(
    'given a cargo card, wehn drawn, then it will be valid',
    (WidgetTester wt) async {

      final onChangeMap = HashMap<int,bool>();
      
      //given
      final test = CargoCard(getAir(), (i,b){});
      final wrap = mk(test);

      //when
      await wt.pumpWidget(wrap);

      //then
      CargoCardState state0 = wt.state(find.byType(CargoCard));
      expect(state0.valid, true);

    });
}