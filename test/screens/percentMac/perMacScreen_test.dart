
import 'package:mockito/mockito.dart';
import '../../../lib/backend/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/screens/percentMac/perMacScreen.dart';

int numTanks = 20;
int fuelCap = 20000;
int fuelIncrament = 250;
String simpleMom = '10000';

Widget mk(Widget child){
  return MaterialApp(home: child);
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
  


}

List

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

void main(){
  testWidgets(
    'given a permacscreen, when drawn, then it will be invalid',
    (WidgetTester wt) async {

      //given
      final test = PerMacScreen()
    }
  );
}