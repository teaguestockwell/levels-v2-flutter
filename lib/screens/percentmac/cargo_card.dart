import 'dart:collection';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../models/nested/aircraft.dart';
import '../../models/nested/cargo.dart';
import '../../models/nested/config.dart';
import '../../util.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/button_modal_button.dart';
import '../../widgets/input/button_modal_spinner.dart';
import '../../widgets/input/button_modal_spinner_button.dart';
import '../../widgets/input/custom_button.dart';
import '../../widgets/layout/card_allways_open.dart';
import '../../widgets/layout/row2.dart';
import 'validated_cargo_ui.dart';

///modalspinner to select config, buttons to
///update or delete confi, and lazy loading of
///cargoUI
class CargoCard extends StatefulWidget {
  ///contains config info for child widgets
  final Aircraft air;

  ///notify permac screen of validation id=1
  final NotifyCargoValid onValidationChange;

  ///key is NWFS.id, value is CargoUI
  final cargo = LinkedHashMap<int, ValidatedCargoUI>();

  //only call this after cargoUI valid notification = true;
  List<Cargo> getNWfs() {
    List<Cargo> ret = [];
    cargo.forEach((_, cargoUI) {
      ret.add(cargoUI.nwf);
    });
    return ret;
  }

  CargoCard(this.air, this.onValidationChange);

  @override
  CargoCardState createState() => CargoCardState();
}

class CargoCardState extends State<CargoCard> {
  bool valid = true;

  ///modal spinner that changes this.selectedSpinnerConfig
  ButtonModalSpinner configSpin;
  Cargo selectedSpinnerCargo;

  ///modal spinner that changes this.selectedSpinnerCargo
  ButtonModalButton cargoSpin;
  Config selectedSpinnerConfig;
  ButtonModalSpinnerButton removeAllSpin;

  ///list that contains active NWFS ids
  final List<int> importedConfigIDs = [];

  //key is nwfs.id, value is bool of validated cargo ui
  final childrenCargoIsValidMap = HashMap<int, bool>();
  var configIdx = 0;


  @override
  initState() {
    super.initState();
    
    this.widget.onValidationChange(1, valid);
    selectedSpinnerConfig = this.widget.air.configs[0];
    selectedSpinnerCargo = this.widget.air.cargos[0];

    cargoSpin = ButtonModalButton(
      buttText: 'Add',
      stringList: List.generate(this.widget.air.cargos.length,
       (i) => this.widget.air.cargos[i].name),
      modalButtonText: 'Add Cargo',
      onPress: addCargo,
    );

    removeAllSpin = ButtonModalSpinnerButton(
      stringList: ['Are You Sure?'],
      modalButtonText: 'Yes!',
      onSpin: (_) {},
      onPress: removeAll,
    );
  }

  ///passed to the onValidChangelistener of validatedCargoUI
  ///takes nwfs.id as key to modifiy valid of cargo is valid
  void cargoUIValidationChanged(int nwfID, bool valid) {
    childrenCargoIsValidMap[nwfID] = valid;
    checkValidation();
  }

  void checkValidation() {
    
    var ret = true;
    childrenCargoIsValidMap.forEach((key, value) {
      if (!value) {ret = false;}
    });


    if (valid != ret) {
      //call back to nofiy permacscreen
    this.widget.onValidationChange(1, ret);
      setState(() {
        valid = ret;
      });
    }
  }

  ///passed to onPressed of CargoUI
  ///@id NWFS.id as key to this.widget.cargo
  ///removes CargoUI from this.widget.cargo, then try to remove from configID
  void removeCargoID(int id) {
    ////print('removing '+this.widget.cargo[id].nwf.toString());
    this.widget.cargo.remove(id);
    importedConfigIDs.remove(id);
    childrenCargoIsValidMap.remove(id);
    checkValidation();
    setState(() {});
  }

  ///remove old config then add new NWFS and CargoUI for each config in selectedSpinnerConfig
  void updateConfig(int i) {
     final selectedConfig = this.widget.air.configs[i];
    //before adding new config remove the old one
    removeConfig();
    for (Cargo oldSelectedConfigNWFS in selectedConfig.nwfList) {
      var newNWFS = Cargo.copyNewID(oldSelectedConfigNWFS);
      newNWFS.name += ' ' + selectedConfig.name;

      var newCargoUI = ValidatedCargoUI(
        fs0: this.widget.air.fs0,
        fs1: this.widget.air.fs1,
        cargoMaxWeight: this.widget.air.cargoweight1,
        onRemovePressed: removeCargoID,
        nwf: newNWFS,
        notifyValid: cargoUIValidationChanged,
      );

      this.widget.cargo[newCargoUI.nwf.id] = newCargoUI;
      importedConfigIDs.add(newCargoUI.nwf.id);
      ////print('Importing to cargo & importedConfigID '+newCargoUI.nwf.toString());
    }
    checkValidation();
    setState(() {});
  }

  ///for each id in this.widget.configIDs, remove from this.widget.cargo,
  ///then clear this.widget.configIDs, and setState
  void removeConfig() {
    for (int id in importedConfigIDs) {
      //dont call to string right here because nwf may be invlaid
      this.widget.cargo.remove(id);
      childrenCargoIsValidMap.remove(id);
    }
    importedConfigIDs.clear();
    checkValidation();
    setState(() {});
  }

  ///clear cargo & importedConfigIds, then set state
  void removeAll() {
    this.widget.cargo.clear();
    importedConfigIDs.clear();
    childrenCargoIsValidMap.clear();
    configIdx = 0;
    checkValidation();
    setState(() {});
  }

  void printCargo() {
    this.widget.cargo.forEach((key, value) {
      //print(value.nwf.toString());
    });
  }

  void addCargo(int i) {
    var newCargoUI = ValidatedCargoUI(
      fs0: this.widget.air.fs0,
      fs1: this.widget.air.fs1,
      cargoMaxWeight: this.widget.air.cargoweight1,
      onRemovePressed: removeCargoID,
      nwf: Cargo.copyNewID(this.widget.air.cargos[i]),
      notifyValid: cargoUIValidationChanged,
    );

    this.widget.cargo[newCargoUI.nwf.id] = newCargoUI;
    checkValidation();
    ////print('Adding cargo '+newCargoUI.nwf.toString());
    setState(() {});
  }

  void addEmptyCargo(){
    var newCargoUI = ValidatedCargoUI(
      fs0: this.widget.air.fs0,
      fs1: this.widget.air.fs1,
      cargoMaxWeight: this.widget.air.cargoweight1,
      onRemovePressed: removeCargoID,
      nwf: Cargo(),
      notifyValid: cargoUIValidationChanged,
    );

    this.widget.cargo[newCargoUI.nwf.id] = newCargoUI;
    checkValidation();
    ////print('Adding cargo '+newCargoUI.nwf.toString());
    setState(() {});
  }


  Widget build(BuildContext context) {
    return CardAllwaysOpen(name: 'Cargo', color: getValidColor(valid), children: [
      Row2(
        Tex('Select Config'),
        ButtonModalSpinner(
          onClose: updateConfig,
          onSpin: (i) => configIdx = i,
          initIdx: configIdx,
          stringList: List.generate(
            this.widget.air.configs.length,
            (i) => this.widget.air.configs[i].name),
        ),
      ),

      Divider(
        color: divColor,
        thickness: divThickness,
      ),

      Row2(Tex('Addenda A Cargo'), cargoSpin),

      Divider(
        color: divColor,
        thickness: divThickness,
      ),

      Row2(Text('Custom Cargo'), CustomButton('Add', onPressed:addEmptyCargo)),

      Divider(
        color: divColor,
        thickness: divThickness,
      ),

      Row2(Tex('Remove All'), removeAllSpin),

      //recycle viewer goes here. Dont render CargoUI that is not on screen
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: this.widget.cargo.length,
          itemBuilder: (BuildContext context, int i) {
            return this.widget.cargo.values.elementAt(i);
          }),
    ]);
  }
}
