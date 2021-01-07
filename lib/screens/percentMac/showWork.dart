import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../screens/home/loading.dart';
import '../../screens/percentMac/perMacCard.dart';
import '../../widgets/display/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'aricraftPerMacCard.dart';
import 'balArmCard.dart';

class ShowWork extends StatefulWidget {
  final String lemac;
  final String mac;
  final List<NameWeightFS> nwfs;

  ShowWork({
    @required this.lemac,
    @required this.mac,
    @required this.nwfs,
  });

  @override
  _ShowWorkState createState() => _ShowWorkState();
}

class _ShowWorkState extends State<ShowWork> {
  Widget body = Loading();

  @override
  void initState() {
    super.initState();
    //execute after first build
    SchedulerBinding.instance.addPostFrameCallback((_) => buildShowWork());
  }
  

  void buildShowWork() async{

    var permac = PerMac(
      lemacS: this.widget.lemac,
      macS: this.widget.mac,
      nwfss: this.widget.nwfs
    );

    Widget ret = InteractiveViewer(
      minScale: 0.01,
      constrained: false,
      child: Column(
        children: [
          AircraftPerMacCard(permac),
          BalArmCard(permac),
          PerMacCard(permac),
        ]
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