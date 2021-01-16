import 'dart:developer';
import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/screens/units/unitConversion.dart';
import 'package:five_level_one/utils.dart';
import 'package:five_level_one/widgets/input/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('given a unit converison, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: UnitConversion()));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.byType(Text), findsNWidgets(4));
    expect(find.byType(CustomTextField), findsNWidgets(2));
  });

  testWidgets(
      'given a unit converison, when rendered, then text feilds will be blank',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: UnitConversion()));

    //when
    await wt.pumpWidget(test);

    //then
    final UnitConversionState state0 = wt.state(find.byType(UnitConversion));
    final l = state0.controllerOne.text;
    final r = state0.controllerTwo.text;

    expect(l, '');
    expect(r, '');
  });

  testWidgets(
      'given a unit converison, when unit changed, then text feilds will be blank',
      (WidgetTester wt) async {
    for (int i = 0; i < Unit.units.length; i++) {
      //given
      final test = MaterialApp(home: Scaffold(body: UnitConversion()));

      //when
      await wt.pumpWidget(test);
      await wt.enterText(find.byType(CustomTextField).first, '123');
      await wt.pumpAndSettle();
      await wt.enterText(find.byType(CustomTextField).last, '123');
      await wt.pumpAndSettle();
      final UnitConversionState state3 = wt.state(find.byType(UnitConversion));
      state3.unitChange(i);
      await wt.pumpAndSettle();

      //then
      final UnitConversionState state1 = wt.state(find.byType(UnitConversion));
      final l = state1.controllerOne.text;
      final r = state1.controllerTwo.text;

      expect(l, '');
      expect(r, '');
    }
  });

  testWidgets('given a unit converison, when unit changed, then l & r idx = 0',
      (WidgetTester wt) async {
    for (int i = 0; i < Unit.units.length; i++) {
      //given
      final test = MaterialApp(home: Scaffold(body: UnitConversion()));

      //when
      await wt.pumpWidget(test);
      final UnitConversionState state0 = wt.state(find.byType(UnitConversion));
      state0.leftUnitUnitChanged(4);
      await wt.pumpAndSettle();
      final UnitConversionState state2 = wt.state(find.byType(UnitConversion));
      state2.rightUnitUnitChanged(1);
      await wt.pumpAndSettle();
      final UnitConversionState state3 = wt.state(find.byType(UnitConversion));
      state3.unitChange(i);
      await wt.pumpAndSettle();

      //then
      final UnitConversionState state1 = wt.state(find.byType(UnitConversion));
      final l = state1.leftUnitUnitIdx;
      final r = state1.rightUnitUnitIdx;

      expect(l, 0);
      expect(r, 0);
    }
  });

  testWidgets(
      'given a unit converison, when l unit unit changed, then l text will remain',
      (WidgetTester wt) async {
    for (int i = 0; i < Unit(0).list.length; i++) {
      //given
      final test = MaterialApp(home: Scaffold(body: UnitConversion()));

      //when
      await wt.pumpWidget(test);
      await wt.enterText(find.byType(CustomTextField).first, '100');
      await wt.pumpAndSettle();
      final UnitConversionState state0 = wt.state(find.byType(UnitConversion));
      state0.leftUnitUnitChanged(i); //left unit unit to mm
      await wt.pumpAndSettle();

      //then
      final UnitConversionState state1 = wt.state(find.byType(UnitConversion));
      final l = state1.controllerOne.text;
      final r = state1.controllerTwo.text;

      expect(l, '100');
    }
  });

  testWidgets(
      'given a unit converison, when r unit unit changed, then r text will remain',
      (WidgetTester wt) async {
    for (int i = 0; i < Unit(0).list.length; i++) {
      //given
      final test = MaterialApp(home: Scaffold(body: UnitConversion()));

      //when
      await wt.pumpWidget(test);
      await wt.enterText(find.byType(CustomTextField).last, '100');
      await wt.pumpAndSettle();
      final UnitConversionState state0 = wt.state(find.byType(UnitConversion));
      state0.rightUnitUnitChanged(i); //left unit unit to mm
      await wt.pumpAndSettle();

      //then
      final UnitConversionState state1 = wt.state(find.byType(UnitConversion));
      final l = state1.controllerOne.text;
      final r = state1.controllerTwo.text;

      expect(r, '100');
    }
  });

  testWidgets(
      'given a unit converison, when r unit unit changed, then r text will remain',
      (WidgetTester wt) async {
    for (int i = 0; i < Unit(0).list.length; i++) {
      //given
      final test = MaterialApp(home: Scaffold(body: UnitConversion()));

      //when
      await wt.pumpWidget(test);
      await wt.enterText(find.byType(CustomTextField).last, '100');
      await wt.pumpAndSettle();
      final UnitConversionState state0 = wt.state(find.byType(UnitConversion));
      state0.rightUnitUnitChanged(i); //left unit unit to mm
      await wt.pumpAndSettle();

      //then
      final UnitConversionState state1 = wt.state(find.byType(UnitConversion));
      final l = state1.controllerOne.text;
      final r = state1.controllerTwo.text;

      expect(r, '100');
    }
  });

  testWidgets(
      'given a unit converison, when each unit is used, then each unit unit change will be accurate',
      (WidgetTester wt) async {
    //each unit ex: length
    for (int i = 0; i < Unit.units.length; i++) {
      //each unit of units ex: inches
      for (int j = 0; j < Unit(i).list.length; j++) {
        log('j ' + j.toString());
        log('i' + i.toString());
        //given
        final ridx = Unit(i).list.length - 1 - j;
        final selectedUnitUnit = Unit(i).list;
        final test = MaterialApp(
          home: Scaffold(
          backgroundColor: Const.background,
          body:  UnitConversion()
        ));

        //when
        await wt.pumpWidget(test);

        //change unit idx
        final UnitConversionState state10 =
            wt.state(find.byType(UnitConversion));
        state10.unitChange(i);
        await wt.pumpAndSettle();

        //change l unit unit idx = j
        final UnitConversionState state0 =
            wt.state(find.byType(UnitConversion));
        state0.toggle = true;
        state0.leftUnitUnitChanged(j);
        await wt.pumpAndSettle();

        //change r unit unit idx = uulength - j +1
        final UnitConversionState state1 =
            wt.state(find.byType(UnitConversion));
        state1.toggle = true;
        state1.rightUnitUnitChanged(ridx);
        await wt.pumpAndSettle();

        //enter text in left
        await wt.enterText(find.byType(CustomTextField).first, '1');
        final UnitConversionState state5 =
            wt.state(find.byType(UnitConversion));
        state5.controllerOne.notifyListeners();
        await wt.pumpAndSettle();

        //expect unit unit texts to be equal
        final UnitConversionState state3 =
            wt.state(find.byType(UnitConversion));

        final l = state3.controllerOne.text;
        final r = state3.controllerTwo.text;

        expect(l, '1');
        expect(
            r,
            (double.parse(l) *
                    selectedUnitUnit[j].numOfBases /
                    selectedUnitUnit[ridx].numOfBases)
                .toStringAsPrecision(6));

        //enter text right
        await wt.enterText(find.byType(CustomTextField).last, '1');
        final UnitConversionState state6 =
            wt.state(find.byType(UnitConversion));
        state6.controllerTwo.notifyListeners();
        await wt.pumpAndSettle();

        //expect unit unnit text to be equal
        final UnitConversionState state4 =
            wt.state(find.byType(UnitConversion));

        final l2 = state4.controllerOne.text;
        final r2 = state4.controllerTwo.text;

        expect(r2, '1');
        expect(
            l2,
            (double.parse(r2) *
                    selectedUnitUnit[ridx].numOfBases /
                    selectedUnitUnit[j].numOfBases)
                .toStringAsPrecision(6));
      }
    }
  });
}
