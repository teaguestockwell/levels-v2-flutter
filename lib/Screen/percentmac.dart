import 'package:five_level_one/Widgets/PercentMacWidgets/Tanks.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/aircraftcard.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/cargocard.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/chartc.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Backend/model.dart';

class PerMacScreen extends StatefulWidget {
  Aircraft air;

  PerMacScreen(this.air);
  @override
  _PerMacScreenState createState() => _PerMacScreenState();
}

class _PerMacScreenState extends State<PerMacScreen>
    with AutomaticKeepAliveClientMixin<PerMacScreen> {
  @override
  bool get wantKeepAlive => true;

  final sc = ScrollController();
  TanksCard tankCard;
  ChartCRow chartcCard;
  CargoCard cargoCard;

  @override
  void initState() {
    tankCard = TanksCard(this.widget.air);
    chartcCard = ChartCRow(this.widget.air);
    cargoCard = CargoCard(this.widget.air);
    super.initState();
  }

  bool validate() {
    bool ret = true;
    if (!tankCard.valid) {
      ret = false;
    }
    if (!chartcCard.valid) {
      ret = false;
      SnackBar(
        content: Text('Invalid Chart C'),
      );
    }
    //cargo card goes here
    return ret;
  }

  getMac() {
    if (validate()) {
      var nwf = List<NameWeightFS>();
      nwf.addAll(tankCard.getNameWeightFS());
      nwf.addAll(chartcCard.getNameWeightFS());
      print(nwf);
      SnackBar(
        content:Text( 
          NameWeightFS.getPerMac(
            this.widget.air.lemac, this.widget.air.mac, nwf)
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
        isAlwaysShown: true,
        controller: sc,
        child: SingleChildScrollView(
          controller: sc,
          child: Column(children: [
            aircraftCard(this.widget.air.name),
            tankCard,
            chartcCard,
            cargoCard,
            CustomButton('get mac', onPressed: () {
              getMac();
          }),
        ])));
  }
}
