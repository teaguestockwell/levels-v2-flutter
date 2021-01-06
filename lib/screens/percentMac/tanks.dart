import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:five_level_one/widgets/input/buttonModalSpinner.dart';
import 'package:five_level_one/widgets/layout/cards/cardAllwaysOpen.dart';
import 'package:five_level_one/widgets/layout/rows/row2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../backend/model.dart';

class TanksCard extends StatefulWidget {
  final Aircraft air;
  final bool valid = true;
  var tankRows = List<Widget>();
  var tankNSWF = List<TankRow>();
  
  List<NameWeightFS> getNameWeightFS() {
    var ret = List<NameWeightFS>();
    tankNSWF.forEach((t) {ret.add(t.selected);});
    return ret;
  }

  TanksCard(this.air);

  @override
  _TanksCardState createState() => _TanksCardState();
}

class _TanksCardState extends State<TanksCard>
with AutomaticKeepAliveClientMixin<TanksCard> {
  @override bool get wantKeepAlive => true;

  @override
  void initState() {
    for (Tank t in this.widget.air.tanks) {
      var tank = TankRow(t);
      this.widget.tankRows.add(tank);
      this.widget.tankNSWF.add(tank);
      this.widget.tankRows.add(Divider(color: Const.divColor,thickness: Const.divThickness,),);
    }
    this.widget.tankRows.removeAt(this.widget.tankRows.length - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardAllwaysOpen("Tanks", Column(children: this.widget.tankRows), Const.nonfocusedBoderColors);
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
      onPressed: (int i){selected = t.nameWeightFSs[i]; print(selected.toString());},
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
