import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../screens/percentMac/validatedCargoUI.dart';
import '../../widgets/display/text.dart';
import '../../widgets/display/titleText.dart';
import '../../widgets/input/buttonModalSpinnerButton.dart';
import '../../widgets/layout/cards/cardAllwaysOpenTex.dart';
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

  final titleText = TitleText(
    'Cargo',
    initValid: true,
  );

  ///notify permac screen of validation id=1
  final NotifyCargoValid onValidationChange;

  ///list that contains active NWFS ids
  final List<int> importedConfigIDs = [];

  ///key is NWFS.id, value is CargoUI
  final cargo = LinkedHashMap<int, ValidatedCargoUI>();

  //key is nwfs.id, value is bool of validated cargo ui
  final cargoIsValid = HashMap<int, bool>();

  ///this.cargo.values.toListOfWidgets
  final List<Widget> cargoList = [];

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
  ButtomSpinnerModalButton configSpin;
  NameWeightFS selectedSpinnerCargo;
  ///modal spinner that changes this.selectedSpinnerCargo
  ButtomSpinnerModalButton cargoSpin;
  Config selectedSpinnerConfig;
  ButtomSpinnerModalButton removeAllSpin;

  @override
  initState() {
    super.initState();
    this.widget.onValidationChange(1, valid);
    selectedSpinnerConfig = this.widget.air.configs[0];
    configSpin = ButtomSpinnerModalButton(
      stringList: _getConfigStrings(),
      modalButtonText: 'Update Config',
      onPress: updateConfig,
      onSpin: configChange,
    );

    selectedSpinnerCargo = this.widget.air.addaCargo[0];
    cargoSpin = ButtomSpinnerModalButton(
      stringList: _getCargoStrings(),
      modalButtonText: 'Add Cargo',
      onSpin: cargoChange,
      onPress: addCargo,
    );

    removeAllSpin = ButtomSpinnerModalButton(
      stringList: ['Are You Sure?'],
      modalButtonText: 'Yes!',
      onSpin: (_) {},
      onPress: removeAll,
    );
  }

  ///passed to the onValidChangelistener of validatedCargoUI
  ///takes nwfs.id as key to modifiy valid of cargo is valid
  void cargoUIValidationChanged(int nwfID, bool valid) {
    this.widget.cargoIsValid[nwfID] = valid;
    checkValidation();
  }

  void checkValidation() {
    var ret = true;
    this.widget.cargoIsValid.forEach((key, value) {
      if (value == false || value == null) {
        ret = false;
      }
    });
    valid = ret;
    print('cargo ' + ret.toString());
    //call back to nofiy permacscreen goes here
    this.widget.onValidationChange(1, ret);
    if (this.widget.titleText != null && this.widget.titleText.state != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        this.widget.titleText.state.setValid(ret);
      });
    }
  }

  ///pass to config spinner
  void configChange(int indexOfNewConfig) {
    selectedSpinnerConfig = this.widget.air.configs[indexOfNewConfig];
  }

  ///pass to cargo spiiner
  void cargoChange(int indexOfNewCargo) {
    selectedSpinnerCargo =
        this.widget.air.addaCargo[indexOfNewCargo];
  }

  ///build and return a list of strings containing the name of
  ///each config in aircraft, then pass to config spin
  List<String> _getConfigStrings() {
    List<String> ret = [];
    for (int i = 0; i < this.widget.air.configs.length; i++) {
      ret.add(this.widget.air.configs[i].name);
    }
    return ret;
  }

  ///build and return a list of strings containing the
  ///name of each nwfs in aircraft, then pass to cargospinn
  List<String> _getCargoStrings() {
    List<String> ret = [];
    for (int i = 0; i < this.widget.air.addaCargo.length; i++) {
      ret.add(this.widget.air.addaCargo[i].name);
    }
    return ret;
  }

  ///passed to onPressed of CargoUI
  ///@id NWFS.id as key to this.widget.cargo
  ///removes CargoUI from this.widget.cargo, then try to remove from configID
  void removeCargoID(int id) {
    //print('removing '+this.widget.cargo[id].nwf.toString());
    this.widget.cargo.remove(id);
    this.widget.importedConfigIDs.remove(id);
    this.widget.cargoIsValid.remove(id);
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

      ValidatedCargoUI newCargoUI = ValidatedCargoUI.fromAddA(
        key: UniqueKey(),
        fs0: this.widget.air.fs0,
        fs1: this.widget.air.fs1,
        cargomaxweight: this.widget.air.cargomaxweight,
        onPressed: removeCargoID,
        nwf: newNWFS,
        notifyValid: cargoUIValidationChanged,
      );

      this.widget.cargo[newCargoUI.nwf.id] = newCargoUI;
      this.widget.importedConfigIDs.add(newCargoUI.nwf.id);
      //print('Importing to cargo & importedConfigID '+newCargoUI.nwf.toString());
    }
    checkValidation();
    setState(() {});
  }

  ///for each id in this.widget.configIDs, remove from this.widget.cargo,
  ///then clear this.widget.configIDs, and setState
  void removeConfig() {
    for (int id in this.widget.importedConfigIDs) {
      //dont call to string right here because nwf may be invlaid
      this.widget.cargo.remove(id);
      this.widget.cargoIsValid.remove(id);
    }
    checkValidation();
    this.widget.importedConfigIDs.clear();
    setState(() {});
  }

  ///clear cargo & importedConfigIds, then set state
  void removeAll() {
    this.widget.cargo.clear();
    this.widget.importedConfigIDs.clear();
    this.widget.cargoIsValid.clear();
    checkValidation();
    setState(() {});
  }

  ///call each build to update cargolist for
  ///with all cargo.vaues
  void getCargo() {
    this.widget.cargoList.clear();
    this.widget.cargo.forEach((key, value) {
      this.widget.cargoList.add(value);
    });
  }

  void printCargo() {
    this.widget.cargo.forEach((key, value) {
      print(value.nwf.toString());
    });
  }

  void addCargo() {
    var newCargoUI = ValidatedCargoUI.fromAddA(
      fs0: this.widget.air.fs0,
      fs1: this.widget.air.fs1,
      cargomaxweight: this.widget.air.cargomaxweight,
      onPressed: removeCargoID,
      nwf: NameWeightFS.copyNewID(selectedSpinnerCargo),
      key: UniqueKey(),
      notifyValid: cargoUIValidationChanged,
    );

    this.widget.cargo[newCargoUI.nwf.id] = newCargoUI;
    checkValidation();
    //print('Adding cargo '+newCargoUI.nwf.toString());
    setState(() {});
  }

  Widget build(BuildContext context) {
    checkValidation();
    getCargo(); //call me every build
    printCargo();
    return CardAllwaysOpenTex(
        this.widget.titleText,
        Column(children: <Widget>[
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
              itemCount: this.widget.cargoList.length,
              itemBuilder: (BuildContext context, int i) {
                return this.widget.cargoList[i];
              }),
        ]));
  }
}
