import 'package:five_level_one/backend/models/perMac.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:five_level_one/screens/percentMac/perMacCard.dart';

class PerMacMock extends Mock implements PerMac{}

PerMacMock getPerMac(){
  final ret = PerMacMock();
  when(ret.balArmAsString).thenReturn('bal arm');
  when(ret.lemacAsString).thenReturn('lemac');
  when(ret.macAsString).thenReturn('mac');
  when(ret.perMacDecimalAsString).thenReturn('permac dec');
  when(ret.perMacPercentAsString).thenReturn('permac percent');
  //when(ret.grandTotQty).thenReturn('mark');
  //when(ret.nwfss).thenReturn('1');
  //when(ret.simpleMomAsString).thenReturn('1');
  //when(ret.totMomAsString).thenReturn('1');
  //when(ret.totUnSimpMomAsString).thenReturn('1');
  //when(ret.totWeightAsSting).thenReturn('1');
  return ret;
}

Widget mk(Widget child){
  return MaterialApp(home: Scaffold(body: InteractiveViewer(child: child)));
}

void main(){

  testWidgets(
    'given a perMacCard, when drawn, then it will draw all data in permac card',
    (WidgetTester wt) async {
      //given
      final test = mk(PerMacCard(getPerMac()));

      //when
      await wt.pumpWidget(test);

      //then
      expect(find.text('Mean Aerodynamic Chord %'), findsOneWidget);
      expect(find.text('='), findsNWidgets(2));
      expect(find.text('-'), findsNWidgets(2));
      expect(find.text('/'), findsNWidgets(2));
      expect(find.text('MAC%'), findsOneWidget);
      expect(find.text('Balance Arm'), findsOneWidget);
      expect(find.text('LEMAC'), findsOneWidget);
      expect(find.text('MAC'), findsOneWidget);
      expect(find.text('bal arm'), findsOneWidget);
      expect(find.text('lemac'), findsOneWidget);
      expect(find.text('mac'), findsOneWidget);
      expect(find.text('permac percent% = permac dec'), findsOneWidget);
    });
}