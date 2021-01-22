import 'package:five_level_one/backend/models/nameWeightFS.dart';
import 'package:five_level_one/backend/models/perMac.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:five_level_one/screens/percentMac/cargoPerMacCard.dart';

class PerMacMock extends Mock implements PerMac{}

PerMacMock getPerMac(){
  final ret = PerMacMock();
  final nwfss = getNwfs();

  when(ret.nwfss).thenReturn(nwfss);
  when(ret.grandTotQty).thenReturn('grand');
  when(ret.totMomAsString).thenReturn('tot simp mom');
  when(ret.totUnSimpMomAsString).thenReturn('tot un simp mom');
  when(ret.totWeightAsSting).thenReturn('tot weight');
  return ret;
}

Widget mk(Widget child){
  return MaterialApp(home: child);
}

List<NameWeightFS> getNwfs(){
  List<NameWeightFS> ret = [];

    ret.add(NameWeightFS(name: 'cargo1', weight: '100', qty: '2', fs: '500', ));
    ret.add(NameWeightFS(name: 'cargo2', weight: '100', qty: '2', fs: '500', ));
  
  return ret;
}

main(){
  testWidgets(
    'given a cargopermaccard, then it will draw all data',
    (WidgetTester wt) async {

      //given 
      final test = mk(CargoPerMacCard(getPerMac()));

      //when
      await wt.pumpWidget(test);

      //then
      expect(find.text('grand'), findsOneWidget);
      expect(find.text('tot simp mom'), findsOneWidget);
      expect(find.text('tot un simp mom'), findsOneWidget);
      expect(find.text('tot weight'), findsOneWidget);
      expect(find.text('cargo1'), findsOneWidget);
      expect(find.text('cargo2'), findsOneWidget);
    }
  );
}