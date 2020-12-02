import 'package:five_level_one/Widgets/PercentMacWidgets/Tanks.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/aircraftCard.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/cargocard.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/chartc.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Backend/model.dart';

class PerMacScreen extends StatefulWidget {
  Aircraft air;
  TanksCard tankCard;
  ChartCRow chartcCard;
  CargoCard cargoCard;
  AircraftCard aircraftCard;

  PerMacScreen(this.air){
    aircraftCard = AircraftCard(air.name);
    tankCard = TanksCard(air);
    chartcCard = ChartCRow(air);
    cargoCard = CargoCard(air);
  }
  @override
  _PerMacScreenState createState() => _PerMacScreenState();
}

class _PerMacScreenState extends State<PerMacScreen>
    with AutomaticKeepAliveClientMixin<PerMacScreen> {
  @override
  bool get wantKeepAlive => true;

  final sc = ScrollController();
  

  @override
  void initState() {
    
    super.initState();
  }

  bool validate() {
    bool ret = true;
    if (!this.widget.tankCard.valid) {
      ret = false;
    }
    if (!this.widget.chartcCard.valid) {
      ret = false;
      SnackBar(
        content: Tex('Invalid Chart C'),
      );
    }
    //cargo card goes here
    return ret;
  }

  getMac() {
    if (validate()) {
      var nwf = List<NameWeightFS>();
      nwf.addAll(this.widget.tankCard.getNameWeightFS());
      nwf.addAll(this.widget.chartcCard.getNameWeightFS());
      print(nwf);
      SnackBar(
        content:Tex( 
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
            this.widget.aircraftCard,
            this.widget.tankCard,
            this.widget.chartcCard,
            this.widget.cargoCard,
            CustomButton('get mac', onPressed: () {
              getMac();
          }),
        ])));
  }
}
