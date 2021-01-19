import '../../widgets/input/buttonModalSpinner.dart';
import '../../widgets/layout/div.dart';
import '../../widgets/display/text.dart';
import '../../widgets/layout/rows/row2.dart';
import '../../backend/cont.dart';
import '../../utils.dart';
import '../../widgets/layout/cards/cardAllwaysOpen.dart';
import '../../backend/model.dart';
import 'package:flutter/material.dart';

class TanksCard extends StatelessWidget {
  final Aircraft air;
  final NWFSCallBack callBack;

  TanksCard({@required this.air, @required this.callBack});

  List<Widget> getTanks() {
    List<Widget> ret = [];
    for (int i=0; i<air.tanks.length;i++) {
      ret.add(TankRow(tank: air.tanks[i], callBack: callBack));
      if(i!=air.tanks.length-1){ret.add(Div());}
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return CardAllwaysOpen(
        title: 'Tanks',
        children: getTanks(),
        color: Const.nonfocusedBoderColors);
  }
}

class TankRow extends StatelessWidget {
  final Tank tank;
  final NWFSCallBack callBack;

  TankRow({@required this.tank, @required this.callBack});

  List<String> getTankWeights() {
    List<String> ret = [];
    tank.nameWeightFSs.forEach((nwfs) {
      ret.add(nwfs.weight);
    });
    return ret;
  }


  //0 refers to the first nwfs, since each nwfs.id is unique this.nwfs[0] is used to identify the tank
  // we are passing the new nwfs of the selected spin to a map stored in permac state
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
          stringList: getTankWeights(),
        ));
  }
}
