import 'package:five_level_one/Widgets/input/buttonModalSpinner.dart';
import 'package:five_level_one/Widgets/layout/div.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:five_level_one/widgets/layout/rows/row2.dart';
import '../../backend/cont.dart';
import '../../utils.dart';
import '../../widgets/layout/cards/cardAllwaysOpen.dart';
import '../../backend/model.dart';
import 'package:flutter/material.dart';

class TanksCard extends StatelessWidget {
  final Aircraft air;
  final NWFSCallBack callBack;

  TanksCard({@required this.air, @required this.callBack});

  List<Widget> getTanks(List<Tank> tanks) {
    List<Widget> ret = [];
    for (Tank t in tanks) {
      ret.add(TankRow(tank: t, callBack: callBack));
      ret.add(Div());
    }
    ret.removeLast();
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return CardAllwaysOpen(
        title: 'Tanks',
        children: getTanks(air.tanks),
        color: Const.nonfocusedBoderColors);
  }
}

class TankRow extends StatelessWidget {
  final Tank tank;
  final NWFSCallBack callBack;

  TankRow({@required this.tank, @required this.callBack});

  List<String> getTankWeights(Tank t) {
    List<String> ret = [];
    t.nameWeightFSs.forEach((nwfs) {
      ret.add(nwfs.weight);
    });
    return ret;
  }

  void spin(int i) {
    this.callBack(tank.nameWeightFSs[0].id, tank.nameWeightFSs[i]);
  }

  @override
  Widget build(BuildContext context) {
    spin(0); //init state of permac tanks map to include nwfs[0]
    return Row2(
        Tex(this.tank.name),
        ButtonModalSpinner(
          onSpin: spin,
          stringList: getTankWeights(tank),
        ));
  }
}
