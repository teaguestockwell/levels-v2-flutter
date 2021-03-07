import 'dart:collection';
import 'dart:convert' as convert;
import 'package:five_level_one/backend/models/nested/aircraft.dart';
import 'package:five_level_one/backend/models/nested/cargo.dart';
import 'package:five_level_one/backend/models/nested/config.dart';
import 'package:five_level_one/screens/percentmac/cargo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AirMock extends Mock implements Aircraft{}

Widget mk(Widget child){
  return MaterialApp(home: ListView(children: [child],));
}

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

      /// this is an invalif config because there is no fs on flare placards
      final dynamic jsonInvalid = convert.jsonDecode('''{
        "aircraftid": 1,
        "configid": 1,
        "name": "AE-1",
        "configcargos": [
          {
            "configid": 1,
            "aircraftid": 1,
            "cargoid": 28,
            "configcargoid": 1,
            "fs": 0,
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

List<Config> getValidConfig(){
  List<Config> ret = [];

  for(int i=0; i<10; i++){
    ret.add(
      Config.fromJson(json)
    );
  }
  return ret;
}

List<Config> getInvalidConfigs(){
  List<Config> ret = [];

  for(int i=0; i<10; i++){
    ret.add(
      Config.fromJson(jsonInvalid)
    );
  }
  return ret;
}

///invalid cargo because there is not fs or moment
List<Cargo> getInvalidCargo(){
  List<Cargo> ret = [];

  for(int i=0; i<100; i++){
    ret.add(
      Cargo(name: 'cargo', weight: 20)
    );
  }
  return ret;
}

///valid cargo because there is fs || moment
List<Cargo> getValidCargo(){
  List<Cargo> ret = [];

  for(int i=0; i<100; i++){
    ret.add(
      Cargo(name: 'cargo', weight: 20, fs: 300) //valid cargo 
    );
  }
  return ret;
}

AirMock getAirWithInvalidCargosAndValidConfig(){
  final ret = AirMock();

  when(ret.cargos).thenReturn(getInvalidCargo());
  when(ret.configs).thenReturn(getValidConfig());
  when(ret.fs0).thenReturn(80);
  when(ret.fs1).thenReturn(2000);
  when(ret.cargoweight1).thenReturn(100000);
  return ret;
}

AirMock getAirWithValidCargosAndValidConfig(){
  final ret = AirMock();

  when(ret.cargos).thenReturn(getValidCargo());
  when(ret.configs).thenReturn(getValidConfig());
  when(ret.fs0).thenReturn(80);
  when(ret.fs1).thenReturn(2000);
  when(ret.cargoweight1).thenReturn(100000);
  return ret;
}

AirMock getAirValidCargosAndInvalidConfig(){
  final ret = AirMock();

  when(ret.cargos).thenReturn(getValidCargo());
  when(ret.configs).thenReturn(getInvalidConfigs());
  when(ret.fs0).thenReturn(80);
  when(ret.fs1).thenReturn(2000);
  when(ret.cargoweight1).thenReturn(100000);
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
      expect(find.byType(Text), findsNWidgets(9));
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
      expect(state0.selectedSpinnerCargo, test.air.cargos[0]);
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
      expect(state0.selectedSpinnerCargo, test.air.cargos[0]);
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
      state0.addEmptyCargo();
      await wt.pumpAndSettle();
      CargoCardState state1 = wt.state(find.byType(CargoCard));

      //then
      expect(state1.childrenCargoIsValidMap.entries.length, 1);
      expect(state1.valid, false);
      expect(test.cargo.entries.length, 1);
      expect(onChangeMap[1], false);
      expect(find.byType(Text), findsNWidgets(14));

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
      state0.addCargo(0);
      await wt.pumpAndSettle();
      CargoCardState state1 = wt.state(find.byType(CargoCard));

      //then
      expect(state1.childrenCargoIsValidMap.entries.length, 1);
      expect(state1.valid, true);
      expect(test.cargo.entries.length, 1);
      expect(onChangeMap[1], true);
      expect(find.byType(Text), findsNWidgets(10));
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
      state0.updateConfig(0);
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
      state0.updateConfig(0);
      await wt.pumpAndSettle();
      CargoCardState state1 = wt.state(find.byType(CargoCard));

      //then
      expect(state1.childrenCargoIsValidMap.entries.length, 22);
      expect(state1.valid, false);
      expect(test.cargo.entries.length, 22);
      expect(onChangeMap[1], false);
    });
}