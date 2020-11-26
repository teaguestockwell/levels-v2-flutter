import 'dart:collection';
import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Backend/model.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/CargoUI.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CargoCard extends StatefulWidget {
  Aircraft air;
  Config selected;
  CustomButtomSpinnerModalString configSpin;
  int configSpinIdx;
  var configIndexes = List<int>();
  var cargo = LinkedHashMap<int, CargoUI>();
  var cargoList = List<Widget>();
  CargoCard(this.air);
  @override
  _CargoCardState createState() => _CargoCardState();
}

class _CargoCardState extends State<CargoCard> {
  @override
  initState() {
    //getCargo();
    this.widget.configSpinIdx = 0;
    this.widget.selected = this.widget.air.configs[0];
    this.widget.configSpin =
        CustomButtomSpinnerModalString(_getConfigStrings());
    super.initState();
  }

  List<String> _getConfigStrings() {
    var ret = List<String>();
    for (int i = 0; i < this.widget.air.configs.length; i++) {
      ret.add(this.widget.air.configs[i].name);
    }
    return ret;
  }

  //implemt button within cargo ui for this method
  void removeCargoID(int id) {
    this.widget.cargo.remove(id);
    print('removing '+id.toString());
    setState(() {});
  }

  addConfig() {
    print('Updating ' + this.widget.selected.name + ' to contain: ');
    removeConfig();
    for (NameWeightFS configCargo in this.widget.selected.nwfList) {
      this.widget.cargo[configCargo.id] = CargoUI(
        this.widget.air.fs0,
        this.widget.air.fs1,
        this.widget.air.weight1,
        this.widget.air.simplemom,
        onPressed: removeCargoID,
        nwf: configCargo,
      );
      this.widget.configIndexes.add(configCargo.id);
    }
    this.widget.configIndexes.forEach((element) {print(element.toString());});
    setState(() {});
  }

  removeConfig() {
    for (int idx in this.widget.configIndexes) {
      try {
        this.widget.cargo.removeWhere((key, value) => key == idx);
      } catch (Exception) {print('could not remove idx: ' + idx.toString());}
    }
    this.widget.configIndexes.clear();
    setState(() {});
  }

  void removeAll(){
    this.widget.cargo.clear();
    this.widget.configIndexes.clear();
    setState(() {});
  }

  void getCargo() {
    var ret = List<Widget>();
    this.widget.cargo.forEach((key, value) {
      ret.add(value);
    });
    this.widget.cargoList = ret;
  }

  void printCargo(){
    this.widget.cargo.forEach((key, value) {print(value.nwf.toString());});
  }

  Widget build(BuildContext context) {
    getCargo();
    printCargo();
    return CardAllwaysOpen(
        'Cargo',
        Column(children: <Widget>[
          Row2(Text('Select Config'), this.widget.configSpin),
          Divider(thickness: Const.divThickness,),
          Row2(
              CustomButton('Update Config', onPressed: () => {addConfig()}),
              CustomButton(
                'Remove All',
                onPressed: () => {removeAll()},
              )),
              //recycle viewer goes here. Dont render CargoUI that is not on screen
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: this.widget.cargoList.length,
                itemBuilder: (BuildContext context,int index){ 
                  return this.widget.cargoList[index];}
              ),
        ]));
  }
}
