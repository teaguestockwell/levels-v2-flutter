import '../../screens/percentMac/tanksCard.dart';
import 'cargoCard.dart';
import 'chartcCard.dart';
import 'tanksCard.dart';
import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../screens/percentMac/showWork.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/getMacButton.dart';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PerMacScreen extends StatefulWidget {
  final Aircraft air;

  PerMacScreen(this.air);

  @override
  _PerMacScreenState createState() => _PerMacScreenState();
}

class _PerMacScreenState extends State<PerMacScreen>
    with AutomaticKeepAliveClientMixin<PerMacScreen> {
  @override
  bool get wantKeepAlive => true;

  TanksCard tanksCard;
  ChartCCard chartcCard;
  CargoCard cargoCard;
  bool valid;
  final childValid = LinkedHashMap<int, bool>();
  final sc = ScrollController();

  /// call back for tanks spiner key = tanks.id, value = nwfs
  final tanksMap = LinkedHashMap<int, NameWeightFS>();

  void tanksCallback(int tanksID, NameWeightFS fuelNWFS) {
    tanksMap[tanksID] = fuelNWFS;
    //print(tanksMap.toString());
  }

  @override
  void initState() {
    super.initState();
    tanksCard = TanksCard(air: this.widget.air, callBack: tanksCallback,);
    chartcCard = ChartCCard(this.widget.air, validateChild);
    cargoCard = CargoCard(this.widget.air, validateChild);
  }

  ///passed as a callback to chartc and cargo
  ///tanks are allways valid
  void validateChild(int id, bool valid) {
    childValid[id] = valid;
    checkValidation();
  }

  getPerMac() {
    List<NameWeightFS> nwfs = [];
    if (valid) {
      nwfs.add(chartcCard.getNWFS());
      nwfs.addAll(tanksMap.values);
      //check for no cargo
      if (cargoCard.getNWfs().length > 0) {
        nwfs.addAll(cargoCard.getNWfs());
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowWork(
                    lemac: this.widget.air.lemac,
                    mac: this.widget.air.mac,
                    nwfs: nwfs,
                  )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Const.modalPickerColor,
          content: Container(
              height: Const.pickerHeight * 2,
              child: Center(
                  child: Tex(
                'Invalid Chart C / Cargo',
                fontWeight: FontWeight.bold,
                color: Const.nonfocusedErrorBoderColor,
              )))));
    }
  }

  ///checks child validations updates this.valid
  void checkValidation() {
    var ret = true;
    ////print(childValid.toString());
    childValid.forEach((_, childValid) {
      if (!childValid) {
        ret = false;
      }
    });
    valid = ret;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoScrollbar(
        isAlwaysShown: true,
        controller: sc,
        child: SingleChildScrollView(
            controller: sc,
            child: Column(children: [
              tanksCard,
              chartcCard,
              cargoCard,
              GetMacButton('Show MAC%', onPressed: getPerMac),
            ])));
  }
}
