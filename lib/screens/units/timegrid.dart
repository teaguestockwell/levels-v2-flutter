import '../../backend/cont.dart';
import '../../widgets/display/text.dart';
import '../../widgets/layout/alignPadding.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeGrid extends StatefulWidget {
  _TimeGrid createState() => _TimeGrid();
}

class _TimeGrid extends State<TimeGrid> {
  Timer t;
  var now = DateTime.now().toLocal();
  var znow = DateTime.now().toUtc();
  final lYYYYMMDD = DateFormat('yyyy MM dd');
  final lJJJ = DateFormat('DDD');
  final lHHMMSS = DateFormat('HH:mm:ss');
  final zYYYYMMDD = DateFormat('yyyy MM dd');
  final zJJJ = DateFormat('DDD');
  final zHHMMSS = DateFormat('HH:mm:ss');

  @override
  void initState() {
    super.initState();
    t = Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        now = DateTime.now().toLocal();
        znow = now.toUtc();
      });
    });
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlignPadding(
        2.0,
        Alignment.center,
        Table(
            border: TableBorder(
                horizontalInside: BorderSide(
                    color: Const.divColor, width: Const.divThickness),
                verticalInside: BorderSide(
                    color: Const.divColor, width: Const.divThickness)),
            children: [
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'Zone',
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'hh:mm:ss',
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'JJJ',
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'YYYY MM DD',
                    )))
              ]),
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'Local',
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      lHHMMSS.format(now),
                      fontWeight: FontWeight.normal,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      lJJJ.format(now),
                      fontWeight: FontWeight.normal,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      lYYYYMMDD.format(now),
                      fontWeight: FontWeight.normal,
                    )))
              ]),
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'Zulu',
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      zHHMMSS.format(znow),
                      fontWeight: FontWeight.normal,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      zJJJ.format(znow),
                      fontWeight: FontWeight.normal,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      zYYYYMMDD.format(znow),
                      fontWeight: FontWeight.normal,
                    )))
              ]),
            ]));
  }
}
