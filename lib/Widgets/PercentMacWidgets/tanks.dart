import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Backend/model.dart';

class TanksCard extends StatefulWidget {
  final Aircraft air;
  final tankRows = List<Widget>();
  final bool valid = true;

  TanksCard(this.air){
    for (Tank t in air.tanks) {
      tankRows.add(TankRow(t));
      tankRows.add(Divider(color: Const.divColor,thickness: Const.divThickness,),);
    }
    tankRows.removeAt(tankRows.length - 1);
  }

  List<NameWeightFS> getNameWeightFS() {
    var ret = List<NameWeightFS>();

    for (var t in tankRows) {
      if (t is TankRow) {
        ret.add(t.selected);
      }
    }
    return ret;
  }

  
  @override
  _TanksCardState createState() => _TanksCardState();
}

class _TanksCardState extends State<TanksCard>
with AutomaticKeepAliveClientMixin<TanksCard> {
  @override bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return CardAllwaysOpen("Tanks", Column(children: this.widget.tankRows));
  }
}

class TankRow extends StatefulWidget {
  final Tank t;
  NameWeightFS selected;
  CustomButtomSpinnerModalString spin;
  TankRow(this.t){
    selected = t.nameWeightFSs[0]; 

    spin = CustomButtomSpinnerModalString(
      _getTankStringssForSpinner(),
      onPressed: (int i)=>{selected = t.nameWeightFSs[i]},
    );

  }

  _getTankStringssForSpinner() {
    List<String> ret = [];
    for (int i = 0; i < t.nameWeightFSs.length; i++) {
      ret.add(t.nameWeightFSs[i].weight);  
    }
    return ret;
  }

  @override
  _TankRowState createState() => _TankRowState();
}

class _TankRowState extends State<TankRow> {

  @override
  Widget build(BuildContext context) {
    return Row2(
      Tex(this.widget.t.name),
      this.widget.spin
    );
  }
}
