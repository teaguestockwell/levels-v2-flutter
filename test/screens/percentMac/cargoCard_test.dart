import 'dart:collection';
import '../../../lib/screens/percentMac/cargoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/backend/model.dart';
import 'package:mockito/mockito.dart';

import 'chartcCard_test.dart';

class AirMock extends Mock implements Aircraft{}

Widget mk(Widget child){
  return MaterialApp(home: ListView(children: [child],));
}

List<Config> getValidConfig(){
  List<Config> ret = [];

  for(int i=0; i<10; i++){
    ret.add(
      Config(
      ///config builds from csv
      '''AE-1;Water container (5 gal),120,4.3,3; Std 2 gal liquid container,25,.7,1; Hot cup,3,.1,1; Human waste clean-up kit,5,.1,1; Blanket large,6,.6,6; Pillow lrg + case,12,.3,6; Blankets sm,54,4,54; Pillows sm + case,54,2,54; Expendables,10,.3,1; LPU-10/P life preserver,8,.2,2; LPU-6/P life preserver (infant cot),12,.3,3; A/C life preservers,165,12.3,110; Protective clothing kit (PCK),36,1,1; Emergency passenger oxygen system (EPOS),204,15.2,102; Protective breathing equipment (PBE),30,2,2,6; Parachute,56,1.6,2; Aircrew body armor (lvl IIIA),43,1.2,5; Survival vest,58,1.6,5; MX TO file,30,.9,1; Aircraft armor,1125,24.4,1; Flares + flare cans,255,19.0,6; Flare haz placards,20,.8,4''',
      //the simple moment
      '10000'
      )
    );
  }
  return ret;
}

List<Config> getInvalidConfigs(){
  List<Config> ret = [];

  for(int i=0; i<10; i++){
    ret.add(
      Config(
      ///config builds from csv
      '''AE-1;Water container (5 gal),120,4.3,3; Std 2 gal liquid container,25,.7,1; Hot cup,3,.1,1; Human waste clean-up kit,5,0,1; Blanket large,6,.6,6; Pillow lrg + case,12,.3,6; Blankets sm,54,4,54; Pillows sm + case,54,2,54; Expendables,10,.3,1; LPU-10/P life preserver,8,.2,2; LPU-6/P life preserver (infant cot),12,.3,3; A/C life preservers,165,12.3,110; Protective clothing kit (PCK),36,1,1; Emergency passenger oxygen system (EPOS),204,15.2,102; Protective breathing equipment (PBE),30,2,2,6; Parachute,56,1.6,2; Aircrew body armor (lvl IIIA),43,1.2,5; Survival vest,58,1.6,5; MX TO file,30,.9,1; Aircraft armor,1125,24.4,1; Flares + flare cans,255,19.0,6; Flare haz placards,20,.8,4''',
      //the simple moment
      '10000'
      )
    );
  }
  return ret;
}

///invalid cargo because there is not fs or moment
List<NameWeightFS> getInvalidCargo(){
  List<NameWeightFS> ret = [];

  for(int i=0; i<100; i++){
    ret.add(
      NameWeightFS(name: 'cargo', weight: '20', simplemom: '10000')
    );
  }
  return ret;
}

///valid cargo because there is fs || moment
List<NameWeightFS> getValidCargo(){
  List<NameWeightFS> ret = [];

  for(int i=0; i<100; i++){
    ret.add(
      NameWeightFS(name: 'cargo', weight: '20', simplemom: '10000', fs: '300') //valid cargo 
    );
  }
  return ret;
}

AircraftMock getAirWithInvalidCargosAndValidConfig(){
  final ret = AircraftMock();

  when(ret.addaCargo).thenReturn(getInvalidCargo());
  when(ret.configs).thenReturn(getValidConfig());
  when(ret.fs0).thenReturn('80');
  when(ret.fs1).thenReturn('2000');
  when(ret.cargomaxweight).thenReturn('100000');
  return ret;
}

AircraftMock getAirWithValidCargosAndValidConfig(){
  final ret = AircraftMock();

  when(ret.addaCargo).thenReturn(getValidCargo());
  when(ret.configs).thenReturn(getValidConfig());
  when(ret.fs0).thenReturn('80');
  when(ret.fs1).thenReturn('2000');
  when(ret.cargomaxweight).thenReturn('100000');
  return ret;
}

AircraftMock getAirValidCargosAndInvalidConfig(){
  final ret = AircraftMock();

  when(ret.addaCargo).thenReturn(getValidCargo());
  when(ret.configs).thenReturn(getInvalidConfigs());
  when(ret.fs0).thenReturn('80');
  when(ret.fs1).thenReturn('2000');
  when(ret.cargomaxweight).thenReturn('100000');
  return ret;
}



void main(){
  testWidgets(
    'given a cargo card, when drawn, then it will be valid',
    (WidgetTester wt) async {

      final onChangeMap = HashMap<int,bool>();
      
      //given
      final test = CargoCard(getAirWithInvalidCargosAndValidConfig(), (i,b){onChangeMap[i]=b;});
      final wrap = mk(test);

      //when
      await wt.pumpWidget(wrap);
      CargoCardState state0 = wt.state(find.byType(CargoCard));

      //then
      expect(state0.valid, true);
      expect(onChangeMap[1], true);
    });

    testWidgets(
    'given a cargo card, when drawn, then there will be no cargo',
    (WidgetTester wt) async {

      final onChangeMap = HashMap<int,bool>();
      
      //given
      final test = CargoCard(getAirWithInvalidCargosAndValidConfig(), (i,b){onChangeMap[i]=b;});
      final wrap = mk(test);

      //when
      await wt.pumpWidget(wrap);
      CargoCardState state0 = wt.state(find.byType(CargoCard));

      //then
      expect(test.cargo.entries.length, 0);
      expect(state0.childrenCargoIsValidMap.entries.length, 0);
      expect(find.byType(Text), findsNWidgets(7));
    });

    testWidgets(
    'given a cargo card, when drawn, then it will be in its inital state',
    (WidgetTester wt) async {

      final onChangeMap = HashMap<int,bool>();
      
      //given
      final test = CargoCard(getAirWithInvalidCargosAndValidConfig(), (i,b){onChangeMap[i]=b;});
      final wrap = mk(test);

      //when
      await wt.pumpWidget(wrap);
      CargoCardState state0 = wt.state(find.byType(CargoCard));

      //then
      expect(state0.selectedSpinnerCargo, test.air.addaCargo[0]);
      expect(state0.selectedSpinnerConfig, test.air.configs[0]);
      expect(state0.childrenCargoIsValidMap.entries.length, 0);
    });

    testWidgets(
    'given a cargo card, when drawn, then it will be in its inital state',
    (WidgetTester wt) async {

      final onChangeMap = HashMap<int,bool>();
      
      //given
      final test = CargoCard(getAirWithInvalidCargosAndValidConfig(), (i,b){onChangeMap[i] = b;});
      final wrap = mk(test);

      //when
      await wt.pumpWidget(wrap);
      CargoCardState state0 = wt.state(find.byType(CargoCard));

      //then
      expect(state0.selectedSpinnerCargo, test.air.addaCargo[0]);
      expect(state0.selectedSpinnerConfig, test.air.configs[0]);
      expect(state0.childrenCargoIsValidMap.entries.length, 0);
      expect(onChangeMap[1], true);
    });

    testWidgets(
    'given a cargo card, when invalid cargo is imported, then it will become invalid',
    (WidgetTester wt) async {

      final onChangeMap = HashMap<int,bool>();
      
      //given
      final test = CargoCard(getAirWithInvalidCargosAndValidConfig(), (i,b){onChangeMap[i]=b;});
      final wrap = mk(test);

      //when
      await wt.pumpWidget(wrap);
      CargoCardState state0 = wt.state(find.byType(CargoCard));
      state0.addCargo();
      await wt.pumpAndSettle();
      CargoCardState state1 = wt.state(find.byType(CargoCard));

      //then
      expect(state1.childrenCargoIsValidMap.entries.length, 1);
      expect(state1.valid, false);
      expect(test.cargo.entries.length, 1);
      expect(onChangeMap[1], false);
      expect(find.byType(Text), findsNWidgets(12));

    });

     testWidgets(
    'given a cargo card, when valid cargo is imported, then it state will remain valid',
    (WidgetTester wt) async {

      final onChangeMap = HashMap<int,bool>();
      
      //given
      final test = CargoCard(getAirWithValidCargosAndValidConfig(), (i,b){onChangeMap[i]=b;});
      final wrap = mk(test);

      //when
      await wt.pumpWidget(wrap);
      CargoCardState state0 = wt.state(find.byType(CargoCard));
      state0.addCargo();
      await wt.pumpAndSettle();
      CargoCardState state1 = wt.state(find.byType(CargoCard));

      //then
      expect(state1.childrenCargoIsValidMap.entries.length, 1);
      expect(state1.valid, true);
      expect(test.cargo.entries.length, 1);
      expect(onChangeMap[1], true);
      expect(find.byType(Text), findsNWidgets(8));
    });

    testWidgets(
    'given a cargo card, when a valid config is imported, then it state will remain valid',
    (WidgetTester wt) async {

      final onChangeMap = HashMap<int,bool>();
      
      //given
      final test = CargoCard(getAirWithValidCargosAndValidConfig(), (i,b){onChangeMap[i]=b;});
      final wrap = mk(test);

      //when
      await wt.pumpWidget(wrap);
      CargoCardState state0 = wt.state(find.byType(CargoCard));
      state0.updateConfig();
      await wt.pumpAndSettle();
      CargoCardState state1 = wt.state(find.byType(CargoCard));

      //then
      expect(state1.childrenCargoIsValidMap.entries.length, 22);
      expect(state1.valid, true);
      expect(test.cargo.entries.length, 22);
      expect(onChangeMap[1], true);
    });

       testWidgets(
    'given a cargo card, when a invalid config is imported, then it state will become invalid',
    (WidgetTester wt) async {

      final onChangeMap = HashMap<int,bool>();
      
      //given
      final test = CargoCard(getAirValidCargosAndInvalidConfig(), (i,b){onChangeMap[i]=b;});
      final wrap = mk(test);

      //when
      await wt.pumpWidget(wrap);
      CargoCardState state0 = wt.state(find.byType(CargoCard));
      state0.updateConfig();
      await wt.pumpAndSettle();
      CargoCardState state1 = wt.state(find.byType(CargoCard));

      //then
      expect(state1.childrenCargoIsValidMap.entries.length, 22);
      expect(state1.valid, false);
      expect(test.cargo.entries.length, 22);
      expect(onChangeMap[1], false);
    });
}