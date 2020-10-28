import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Backend/model.dart';

class TanksCard extends StatefulWidget {
  Aircraft air;
  var tankRows = List<Widget>();
  final bool valid = true;

  List<NameWeightFS> getNameWeightFS() {
    var ret = List<NameWeightFS>();

    for (var t in tankRows) {
      if (t is TankRow) {
        ret.add(t.selected);
      }
    }
    return ret;
  }

  TanksCard(this.air);
  @override
  _TanksCardState createState() => _TanksCardState();
}

class _TanksCardState extends State<TanksCard> {
  @override
  void initState() {
    //init default tank selection
    for (Tank t in this.widget.air.tanks) {
      this.widget.tankRows.add(TankRow(t));
      this.widget.tankRows.add(Divider());
    }

    this.widget.tankRows.removeAt(this.widget.tankRows.length - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardAllwaysOpen("Tanks", Column(children: this.widget.tankRows));
  }
}

class TankRow extends StatefulWidget {
  Tank t;
  NameWeightFS selected;
  TankRow(this.t);
  @override
  _TankRowState createState() => _TankRowState();
}

class _TankRowState extends State<TankRow> {
  @override
  void initState() {
    this.widget.selected = this.widget.t.nameWeightFSs[0];
    super.initState();
  }

  lenChange(var n) {
    this.widget.selected = this.widget.t.nameWeightFSs[n];
    print(this.widget.selected.toString());
  }

  getTankWidgetsForSpinner() {
    List<Widget> list = [];
    for (int i = 0; i < this.widget.t.nameWeightFSs.length; i++) {
      list.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: Text(
            this.widget.t.nameWeightFSs[i].weight,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row2(
      Text(this.widget.t.name),
      Row(children: <Widget>[
        Padding(
            padding: EdgeInsets.all(0),
            child: Container(
                width: 120,
                height: 30,
                child: CupertinoPicker(
                  children: getTankWidgetsForSpinner(),
                  onSelectedItemChanged: lenChange,
                  itemExtent: 30,
                )))
      ]),
    );
  }
}
