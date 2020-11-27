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
    this.widget.selected = this.widget.air.configs[0];
    this.widget.configSpin = CustomButtomSpinnerModalString(_getConfigStrings(), onPressed: configChange,);
    super.initState();
  }

  void configChange(int i){
    this.widget.selected = this.widget.air.configs[i];
  }

  List<String> _getConfigStrings() {
    var ret = List<String>();
    for (int i = 0; i < this.widget.air.configs.length; i++) {
      ret.add(this.widget.air.configs[i].name);
    }
    return ret;
  }

  void removeCargoID(int id) {
    this.widget.cargo.remove(id);
    print('removing '+id.toString());
    setState(() {});
  }

  void addConfig() {
    print('Updating ' + this.widget.selected.name + ' to contain: ');
    removeConfig();
    for (NameWeightFS x in this.widget.selected.nwfList) {
      var y = NameWeightFS(name:x.name, weight: x.weight, fs: x.fs, mom: x.mom,simplemom: x.simplemom, qty: x.qty);
        this.widget.cargo[y.id] = CargoUI(
        this.widget.air.fs0,
        this.widget.air.fs1,
        this.widget.air.weight1,
        this.widget.air.simplemom,
        onPressed: removeCargoID,
        nwf: y,
      );
      this.widget.configIndexes.add(y.id);
    }
    this.widget.configIndexes.forEach((element) {print(element.toString());});
    setState(() {});
  }

  void removeConfig() {
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
