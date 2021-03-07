import 'dart:collection';
import 'package:five_level_one/models/nested/aircraft.dart';
import 'package:five_level_one/models/nested/cargo.dart';
import 'package:five_level_one/models/nested/tank.dart';
import 'package:five_level_one/widgets/layout/div.dart';
import 'package:five_level_one/screens/percentmac/tanks_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AircraftMock extends Mock implements Aircraft{}
class TankMock extends Mock implements Tank{}

int numTanks = 20;
int fuelCap = 20000;
int fuelIncrament = 250;
num mommultiplier = 10000;

//mock needed here beacuse nwfs.id is staticly incremented 
Tank getTankMock(){
  final ret = TankMock();

  List<Cargo> nwfs = [];
  for(int i=0; i<20; i++){
    final f =  Cargo.fromTank(name: i.toString(), weight: i, simplemom: 1/5, mommultiplier: mommultiplier);
    f.id = i;
    nwfs.add(f);
  }
  when(ret.name).thenReturn('tank');
  when(ret.nwfss).thenReturn(nwfs);
  return ret;
}

AircraftMock getAir(){
  final ret = AircraftMock();
  final tanks = getTanks();
  when(ret.tanks).thenReturn(tanks);
  return ret;
}

List<Tank> getTanks(){
  List<Tank> ret = []; //no mocks here. tankCard is tightly coupled with tank model

  for(int i=1; i<=numTanks; i++){
      
       String weightCSV = '0,';
       String momCSV = '0,';

    for(int j=fuelIncrament; j<=fuelCap;j=j+fuelIncrament){
      weightCSV += ',' + j.toString();
      momCSV += ',' + (j/7).toString();
    }

    Map<String,dynamic> json = {};
    json['name'] = 'tank ' + i.toString();
    json['aircraftid'] = -1;
    json['tankid'] = -1;
    json['weights'] = weightCSV;
    json['simplemoms'] = momCSV;


    ret.add( Tank.fromJson(json, mommultiplier));

  }
  return ret;
}
//because tanks card renders in a non scrollable widget, 
//wrap in scroll container to prenvent overflow in testing
Widget mk(Widget child){
  return MaterialApp(home: SingleChildScrollView(child:child));
}

void main(){
       testWidgets(
    'given a tankCard, when drawn, then it will draw all tanks, and all divs',
    (WidgetTester wt) async {

      //given 
      final tc = TanksCard(air: getAir(), callBack: (i,b){});
      final test = mk(tc);

      //when
      await wt.pumpWidget(test);

      //then
      expect(find.byType(TankRow), findsNWidgets(numTanks));
      expect(find.byType(Div), findsNWidgets(numTanks-1));
    });

      testWidgets(
    'given a tankCard, when drawn, then it will callback all tanks to init them in parent map',
    (WidgetTester wt) async {

      //given 
      int callbacks = 0;
      final tc = TanksCard(air: getAir(), callBack: (i,b){callbacks++;});
      final test = mk(tc);

      //when
      await wt.pumpWidget(test);

      //then
      expect(callbacks,numTanks);
      
    });

      testWidgets(
    'given a tankRow, when drawn, then it render at idx[0] of tanks.nwfs on spinner',
    (WidgetTester wt) async {

      //given 

      //final tank = Tank('tank', '0,1,2,3', '1,2,3,4', '10');
       Map<String,dynamic> json = {};
      json['name'] = 'tank';
      json['aircraftid'] = -1;
      json['tankid'] = -1;
      json['weights'] = '0,1,2,3';
      json['simplemoms'] = '1,2,3,4';

      final tank = Tank.fromJson(json, mommultiplier);
      expect(tank.weightList[0], '0');
      expect(tank.nwfss[0].weight, 0);
      final tc = TankRow(tank: tank, callBack: (i,b){});
      final test = mk(tc);

      //when
      await wt.pumpWidget(test);

      //then
      expect(find.text('tank'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
    });


       testWidgets(
    'given a tankRow, when drawn, then it will callback once with the init nwfs',
    (WidgetTester wt) async {

      //given 
      int callbacks = 0;
      final map = HashMap<int, Cargo>();
      final tc = TankRow(tank: getTankMock(), callBack: (i,b){map[i] = b; callbacks++;});
      final test = mk(tc);

      //when
      await wt.pumpWidget(test);

      //then

      //one callback to insert on init
      expect(callbacks, 1);

      // map[0] is tank.nwfs[0].id, and it should callback to input tanks.nwfs[0]
      expect(map[0].id,0);
    });

}