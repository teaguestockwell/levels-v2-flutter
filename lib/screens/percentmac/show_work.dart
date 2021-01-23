import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../backend/const.dart';
import '../../backend/models/name_weight_fs.dart';
import '../../backend/models/per_mac.dart';
import '../../widgets/display/text.dart';
import '../home/loading.dart';
import 'bal_arm_card.dart';
import 'cargo_per_mac_card.dart';
import 'per_mac_card.dart';

class ShowWork extends StatefulWidget {
  final String lemac;
  final String mac;
  final List<NameWeightFS> nwfs;

  ShowWork({
    @required this.lemac,
    @required this.mac,
    @required this.nwfs,
  }): 

  assert(nwfs!=null),
  assert(nwfs.length > 0),
  assert(nwfs[0] != null),
  assert(lemac!= null),
  assert(lemac.isNotEmpty),
  assert(mac!=null),
  assert(mac.isNotEmpty);

  @override
  _ShowWorkState createState() => _ShowWorkState();
}

class _ShowWorkState extends State<ShowWork> {
  Widget body = Loading();
  ScrollController sc;
  PerMac permac;

  @override
  void initState() {
    super.initState();

    permac = PerMac(
      lemacS: this.widget.lemac,
      macS: this.widget.mac,
      nwfss: this.widget.nwfs
    );

    //execute after first build
    SchedulerBinding.instance.addPostFrameCallback((_) => buildShowWork());
  }
  
  void buildShowWork() {

    Widget ret = CupertinoScrollbar(
      controller: sc,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: sc,
        scrollDirection: Axis.vertical,
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
         children: [
          CargoPerMacCard(permac),
          BalArmCard(permac),
          PerMacCard(permac),
        ]
        )
      )
    );

    setState((){body=ret;});
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.background,
      appBar: AppBar(backgroundColor: Const.bottombarcolor, title: Tex('Show Work')),
      body: body
    );
  }
}