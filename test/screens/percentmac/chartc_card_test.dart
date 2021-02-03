import 'dart:collection';
import 'package:five_level_one/backend/models/aircraft.dart';
import 'package:five_level_one/widgets/input/validated_text.dart';
import 'package:five_level_one/screens/percentmac/chartc_card.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


class AircraftMock extends Mock implements Aircraft{}


AircraftMock getAir(){
  final ret = AircraftMock();

  when(ret.weight0).thenReturn(100000);
  when(ret.weight1).thenReturn(150000);
  when(ret.mom0).thenReturn(10000);
  when(ret.mom1).thenReturn(14000);
  
  return ret;
}

Widget mk(Widget child){
  return MaterialApp(home: child);
}

void main(){

  testWidgets(
    'given a chart c card, when drawn, then it will be invalid',
    (WidgetTester wt) async {
      //given
      final test = mk(ChartCCard(getAir(), (i,b){}));

      //when
      await wt.pumpWidget(test);

      //then
      ChartCCardState state0 = wt.state(find.byType(ChartCCard));
      expect(state0.valid, false);
    });

    testWidgets(
    'given a chart c card, when drawn, then it will isert false into its callback map at key 0',
    (WidgetTester wt) async {
      final parentMap = HashMap<int, bool>();

      //given
      final test = mk(ChartCCard(getAir(), (i,b){parentMap[i] = b; }));

      //when
      await wt.pumpWidget(test);

      //then 
      expect(parentMap[0], false);
    });

     testWidgets(
    'given a chart c card, when valid weight is entered, then childValid map[0] = true',
    (WidgetTester wt) async {
      final parentMap = HashMap<int, bool>();

      //given
      final cc = ChartCCard(getAir(), (i,b){parentMap[i] = b; });
      final test = mk(cc);

      //when
      await wt.pumpWidget(test);
      await wt.enterText(find.byType(ValidatedText).first, '120000');
      await wt.pumpAndSettle();

      //then 
      ChartCCardState state0 = wt.state(find.byType(ChartCCard));
      expect(state0.valid, false);
      expect(cc.childrenValid[0], true);
      expect(cc.childrenValid[1], false);
      expect(parentMap[0], false);
    });

    testWidgets(
    'given a chart c card, when valid moment is entered, then childValid map[1] = true',
    (WidgetTester wt) async {
      final parentMap = HashMap<int, bool>();

      //given
      final cc = ChartCCard(getAir(), (i,b){parentMap[i] = b; });
      final test = mk(cc);

      //when
      await wt.pumpWidget(test);
      await wt.enterText(find.byType(ValidatedText).last, '11000');
      await wt.pumpAndSettle();

      //then 
      ChartCCardState state0 = wt.state(find.byType(ChartCCard));
      expect(state0.valid, false);
      expect(cc.childrenValid[0], false);
      expect(cc.childrenValid[1], true);
      expect(parentMap[0], false);
    });

    testWidgets(
    'given a chart c card, when valid weight and moment are enterd, then parentmap[0] = true',
    (WidgetTester wt) async {
      final parentMap = HashMap<int, bool>();

      //given
      final cc = ChartCCard(getAir(), (i,b){parentMap[i] = b; });
      final test = mk(cc);

      //when
      await wt.pumpWidget(test);
      await wt.enterText(find.byType(ValidatedText).last, '11000');
      await wt.enterText(find.byType(ValidatedText).first, '120000');
      await wt.pumpAndSettle();

      //then 
      ChartCCardState state0 = wt.state(find.byType(ChartCCard));
      expect(state0.valid, true);
      expect(cc.childrenValid[0], true);
      expect(cc.childrenValid[1], true);
      expect(parentMap[0], true);
    });

    testWidgets(
    'given a valid chart c card, when invalid text is entered, then parentmap[0] = false',
    (WidgetTester wt) async {
      final parentMap = HashMap<int, bool>();

      //given
      final cc = ChartCCard(getAir(), (i,b){parentMap[i] = b; });
      final test = mk(cc);

      await wt.pumpWidget(test);
      await wt.enterText(find.byType(ValidatedText).last, '11000');
      await wt.enterText(find.byType(ValidatedText).first, '120000');
      await wt.pumpAndSettle();

      ChartCCardState state0 = wt.state(find.byType(ChartCCard));
      expect(state0.valid, true);
      expect(cc.childrenValid[0], true);
      expect(cc.childrenValid[1], true);
      expect(parentMap[0], true);

      //when
      await wt.enterText(find.byType(ValidatedText).last, '11000000000000');
      await wt.enterText(find.byType(ValidatedText).first, '12000000000');
      await wt.pumpAndSettle();

       ChartCCardState state1 = wt.state(find.byType(ChartCCard));
      expect(state1.valid, false);
      expect(cc.childrenValid[0], false);
      expect(cc.childrenValid[1], false);
      expect(parentMap[0], false);
    });

    
}