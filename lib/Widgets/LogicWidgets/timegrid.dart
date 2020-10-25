import 'dart:async';
import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/Uitls.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TimeGrid extends StatefulWidget {
  _TimeGrid createState() => _TimeGrid();
}

class _TimeGrid extends State<TimeGrid> {
  Timer t;
  @override
  void initState() {
    t = Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var znow = now.toUtc();

    var lYYYYMMDD = DateFormat('yyyy MM dd').format(now).toString();
    var lJJJ = DateFormat('DDD').format(now).toString();
    var lHHMMSS = DateFormat('HH:mm:ss').format(now).toString();

    var zYYYYMMDD = DateFormat('yyyy MM dd').format(znow).toString();
    var zJJJ = DateFormat('DDD').format(znow).toString();
    var zHHMMSS = DateFormat('HH:mm:ss').format(znow).toString();

    return AlignPadding(
        2.0,
        Alignment.center,
        Table(
            border: TableBorder(
                horizontalInside: BorderSide(
                    color: Const.timeGridLinescolor,
                    width: Const.timeGridDivSize),
                verticalInside: BorderSide(
                    color: Const.timeGridLinescolor,
                    width: Const.timeGridDivSize)),
            children: [
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'Zone',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'hh:mm:ss',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'JJJ',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'YYYY MM DD',
                      textAlign: TextAlign.center,
                    )))
              ]),
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'Local',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      lHHMMSS,
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      lJJJ,
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      lYYYYMMDD,
                      textAlign: TextAlign.center,
                    )))
              ]),
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      'Zulu',
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      zHHMMSS,
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      zJJJ,
                      textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Text(
                      zYYYYMMDD,
                      textAlign: TextAlign.center,
                    )))
              ]),
            ]));
  }
}
