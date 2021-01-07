import 'dart:collection';
import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../screens/percentMac/showWork.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/getMacButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'cargoCard.dart';
import 'chartcCard.dart';
import 'tanks.dart';

class PerMacScreen extends StatefulWidget {
  Aircraft air;
  TanksCard tankCard;
  ChartCCard chartcCard;
  CargoCard cargoCard;
  bool valid;
  BuildContext context;
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
    //print(childValid.toString());
    childValid.forEach((_,childValid) {
      if(!childValid){ret = false;}
     });
   valid = ret;
  }

  getPerMac(){
    var nwfs = List<NameWeightFS>();
    if(valid){

      nwfs.add(chartcCard.getNWFS());
      nwfs.addAll(tankCard.getNameWeightFS());
      //check for no cargo
      if(cargoCard.getNWfs().length>0){
        nwfs.addAll(cargoCard.getNWfs());
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=> ShowWork(
            lemac: air.lemac,
            mac: air.mac,
            nwfs: nwfs,
          )
        )
      );

    }else{
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Const.modalPickerColor,
        content: 
        Container(
          height: Const.pickerHeight*2,
         child:Center(child: 
        Tex('Invalid Chart C / Cargo', fontWeight: FontWeight.bold,color: Const.nonfocusedErrorBoderColor,)))));
    }
  }

  PerMacScreen(this.air){
    tankCard = TanksCard(air);
    chartcCard = ChartCCard(this.air, validateChild);
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
    this.widget.context = context;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
        isAlwaysShown: true,
        controller: sc,
        child: SingleChildScrollView(
          controller: sc,
          child: Column(children: [
            this.widget.tankCard,
            this.widget.chartcCard,
            this.widget.cargoCard,
            GetMacButton('Show MAC%', onPressed: this.widget.getPerMac),
        ])));
  }
}
