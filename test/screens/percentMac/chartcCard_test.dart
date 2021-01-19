import '../../../lib/screens/percentMac/chartcCard.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/backend/model.dart';

class PerMacMock extends Mock implements PerMac{}



Widget mk(Widget child){
  return MaterialApp(home: child);
}

void main(){

  testWidgets(
    'given a perMacCard, when drawn, then it will draw all data in permac card',
    (WidgetTester wt) async {
      //given
      final test = mk(ChartCCard(air, onValidationChange));

      //when
      await wt.pumpWidget(test);

   
    });
}