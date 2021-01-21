import 'validatedCargoUI.dart';
import '../../widgets/layout/cards/cardAllwaysOpen.dart';
import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/buttonModalSpinnerButton.dart';
import '../../widgets/layout/rows/row2.dart';
import '../../utils.dart';
import 'dart:collection';
import 'package:flutter/material.dart';

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
  List<NameWeightFS> getNWfs() {
    List<NameWeightFS> ret = [];
    cargo.forEach((_, cargoUI) {
      ret.add(cargoUI.nwf);
    });
    return ret;
  }

  CargoCard(this.air, this.onValidationChange);

  @override
  _CargoCardState createState() => _CargoCardState();
}

class _CargoCardState extends State<CargoCard> {
  bool valid = true;

  ///modal spinner that changes this.selectedSpinnerConfig
  ButtonModalSpinnerButton configSpin;
  NameWeightFS selectedSpinnerCargo;

  ///modal spinner that changes this.selectedSpinnerCargo
  ButtonModalSpinnerButton cargoSpin;
  Config selectedSpinnerConfig;
  ButtonModalSpinnerButton removeAllSpin;

  ///list that contains active NWFS ids
  final List<int> importedConfigIDs = [];

  //key is nwfs.id, value is bool of validated cargo ui
  final cargoIsValid = HashMap<int, bool>();

  @override
  initState() {
    super.initState();

    this.widget.onValidationChange(1, valid);
    selectedSpinnerConfig = this.widget.air.configs[0];

    configSpin = ButtonModalSpinnerButton(
      stringList: List.generate(
        this.widget.air.configs.length,
         (i) => this.widget.air.configs[i].name),
      modalButtonText: 'Update Config',
      onPress: updateConfig,
      onSpin: (i) => selectedSpinnerConfig = this.widget.air.configs[i],
    );

    selectedSpinnerCargo = this.widget.air.addaCargo[0];
    cargoSpin = ButtonModalSpinnerButton(
      stringList: List.generate(this.widget.air.addaCargo.length,
       (i) => this.widget.air.addaCargo[i].name),
      modalButtonText: 'Add Cargo',
      onSpin: (i) => selectedSpinnerCargo = this.widget.air.addaCargo[i],
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
    cargoIsValid[nwfID] = valid;
    checkValidation();
  }

  void checkValidation() {
    var ret = true;

    cargoIsValid.forEach((key, value) {
      if (value == false || value == null) {
        ret = false;
      }
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
    cargoIsValid.remove(id);
    checkValidation();
    setState(() {});
  }

  ///remove old config then add new NWFS and CargoUI for each config in selectedSpinnerConfig
  void updateConfig() {
    //before adding new config remove the old one
    removeConfig();
    for (NameWeightFS oldSelectedConfigNWFS in selectedSpinnerConfig.nwfList) {
      var newNWFS = NameWeightFS.copyNewID(oldSelectedConfigNWFS);
      newNWFS.name += ' ' + selectedSpinnerConfig.name;

      var newCargoUI = ValidatedCargoUI(
        fs0: this.widget.air.fs0,
        fs1: this.widget.air.fs1,
        cargoMaxWeight: this.widget.air.cargomaxweight,
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
      cargoIsValid.remove(id);
    }
    importedConfigIDs.clear();
    checkValidation();
    setState(() {});
  }

  ///clear cargo & importedConfigIds, then set state
  void removeAll() {
    this.widget.cargo.clear();
    importedConfigIDs.clear();
    cargoIsValid.clear();
    checkValidation();
    setState(() {});
  }

  void printCargo() {
    this.widget.cargo.forEach((key, value) {
      //print(value.nwf.toString());
    });
  }

  void addCargo() {
    var newCargoUI = ValidatedCargoUI(
      fs0: this.widget.air.fs0,
      fs1: this.widget.air.fs1,
      cargoMaxWeight: this.widget.air.cargomaxweight,
      onRemovePressed: removeCargoID,
      nwf: NameWeightFS.copyNewID(selectedSpinnerCargo),
      notifyValid: cargoUIValidationChanged,
    );

    this.widget.cargo[newCargoUI.nwf.id] = newCargoUI;
    checkValidation();
    ////print('Adding cargo '+newCargoUI.nwf.toString());
    setState(() {});
  }

  Color getTitleColor() {
    if (valid) {
      return Const.nonfocusedBoderColors;
    }
    return Const.focusedErrorBorderColor;
  }

  Widget build(BuildContext context) {
    return CardAllwaysOpen(title: 'Cargo', color: getTitleColor(), children: [
      Row2(
        Tex('Select Config'),
        configSpin,
      ),

      Divider(
        color: Const.divColor,
        thickness: Const.divThickness,
      ),

      Row2(Tex('Add Cargo'), cargoSpin),

      Divider(
        color: Const.divColor,
        thickness: Const.divThickness,
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
