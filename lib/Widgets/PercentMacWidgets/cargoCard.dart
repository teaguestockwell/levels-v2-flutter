import 'dart:collection';
import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Backend/model.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/CargoUI.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///modalspinner to select config, buttons to
///update or delete confi, and lazy loading of 
///cargoUI
class CargoCard extends StatefulWidget {
  ///contains config info for child widgets
  final Aircraft air;

  Config selectedSpinnerConfig;
  NameWeightFS selectedSpinnerCargo;

  ///modal spinner that changes this.selectedSpinnerConfig
  CustomButtomSpinnerModalString configSpin;

  ///modal spinner that changes this.selectedSpinnerCargo
  CustomButtomSpinnerModalString cargoSpin;

  ///list that contains active NWFS ids
  var importedConfigIDs = List<int>();

  ///key is NWFS.id, value is CargoUI
  var cargo = LinkedHashMap<int, CargoUI>();

  ///this.cargo.values.toListOfWidgets
  var cargoList = List<Widget>(); 

  CargoCard(this.air);

  @override
  _CargoCardState createState() => _CargoCardState();
}

class _CargoCardState extends State<CargoCard> {

  @override
  initState() {
    this.widget.selectedSpinnerConfig = this.widget.air.configs[0];
    this.widget.configSpin = CustomButtomSpinnerModalString(
      _getConfigStrings(), 
      onPressed: configChange,
      spinIdx: 0,
      selected: this.widget.air.configs[0].name,
    );

    this.widget.selectedSpinnerCargo = this.widget.air.addaCargo[0];
    this.widget.cargoSpin = CustomButtomSpinnerModalString(
      _getCargoStrings(),
      onPressed: cargoChange,
      spinIdx: 0,
      selected: this.widget.air.addaCargo[0].name,
    );

    super.initState();
  }

  ///pass to config spinner
  void configChange(int indexOfNewConfig){
    this.widget.selectedSpinnerConfig = this.widget.air.configs[indexOfNewConfig];
  }

  ///pass to cargo spiiner
  void cargoChange(int indexOfNewCargo){
    this.widget.selectedSpinnerCargo = this.widget.air.addaCargo[indexOfNewCargo];
  }

  ///build and return a list of strings containing the name of 
  ///each config in aircraft, then pass to config spin
  List<String> _getConfigStrings() {
    var ret = List<String>();
    for (int i = 0; i < this.widget.air.configs.length; i++) {
      ret.add(this.widget.air.configs[i].name);
    }
    return ret;
  }

  ///build and return a list of strings containing the 
  ///name of each nwfs in aircraft, then pass to cargospinn
  List<String> _getCargoStrings(){
    var ret = List<String>();
    for (int i=0; i<this.widget.air.addaCargo.length; i++){
      ret.add(this.widget.air.addaCargo[i].name);
    }
    return ret;
  }
  
  ///passed to onPressed of CargoUI
  ///@id NWFS.id as key to this.widget.cargo
  ///removes CargoUI from this.widget.cargo, then try to remove from configID
  void removeCargoID(int id) {
    print('removing '+this.widget.cargo[id].nwf.toString());
    this.widget.cargo.remove(id);
    this.widget.importedConfigIDs.removeWhere((element) => element == id);
    setState(() {});
  }

  ///remove old config then add new NWFS and CargoUI for each config in selectedSpinnerConfig
  void updateConfig() {
    //before adding new config remove the old one
    removeConfig();
    for (NameWeightFS oldSelectedConfigNWFS in this.widget.selectedSpinnerConfig.nwfList){
     
      var newNWFS = NameWeightFS.copyNewID(oldSelectedConfigNWFS);
      newNWFS.name += ' '+this.widget.selectedSpinnerConfig.name;
      
      var newCargoUI = CargoUI(
        this.widget.air.fs0,
        this.widget.air.fs1,
        this.widget.air.weight1,
        this.widget.air.simplemom,
        onPressed: removeCargoID,
        nwf: newNWFS
      );
      this.widget.cargo[newCargoUI.nwf.id] = newCargoUI;
      this.widget.importedConfigIDs.add(newCargoUI.nwf.id);
      print('Importing to cargo & importedConfigID '+newCargoUI.nwf.toString());
    }
    setState(() {});
  }

  ///for each id in this.widget.configIDs, remove from this.widget.cargo,
  ///then clear this.widget.configIDs, and setState
  void removeConfig() {
    for (int id in this.widget.importedConfigIDs) {
      try {
        print('removing: '+this.widget.cargo[id].nwf.toString());
        this.widget.cargo.removeWhere((key, value) => key == id);
      } catch (Exception) {print('could not remove idx: ' + id.toString());}
    }
    this.widget.importedConfigIDs.clear();
    setState(() {});
  }

  ///clear cargo & importedConfigIds, then set state 
  void removeAll(){
    this.widget.cargo.clear();
    this.widget.importedConfigIDs.clear();
    setState(() {});
  }

  ///call each build to update cargolist for
  ///with all cargo.vaues
  void getCargo() {
    this.widget.cargoList.clear();
    this.widget.cargo.forEach((key, value){
      this.widget.cargoList.add(value);
    });
  }

  void printCargo(){
    this.widget.cargo.forEach((key, value) {print(value.nwf.toString());});
  }

  void addCargo(){
    var newCargoUI = CargoUI(
        this.widget.air.fs0,
        this.widget.air.fs1,
        this.widget.air.weight1,
        this.widget.air.simplemom,
        onPressed: removeCargoID,
        nwf: NameWeightFS.copyNewID(this.widget.selectedSpinnerCargo)
      );

    this.widget.cargo[newCargoUI.nwf.id] = newCargoUI;
    print('Adding cargo '+newCargoUI.nwf.toString());
    setState(() {});
  }

  Widget build(BuildContext context) {
    getCargo(); //call me every build
    print('building cargoCard');
    //printCargo();
    return CardAllwaysOpen(
      'Cargo',
      Column(
        children: <Widget>[

          Row2(
            Text('Select Config'),
             this.widget.configSpin
          ),

          Divider(thickness: Const.divThickness,),

          Row2(
            Text('Select Cargo'),
             this.widget.cargoSpin
             ),

          Divider(thickness: Const.divThickness,),

          Row3(
            CustomButton(
              'Update Config',
               onPressed: updateConfig
            ),
            CustomButton(
              'Add Cargo',
              onPressed: addCargo
            ),
            CustomButton(
              'Remove All',
              onPressed: removeAll
            )
          ),

          //recycle viewer goes here. Dont render CargoUI that is not on screen
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: this.widget.cargoList.length,
            itemBuilder: (BuildContext context,int i){ 
              return this.widget.cargoList[i];
            }
          ),
        ]
      )
    );
  }
}
