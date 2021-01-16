import 'package:five_level_one/screens/units/timeGrid.dart';
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
    final now = DateTime.now().toLocal();
    final znow = DateTime.now().toUtc();
    final lYYYYMMDD = DateFormat('yyyy MM dd').format(now);
    final lJJJ = DateFormat('DDD').format(now);
    final lHHMMSS = DateFormat('HH:mm:ss').format(now);
    final zYYYYMMDD = DateFormat('yyyy MM dd').format(znow);
    final zJJJ = DateFormat('DDD').format(znow);
    final zHHMMSS = DateFormat('HH:mm:ss').format(znow);

    expect(find.text(lYYYYMMDD), findsOneWidget);
    expect(find.text(lJJJ), findsOneWidget);
    expect(find.text(lHHMMSS), findsOneWidget);
    expect(find.text(zYYYYMMDD), findsOneWidget);
    expect(find.text(zJJJ), findsOneWidget);
    expect(find.text(zHHMMSS), findsOneWidget);
  });

  testWidgets('given a timegird, after 1 second, then it tick',
      (WidgetTester wt) async {
    //given
    final test = MaterialApp(home: Scaffold(body: TimeGrid()));

    //when
    await wt.pumpWidget(test);

    final now = DateTime.now().toLocal();
    final znow = DateTime.now().toUtc();
    final lYYYYMMDD = DateFormat('yyyy MM dd').format(now);
    final lJJJ = DateFormat('DDD').format(now);
    final lHHMMSS = DateFormat('HH:mm:ss').format(now);
    final zYYYYMMDD = DateFormat('yyyy MM dd').format(znow);
    final zJJJ = DateFormat('DDD').format(znow);
    final zHHMMSS = DateFormat('HH:mm:ss').format(znow);

    expect(find.text(lYYYYMMDD), findsOneWidget);
    expect(find.text(lJJJ), findsOneWidget);
    expect(find.text(lHHMMSS), findsOneWidget);
    expect(find.text(zYYYYMMDD), findsOneWidget);
    expect(find.text(zJJJ), findsOneWidget);
    expect(find.text(zHHMMSS), findsOneWidget);

    //then
    await wt.pump(Duration(seconds: 1));

    final now1 = DateTime.now().toLocal();
    final znow1 = DateTime.now().toUtc();
    final lYYYYMMDD1 = DateFormat('yyyy MM dd').format(now1);
    final lJJJ1 = DateFormat('DDD').format(now1);
    final lHHMMSS1 = DateFormat('HH:mm:ss').format(now1);
    final zYYYYMMDD1 = DateFormat('yyyy MM dd').format(znow1);
    final zJJJ1 = DateFormat('DDD').format(znow1);
    final zHHMMSS1 = DateFormat('HH:mm:ss').format(znow1);

    expect(find.text(lYYYYMMDD1), findsOneWidget);
    expect(find.text(lJJJ1), findsOneWidget);
    expect(find.text(lHHMMSS1), findsOneWidget);
    expect(find.text(zYYYYMMDD1), findsOneWidget);
    expect(find.text(zJJJ1), findsOneWidget);
    expect(find.text(zHHMMSS1), findsOneWidget);
  });
}
