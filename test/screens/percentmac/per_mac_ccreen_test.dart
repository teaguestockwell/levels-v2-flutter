import 'dart:convert' as convert;

import 'package:five_level_one/backend/models/nested/aircraft.dart';
import 'package:five_level_one/backend/models/nested/cargo.dart';
import 'package:five_level_one/backend/models/nested/config.dart';
import 'package:five_level_one/backend/models/nested/tank.dart';
import 'package:five_level_one/screens/percentmac/per_mac_screen.dart';
import 'package:five_level_one/screens/percentmac/show_work.dart';
import 'package:five_level_one/widgets/input/validated_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

int numTanks = 20;
int fuelCap = 20000;
int fuelIncrament = 250;
num mommultiplier = 10000;

final dynamic json = convert.jsonDecode('''{
        "aircraftid": 1,
        "configid": 1,
        "name": "AE-1",
        "configcargos": [
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 1,
            "fs": 400,
            "qty": 4,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 28,
              "name": "Flare Hazard Placards (Note 1)",
              "weight": 20,
              "fs": 400
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 27,
            "configcargoid": 2,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 27,
              "name": "Flares/Flare Cans (Note 1)",
              "weight": 255,
              "fs": 744
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 29,
            "configcargoid": 3,
            "fs": 217,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 29,
              "name": "Aircraft Armor (Note 1)",
              "weight": 1125,
              "fs": 217
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 33,
            "configcargoid": 4,
            "fs": 305,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 33,
              "name": "MX TO File",
              "weight": 30,
              "fs": 305
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 20,
            "configcargoid": 5,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 20,
              "name": "Survival Vest",
              "weight": 11.5,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 21,
            "configcargoid": 6,
            "fs": 280,
            "qty": 5,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 21,
              "name": "Aircrew Body Armor (Level IIIA)",
              "weight": 8.5,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 16,
            "configcargoid": 7,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 16,
              "name": "BA-22 Parachute",
              "weight": 28,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 19,
            "configcargoid": 8,
            "fs": 744,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 19,
              "name": "PBE",
              "weight": 5,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 18,
            "configcargoid": 9,
            "fs": 744,
            "qty": 102,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 18,
              "name": "EPOS",
              "weight": 2,
              "fs": -1
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 15,
            "configcargoid": 10,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 15,
              "name": "Protective clothing kit",
              "weight": 36,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 14,
            "configcargoid": 11,
            "fs": 744,
            "qty": 110,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 14,
              "name": "A/C Life Preserver",
              "weight": 1.5,
              "fs": -1
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 13,
            "configcargoid": 12,
            "fs": 280,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 13,
              "name": "LPU-6P Infant Cot",
              "weight": 4,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 17,
            "configcargoid": 13,
            "fs": 280,
            "qty": 2,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 17,
              "name": "LPU-10P",
              "weight": 4,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 9,
            "configcargoid": 14,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 9,
              "name": "Expendable Supplies",
              "weight": 10,
              "fs": 260
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 8,
            "configcargoid": 15,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 8,
              "name": "Pillow Small w/Case",
              "weight": 0.5,
              "fs": -1
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 7,
            "configcargoid": 16,
            "fs": 744,
            "qty": 54,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 7,
              "name": "Blanket Small",
              "weight": 1,
              "fs": -1
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 6,
            "configcargoid": 17,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 6,
              "name": "Pillow Large w/Case",
              "weight": 2,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 5,
            "configcargoid": 18,
            "fs": 280,
            "qty": 6,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 5,
              "name": "Blanket Large",
              "weight": 3.5,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 4,
            "configcargoid": 19,
            "fs": 280,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 4,
              "name": "Human Waste Clean-up kit",
              "weight": 5,
              "fs": 280
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 3,
            "configcargoid": 20,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 3,
              "name": "Hot Cup",
              "weight": 3,
              "fs": 260
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 2,
            "configcargoid": 21,
            "fs": 260,
            "qty": 1,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 2,
              "name": "Std 2 gal liquid container",
              "weight": 25,
              "fs": 260
            }
          },
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 1,
            "configcargoid": 22,
            "fs": 358,
            "qty": 3,
            "cargo": {
              "aircraftid": 1,
              "cargoid": 1,
              "name": "Water Container (5 Gallon)",
              "weight": 40,
              "fs": 358
            }
          }
        ]
      }''');

Widget mk(Widget child){
  return MaterialApp(home: Scaffold(body: ListView(children: [child])));
}

class AirMock extends Mock implements Aircraft{}

AirMock getAir(){
  final ret = AirMock();
  
  //chartc dependancies
  when(ret.weight0).thenReturn(100000);
  when(ret.weight1).thenReturn(150000);
  when(ret.mom0).thenReturn(10000);
  when(ret.mom1).thenReturn(14000);

  //tank dependancies
  when(ret.tanks).thenReturn(getTanks());

  //cargo dependancies
  when(ret.cargos).thenReturn(getValidCargo());
  when(ret.configs).thenReturn(getValidConfig());
  when(ret.fs0).thenReturn(80);
  when(ret.fs1).thenReturn(2000);
  when(ret.cargoweight1).thenReturn(100000);

  //show work dep
  when(ret.lemac).thenReturn(100);
  when(ret.mac).thenReturn(200);
  when(ret.mommultiplier).thenReturn(10000);

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
    
    ret.add(Tank.fromJson(json, mommultiplier));

  }
  return ret;
}

List<Config> getValidConfig(){
  List<Config> ret = [];

  for(int i=0; i<10; i++){
    ret.add(
        Config.fromJson(json)

      // Config(
      // ///config builds from csv
      // '''AE-1;Water container (5 gal),120,4.3,3; Std 2 gal liquid container,25,.7,1; Hot cup,3,.1,1; Human waste clean-up kit,5,.1,1; Blanket large,6,.6,6; Pillow lrg + case,12,.3,6; Blankets sm,54,4,54; Pillows sm + case,54,2,54; Expendables,10,.3,1; LPU-10/P life preserver,8,.2,2; LPU-6/P life preserver (infant cot),12,.3,3; A/C life preservers,165,12.3,110; Protective clothing kit (PCK),36,1,1; Emergency passenger oxygen system (EPOS),204,15.2,102; Protective breathing equipment (PBE),30,2,2,6; Parachute,56,1.6,2; Aircrew body armor (lvl IIIA),43,1.2,5; Survival vest,58,1.6,5; MX TO file,30,.9,1; Aircraft armor,1125,24.4,1; Flares + flare cans,255,19.0,6; Flare haz placards,20,.8,4''',
      // //the simple moment
      // '10000'
      // )
    );
  }
  return ret;
}

//valid cargo because there is fs || moment
List<Cargo> getValidCargo(){
  List<Cargo> ret = [];

  for(int i=0; i<100; i++){
    ret.add(
      Cargo(name: 'cargo', weight: 20, fs: 300) //valid cargo 
    );
  }
  return ret;
}

void main(){
  testWidgets(
    'given a permacscreen, when drawn, then it will be invalid',
    (WidgetTester wt) async {

      //given
      final test = PerMacScreen(getAir());
      final wrapper = mk(test);

      //when
      await wt.pumpWidget(wrapper);
      PerMacScreenState state0 = wt.state(find.byType(PerMacScreen));

      //then
      expect(state0.valid, false);
    });

    testWidgets(
    'given a invalid permacscreen, when show mac% is clicked, then it will show error',
    (WidgetTester wt) async {

      //given
      final test = PerMacScreen(getAir());
      final wrapper = mk(test);

      //when
      await wt.pumpWidget(wrapper);
      PerMacScreenState state0 = wt.state(find.byType(PerMacScreen));
      state0.getPerMac();
      await wt.pump();

      //then
      expect(find.byKey(Key('per mac error')), findsOneWidget);
    });

        testWidgets(
    'given a invalid permacscreen, when valid chart c is entered, then it will be valid',
    (WidgetTester wt) async {

      //given
      final test = PerMacScreen(getAir());
      final wrapper = mk(test);

      //when
      await wt.pumpWidget(wrapper);
      await wt.enterText(find.byType(ValidatedText).first, '120000');
      await wt.enterText(find.byType(ValidatedText).last, '12000');
      await wt.pumpAndSettle();
      PerMacScreenState state0 = wt.state(find.byType(PerMacScreen));

      //then
      expect(state0.valid, true);
    });

     testWidgets(
    'given a valid permacscreen, when show mac% is clicked, then it will show work',
    (WidgetTester wt) async {

      //given
      final test = PerMacScreen(getAir());
      final wrapper = mk(test);

      //when
      await wt.pumpWidget(wrapper);
      expect(find.byType(ShowWork), findsNothing);
      await wt.enterText(find.byType(ValidatedText).first, '120000');
      await wt.enterText(find.byType(ValidatedText).last, '12000');
      await wt.pumpAndSettle();
      PerMacScreenState state0 = wt.state(find.byType(PerMacScreen));
      state0.getPerMac();
      await wt.pumpAndSettle();

      //then
      expect(find.byType(ShowWork), findsOneWidget);
    });
}