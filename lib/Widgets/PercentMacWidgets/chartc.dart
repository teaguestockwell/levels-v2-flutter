import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Backend/model.dart';
import '../Uitls.dart';

class ChartCRow extends StatefulWidget {
  bool valid = false;
  Aircraft a;
  String weight = '0', mom = '0';

  List<NameWeightFS> getNameWeightFS() {
    var ret = List<NameWeightFS>();
    ret.add(NameWeightFS(
      name: 'Basic Aircraft',
      mom: this.mom,
      weight: this.weight,
    ));
    return ret;
  }

  ChartCRow(this.a);
  @override
  _ChartCRowState createState() => _ChartCRowState();
}

class _ChartCRowState extends State<ChartCRow> {
  InputDecoration wi = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 1.0,
      ),
    ),
  );

  InputDecoration re = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 1.0,
      ),
    ),
  );

  InputDecoration w, m;

  @override
  initState() {
    w = wi;
    m = wi;
    super.initState();
  }

  validate() {
    var vali = true;

    if (double.parse(this.widget.weight) <
            double.parse(this.widget.a.weight1) &&
        double.parse(this.widget.weight) >
            double.parse(this.widget.a.weight0)) {
      setState(() {
        w = re;
      });
    } else {
      vali = false;
    }

    if (double.parse(this.widget.mom) < double.parse(this.widget.a.mom1) &&
        double.parse(this.widget.mom) > double.parse(this.widget.a.mom0)) {
      setState(() {
        m = re;
      });
    } else {
      vali = false;
    }

    this.widget.valid = vali;
    print(vali);
  }

  @override
  Widget build(BuildContext context) {
    return CardAllwaysOpen(
        "Chart C",
        Column(
          children: [
            Row2.padding(
                0,
                5,
                0,
                0,
                Text("Basic Weight"),
                Container(
                    width: Const.pickerWidth,
                    height: Const.pickerHeight,
                    child: TextField(
                      onChanged: (String s) {
                        this.widget.weight = s;
                        validate();
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        DecimalTextInputFormatter()
                      ],
                      textAlign: TextAlign.center,
                      decoration: w,
                    ))),
            Divider(),
            Row2.padding(
                0,
                0,
                0,
                5,
                Text("Basic Moment"),
                Container(
                    width: Const.pickerWidth,
                    height: Const.pickerHeight,
                    child: TextField(
                      onChanged: (String s) {
                        this.widget.mom = s;
                        validate();
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        DecimalTextInputFormatter()
                      ],
                      textAlign: TextAlign.center,
                      decoration: m,
                    ))),
          ],
        ));
  }
}
