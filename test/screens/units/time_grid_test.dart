import 'package:five_level_one/screens/units/time_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';


void main() {
  testWidgets('given a timegird, when rendered, then it will draw',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: TimeGrid()));

    //when
    await wt.pumpWidget(test);

    //then
    expect(find.byType(Text), findsNWidgets(12));
  });

  testWidgets(
      'given a timegird, when rendered, then it will draw to the correct time',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: TimeGrid()));

    //when
    await wt.pumpWidget(test);

    //then

    //the wt.pump may take a few seconds, so make sure now is within resonable 
    //duration
    TimeGridState state0 = wt.state(find.byType(TimeGrid));
    var now = DateTime.now();
    Duration diff = state0.now.difference(now).abs();
    expect(diff.inSeconds<10, true);

    final znow = state0.now.toUtc();
    final lYYYYMMDD = DateFormat('yyyy MM dd').format(state0.now);
    final lJJJ = DateFormat('DDD').format(state0.now);
    //final lHHMMSS = DateFormat('HH:mm:ss').format(now);
    final zYYYYMMDD = DateFormat('yyyy MM dd').format(znow);
    final zJJJ = DateFormat('DDD').format(znow);
    //final zHHMMSS = DateFormat('HH:mm:ss').format(znow);

    expect(find.text(lYYYYMMDD), findsWidgets);
    expect(find.text(lJJJ), findsWidgets);
    //expect(find.text(lHHMMSS), findsWidgets);
    expect(find.text(zYYYYMMDD), findsWidgets);
    expect(find.text(zJJJ), findsWidgets);
    //expect(find.text(zHHMMSS), findsWidgets);
  });
}
