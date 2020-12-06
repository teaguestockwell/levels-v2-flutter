import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:five_level_one/Widgets/Uitls.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TimeGrid extends StatefulWidget {
  _TimeGrid createState() => _TimeGrid();
  final asg = AutoSizeGroup();
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

    return  AlignPadding(
        2.0,
        Alignment.center,
        Table(
            border: TableBorder(
                horizontalInside: BorderSide(
                    color: Const.divColor,
                    width: Const.divThickness),
                verticalInside: BorderSide(
                    color: Const.divColor,
                    width: Const.divThickness)),
            children: [
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'Zone',
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'hh:mm:ss',
                      autoSizeGroup: this.widget.asg,
                     // textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'JJJ',
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'YYYY MM DD',
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    )))
              ]),
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'Local',
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      lHHMMSS,
                      autoSizeGroup: this.widget.asg,
                     // textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      lJJJ,
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      lYYYYMMDD,
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    )))
              ]),
              TableRow(children: [
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      'Zulu',
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      zHHMMSS,
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      zJJJ,
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    ))),
                AlignPadding(
                    5,
                    Alignment.center,
                    FittedBox(
                        child: Tex(
                      zYYYYMMDD,
                      autoSizeGroup: this.widget.asg,
                      //textAlign: TextAlign.center,
                    )))
              ]),
            ]));
  }
}
