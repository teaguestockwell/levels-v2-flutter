import 'package:five_level_one/Backend/cont.dart';
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
  IntCallBackIntPara onPressed;
  TextEditingController tcName, tcWeight, tcFS, tcQty;

  CargoUI(this.fs0,this.fs1,this.weight1,this.simpleMom,{this.nwf, this.onPressed}){
    if(this.nwf == null){this.nwf = NameWeightFS();}
    this.nwf.simplemom = this.simpleMom;
  }

  ///caculates fs
  CargoUI.fromAddA(this.fs0,this.fs1,this.weight1,this.nwf,{this.onPressed}){this.simpleMom = this.nwf.simplemom; this.calculated = true;}
  
  @override
  _CargoUIState createState() => _CargoUIState();
}

class _CargoUIState extends State<CargoUI> {
  var tcName = TextEditingController();
  var tcWeight = TextEditingController();
  var tcFS = TextEditingController();
  var tcQty = TextEditingController();

  void removePress(){
    this.widget.onPressed(this.widget.nwf.id);
  }

  void rebuild(){setState(() {});}

  nameChange(var newName){
    if(this.widget.nwf.name == newName){return null;}
    this.widget.nwf.name=newName;  rebuild();
  }

  qtyChange(var newQty){
    if(this.widget.nwf.qty == newQty){return null;}
    this.widget.nwf.qty = newQty; rebuild();
  }

  Widget buildInput(){
    tcName.text = this.widget.nwf.name;
    tcName.selection = TextSelection.fromPosition(TextPosition(offset: tcName.text.length));
    //tcName.addListener(() {this.widget.nwf.name = tcName.text; setState((){}); ps();});

    
    tcWeight.text = this.widget.nwf.weight;
    tcWeight.addListener(() {this.widget.nwf.weight = tcWeight.text; ps();});
    
    tcFS.text = this.widget.nwf.getFS();
    tcFS.addListener(() {this.widget.nwf.fs = tcFS.text; ps();});
    
    tcQty.text = this.widget.nwf.qty;
    tcQty.selection = TextSelection.fromPosition(TextPosition(offset: tcQty.text.length));
    //tcQty.addListener(() {this.widget.nwf.qty = tcQty.text; setState((){}); ps();});

    if(this.widget.ope == false){return Container();}
      var ret = Column(children: [
      Padding(padding: EdgeInsets.fromLTRB(0,5,0,0),child:RowCenter(CustomTextFieldTextMax(tcName, nameChange))),
      Divider(thickness:Const.divThickness),
      Row2.height(Text('Weight'), CustomTextFieldNumSize(tcWeight,8),Const.pickerHeight*1.7),
      Divider(thickness:Const.divThickness),
      Row2.height(Text('Fuselage Station'), CustomTextFieldNumSize(tcFS,8),Const.pickerHeight*1.7),
      Divider(thickness:Const.divThickness),
      Row2.height(Text('Qty'), CustomTextFieldNumSize(tcQty,6,decimal: false, onChange: qtyChange),Const.pickerHeight*1.7),
      Divider(thickness: Const.divThickness),
      Padding(padding: EdgeInsets.fromLTRB(0,0,0,5),child:RowCenterOne(CustomButton('Remove',onPressed: (){this.widget.onPressed(this.widget.nwf.id);},)))
    ],);
    return ret;
  }

  ps(){
   // print(this.widget.nwf.toString());
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
        padding: EdgeInsets.all(Const.cardP),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(
                color: Const.cargoUIColor,
                shape: Border(
                    top: BorderSide(
                  color: Const.cargoUIColor,
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