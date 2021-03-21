// @dart=2.9
// @dart=2.9
import 'package:five_level_one/constant.dart';
import 'package:five_level_one/util.dart';
import 'package:five_level_one/screens/units/unit_conversion.dart';
import 'package:five_level_one/widgets/input/custom_text_field.dart';
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
    for (var unitCategory in UnitCategories.values) {
      //given
      final test = MaterialApp(home: Scaffold(body: UnitConversion()));

      //when
      await wt.pumpWidget(test);
      await wt.enterText(find.byType(CustomTextField).first, '123');
      await wt.pumpAndSettle();
      await wt.enterText(find.byType(CustomTextField).last, '123');
      await wt.pumpAndSettle();
      final UnitConversionState state3 = wt.state(find.byType(UnitConversion));
      state3.unitChange(unitCategory.index);
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
    for (var unitCategory in UnitCategories.values) {
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
      state3.unitChange(unitCategory.index);
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
      'given a unit converison, when left unit unit changed, then left text will remain',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: UnitConversion()));

    //when
    await wt.pumpWidget(test);
    await wt.enterText(find.byType(CustomTextField).first, '100');
    await wt.pumpAndSettle();
    final UnitConversionState state0 = wt.state(find.byType(UnitConversion));
    state0.leftUnitUnitChanged(
        UnitCategories.Distance.index); //left unit unit to mm
    await wt.pumpAndSettle();

    //then
    final UnitConversionState state1 = wt.state(find.byType(UnitConversion));
    final l = state1.controllerOne.text;

    expect(l, '100');
  });

  testWidgets(
      'given a unit converison, when right unit unit changed, then right text will remain',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: UnitConversion()));

    //when
    await wt.pumpWidget(test);
    await wt.enterText(find.byType(CustomTextField).last, '100');
    await wt.pumpAndSettle();
    final UnitConversionState state0 = wt.state(find.byType(UnitConversion));
    state0.rightUnitUnitChanged(
        UnitCategories.Distance.index); //left unit unit to mm
    await wt.pumpAndSettle();

    //then
    final UnitConversionState state1 = wt.state(find.byType(UnitConversion));
    final r = state1.controllerTwo.text;

    expect(r, '100');
  });

  testWidgets(
      'given a unit converison, when each unit is used, then each unit unit change will be accurate',
      (WidgetTester wt) async {
    //each unit ex: length
    //given
    for (var unitCategory in UnitCategories.values) {
      var index = 0;
      var conversions = unitCategoryConversions[unitCategory];
      for (var conversion in conversions) {
        // Distance as dropdown List<Units>.length -1 -index
        final rightTextFieldConversionIdx = conversions.length - 1 - index;
        final test = MaterialApp(
            home:
                Scaffold(backgroundColor: background, body: UnitConversion()));
        //when
        await wt.pumpWidget(test);

        //change unit idx
        final UnitConversionState state10 =
            wt.state(find.byType(UnitConversion));
        state10.unitChange(unitCategory.index);
        await wt.pumpAndSettle();

        //change l unit unit idx = j
        final UnitConversionState state0 =
            wt.state(find.byType(UnitConversion));
        state0.toggle = true;
        state0.leftUnitUnitChanged(index);
        await wt.pumpAndSettle();

        //change right unit unit idx = uulength - j +1
        final UnitConversionState state1 =
            wt.state(find.byType(UnitConversion));
        state1.toggle = true;
        state1.rightUnitUnitChanged(rightTextFieldConversionIdx);
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
                    conversion.baseMultiplier /
                    conversions[rightTextFieldConversionIdx].baseMultiplier)
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
                    conversions[rightTextFieldConversionIdx].baseMultiplier /
                    conversions[index].baseMultiplier)
                .toStringAsPrecision(6));
        index++;
      }
    }
  });
}
