import 'package:five_level_one/Backend/model.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/material.dart';

import '../Uitls.dart';

class CargoUI extends StatefulWidget {/// interates the data model NameWeightFS with UI elements for input, and error checking
  var ope = false;
  var calculated = false;
  String
  fs0,
  fs1,
  weight1,
  simpleMom;
  NameWeightFS nwf;
  CargoUI(this.fs0,this.fs1,this.weight1,this.simpleMom,{this.nwf}){
    if(this.nwf == null){this.nwf = NameWeightFS();}
    this.nwf.simplemom = this.simpleMom;
  }

  ///caculates fs
  CargoUI.fromAddA(this.fs0,this.fs1,this.weight1,this.nwf){this.simpleMom = this.nwf.simplemom; this.calculated = true;}
  
  @override
  _CargoUIState createState() => _CargoUIState();
}

class _CargoUIState extends State<CargoUI> {
  var tcName = TextEditingController();
  var tcWeight = TextEditingController();
  var tcFS = TextEditingController();
  var tcQty = TextEditingController();
   

  initState(){
    tcName.text = this.widget.nwf.name;
    tcName.addListener(() {this.widget.nwf.name = tcName.text; setState((){}); ps();});
    
    tcWeight.text = this.widget.nwf.weight;
    tcWeight.addListener(() {this.widget.nwf.weight = tcWeight.text; ps();});
    
    tcFS.text = this.widget.nwf.getFS();
    tcFS.addListener(() {this.widget.nwf.fs = tcFS.text; ps();});
    
    tcQty.text = this.widget.nwf.qty;
    tcQty.addListener(() {this.widget.nwf.qty = tcQty.text; setState((){}); ps();});

    super.initState();
  }

  Widget buildInput(){
    if(this.widget.ope == false){return Container();}

    var ret = Column(children: [
      RowCenter(CustomTextFieldTextMax(tcName)),
      Row2(Text('Weight'), CustomTextField(tcWeight)),
      Row2(Text('Fuselage Station'), CustomTextField(tcFS)),
      Row2(Text('Qty'), CustomTextField(tcQty)),
    ],);
    return ret;
  }

  ps(){
    print(this.widget.nwf.toString());
  }

  toggle(){
    setState(() {
      this.widget.ope = !this.widget.ope;
    });
  }
  @override
  void dispose() {
    tcFS.dispose();
    tcName.dispose();
    tcQty.dispose();
    tcWeight.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(2,5,2,5),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(
                color: Colors.white10,
                shape: Border(
                    top: BorderSide(
                  color: Colors.white10,
                  width: 22,
                )),
                child: Column(
                  children: [
                    InkWell(
                        child: AlignPadding(
                            3.0, Alignment.center, Text(this.widget.nwf.qty +' EA '+this.widget.nwf.name)),
                        onTap: toggle,),
                    buildInput()
                  ],
                ))));
  }
}