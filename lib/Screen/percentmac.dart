import 'dart:collection';

import 'package:five_level_one/Widgets/PercentMacWidgets/Tanks.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/aircraftCard.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/cargocard.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/chartcCard.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Backend/model.dart';

class PerMacScreen extends StatefulWidget {
  Aircraft air;
  TanksCard tankCard;
  ChartCCard chartcCard;
  CargoCard cargoCard;
  AircraftCard aircraftCard;
  bool valid;
  var childValid = LinkedHashMap<int,bool>();

  ///passed as a callback to chartc and cargo
  ///tanks are allways valid
  void validateChild(int id, bool valid){
    childValid[id] = valid;
    checkValidation();
  }

  ///checks child validations updates this.valid
  void checkValidation(){
    var ret = true;
    childValid.forEach((_,childValid) {
      if(!childValid){ret = false;}
     });
   valid = ret;
   print('permac '+valid.toString());
  }

  PerMacScreen(this.air){
    aircraftCard = AircraftCard(air.name);
    tankCard = TanksCard(air);
    chartcCard = ChartCCard(this.air);
    cargoCard = CargoCard(air,validateChild);
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
    if (!this.widget.chartcCard.getValid()) {
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
      nwf.add(this.widget.chartcCard.getNWFS());
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
