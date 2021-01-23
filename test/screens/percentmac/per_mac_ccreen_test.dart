import 'package:five_level_one/backend/models/aircraft.dart';
import 'package:five_level_one/backend/models/config.dart';
import 'package:five_level_one/backend/models/name_weight_fs.dart';
import 'package:five_level_one/backend/models/tank.dart';
import 'package:five_level_one/screens/percentmac/show_work.dart';
import 'package:five_level_one/widgets/input/validated_text.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:five_level_one/screens/percentmac/per_mac_screen.dart';

int numTanks = 20;
int fuelCap = 20000;
int fuelIncrament = 250;
String simpleMom = '10000';

Widget mk(Widget child){
  return MaterialApp(home: Scaffold(body: ListView(children: [child])));
}

class AirMock extends Mock implements Aircraft{}

AirMock getAir(){
  final ret = AirMock();
  
  //chartc dependancies
  when(ret.weight0).thenReturn('100000');
  when(ret.weight1).thenReturn('150000');
  when(ret.mom0).thenReturn('10000');
  when(ret.mom1).thenReturn('14000');

  //tank dependancies
  when(ret.tanks).thenReturn(getTanks());

  //cargo dependancies
  when(ret.addaCargo).thenReturn(getValidCargo());
  when(ret.configs).thenReturn(getValidConfig());
  when(ret.fs0).thenReturn('80');
  when(ret.fs1).thenReturn('2000');
  when(ret.cargomaxweight).thenReturn('100000');

  //show work dep
  when(ret.lemac).thenReturn('100');
  when(ret.mac).thenReturn('200');
  when(ret.simplemom).thenReturn('10000');

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
    
    ret.add(Tank(
      'tank ' + i.toString(),
      weightCSV,
      momCSV,
      simpleMom
    ));

  }
  return ret;
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