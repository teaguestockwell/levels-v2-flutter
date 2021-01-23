import 'package:five_level_one/backend/models/name_weight_fs.dart';
import 'package:five_level_one/screens/percentmac/validated_cargo_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


Widget mk(Widget child){
  return MaterialApp(home:child);
}

 NameWeightFS getEmpty(){
  return NameWeightFS();
}

NameWeightFS getValid(){
  return NameWeightFS(
    name: 'name',
    weight: '20',
    fs: '1000',
    qty: '2'
  );
}

NameWeightFS getValidFromChartC(){
  return NameWeightFS(
  name: 'name',
  weight: '25',
  fs: '280',
  qty: '1',
  mom: '0.7',
  simplemom: '10000'
  );
}
NameWeightFS getInvalidName(){
  return NameWeightFS(
    name: '',
    weight: '20',
    fs: '1000',
    qty: '2'
  );
}

NameWeightFS getInvalidWeightS(){
  return NameWeightFS(
    name: 'name',
    weight: '0',
    fs: '1000',
    qty: '2'
  );
}

NameWeightFS getInvalidWeightL(){
  return NameWeightFS(
    name: 'name',
    weight: '2000000',
    fs: '1000',
    qty: '2'
  );
}

NameWeightFS getInvalidFSS(){
  return NameWeightFS(
    name: 'name',
    weight: '20',
    fs: '0',
    qty: '2'
  );
}

NameWeightFS getInvalidFSL(){
  return NameWeightFS(
    name: 'name',
    weight: '20',
    fs: '100000',
    qty: '2'
  );
}

NameWeightFS getInvalidQty(){
  return NameWeightFS(
    name: 'name',
    weight: '20',
    fs: '1000',
    qty: '0'
  );
}

List<NameWeightFS> getAllInvalidNWFS(){
  return [
    getInvalidFSL(),
    getInvalidFSS(),
    getInvalidName(),
    getInvalidQty(),
    getInvalidWeightL(),
    getInvalidWeightS(),
  ];
}

List<NameWeightFS> getAllValidNWFS(){
  return [
    getValid(),
    getValidFromChartC(),
  ];
}

///min valid fs
String fs0(){
  return '100';
}

///max valid fs
String fs1(){
  return '10000';
}

String cargoMaxWeight(){
  return '10000';
}

void main(){
       testWidgets(
    'given a validated cargo ui with an invalid nwfs, when drawn, then it will start open',
    (WidgetTester wt) async {

      for(int i=0; i< getAllInvalidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllInvalidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, false);
      expect(state0.ope, true);
      }
    });

     testWidgets(
    'given a validated cargo ui with an invalid nwfs, when drawn, then it is invalid',
    (WidgetTester wt) async {

      for(int i=0; i< getAllInvalidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllInvalidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, false);

      
      }
    });

       testWidgets(
    'given a validated cargo ui with an invalid nwfs, when it is closed, then it is invalid',
    (WidgetTester wt) async {

      for(int i=0; i< getAllInvalidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllInvalidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();
      await wt.tap(find.byKey(Key('tap')));
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, false);
      }
    });

       testWidgets(
    'given a validated cargo ui with a valid nwfs, when drawn , then it will start closed',
    (WidgetTester wt) async {

      for(int i=0; i< getAllValidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllValidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //then 
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, true);
      expect(state0.ope, false);
      }
    });

    testWidgets(
    'given a validated cargo ui with a valid nwfs, when opened, then it is valid',
    (WidgetTester wt) async {

      for(int i=0; i< getAllValidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllValidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, true);

      await wt.tap(find.byKey(Key('tap')));
      await wt.pumpAndSettle();

      //then alsoinvalid while open
      ValidatedCargoUIState state1 = wt.state(find.byType(ValidatedCargoUI));
      expect(state1.valid, true);
      }
    });

     testWidgets(
    'given a validated cargo ui with a valid nwfs, when text changed to invalid, then it is invalid',
    (WidgetTester wt) async {

      for(int i=0; i<4;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getValid(),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //init valid 
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, true);

      //means it starts closed so open it
      await wt.tap(find.byKey(Key('tap')));
      await wt.pumpAndSettle();

      //then
      await wt.enterText(find.byType(TextField).at(i), '');
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state1 = wt.state(find.byType(ValidatedCargoUI));
      expect(state1.valid, false);
      expect(state1.childValid[i], false);

      //if it was not changed it should be valid still
      [0,1,2,3].forEach((j){
        if(j!=i){
        expect(state1.childValid[j], true);
        }
      });
      }

    });


}