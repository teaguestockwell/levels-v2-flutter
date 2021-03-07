import 'package:five_level_one/backend/models/nested/cargo.dart';
import 'package:five_level_one/screens/home/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:five_level_one/screens/percentmac/show_work.dart';


List<Cargo> getNWFS(){
  return [
    Cargo.fromTank(name: 'plane', weight: 100000, simplemom: 10000, mommultiplier: 10000),
    Cargo(name: 'cargo', weight: 100, fs: 50, qty: 1),

    // Cargo(name: 'plane', weight: 100000, simplemom: 10000, mom: '10000', qty: '1'),
    // Cargo(name: 'cargo', weight: '100', simplemom: '10000', fs: '50', qty: '1'),
  ];
}
num lemac = 9000;
num mac = 123;

Widget mk(Widget child){
  return MaterialApp(home: child);
}

void main(){

  testWidgets(
    'given a showWork, when drawn, then it will init state to loading',
    (WidgetTester wt) async {
      //given
      final test = mk(ShowWork(lemac: lemac, mac: mac, nwfs: getNWFS(), mommultipler: 10000,));

      //when
      await wt.pumpWidget(test);

      //then
      expect(find.byType(Loading), findsOneWidget);
      expect(find.text('Show Work'), findsOneWidget);
    });

       testWidgets(
    'given a showWork, when drawn, then it will draw all NWFS',
    (WidgetTester wt) async {
      //given
      final test = mk(ShowWork(lemac: lemac, mac: mac, nwfs: getNWFS(), mommultipler: 10000,));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //then
      expect(find.text('plane'), findsOneWidget);
      expect(find.text('cargo'), findsOneWidget);
      expect(find.text('Show Work'), findsOneWidget);
    });
}