import 'package:five_level_one/Widgets/PercentMacWidgets/Tanks.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/aircraftcard.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/cargo.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/cargocard.dart';
import 'package:five_level_one/Widgets/PercentMacWidgets/chartc.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Backend/model.dart';

class PerMacScreen extends StatefulWidget {
  Aircraft air;

  PerMacScreen(this.air);
  @override
  _PerMacScreenState createState() => _PerMacScreenState();
}

class _PerMacScreenState extends State<PerMacScreen>
    with AutomaticKeepAliveClientMixin<PerMacScreen> {
  ///
  @override
  bool get wantKeepAlive => true;

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
      Fluttertoast.showToast(
        msg: 'Invalid Chart C',
        timeInSecForIosWeb: 3,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        webPosition: "center",
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
      Fluttertoast.showToast(
        msg: NameWeightFS.getPerMac(
            this.widget.air.lemac, this.widget.air.mac, nwf),
        timeInSecForIosWeb: 3,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        webPosition: "center",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      aircraftCard(this.widget.air.name),
      tankCard,
      chartcCard,
      cargoCard,
      CustomButton('get mac', onPressed: () {
        getMac();
      }),
    ]);
  }
}
