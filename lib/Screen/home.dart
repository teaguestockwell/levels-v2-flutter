import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Input.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:five_level_one/Widgets/UIWidgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Backend/model.dart';
import 'bottomnav.dart';

class Home2 extends StatefulWidget {
  var aircrafts = List<Aircraft>();
  CustomButtomSpinnerModalString airSpin;
  BottomNav bn;
  
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  Widget body;

  @override
  void initState() {
   body = Loading();
   this.widget.aircrafts.clear();
   FirebaseFirestore.instance.collection('mds').get().then(buildAircraft);
   super.initState();
  }

  void buildAircraft(QuerySnapshot qs){
    qs.docs.forEach((v) { 
      this.widget.aircrafts.add(
        Aircraft(
          v.get('name'),
          v.get('fs0'),
          v.get('fs1'),
          v.get('mom0'),
          v.get('mom1'),
          v.get('weight0'),
          v.get('weight1'),
          v.get('simplemom'),
          v.get('lemac'),
          v.get('mac'),
          v.get('tanknames'),
          v.get('tankmoms'),
          v.get('tankweights'),
          v.get('titles'),
          v.get('bodys'),
          v.get('cargonames'),
          v.get('cargoweights'),
          v.get('cargomoms'),
          v.get('configs')
        )
      );
    });
    getDislaimerDoc();
  }

  void getDislaimerDoc(){
    FirebaseFirestore.instance.collection('general')
    .doc('general').get().then(buildDiclaimer);
  }

  void buildDiclaimer(DocumentSnapshot ds){

    this.widget.bn = BottomNav(this.widget.aircrafts[0]);

    this.widget.airSpin = CustomButtomSpinnerModalString(
      getMDSNames(),
      onPressed: spin
    );

    var sc = ScrollController();
    var ret = CupertinoScrollbar(isAlwaysShown: true,controller: sc, child:ListView(controller: sc, children: [
      CardAllwaysOpen('FIVE LEVEL', Image.asset('assets/0.png')),
      CardAllwaysOpen(ds.get('welcometitle'), RowCenterText(ds.get('welcomebody'))),
      CardAllwaysOpen(
        'Aircraft',
        Column(
          children: [
            Row2(Tex('MDS'), this.widget.airSpin),
            Divider(color: Const.divColor, thickness: Const.divThickness),
            Row2(
              CustomButton('I Accept',onPressed: accept),
              CustomButton('Help',onPressed: help),
            )
          ]
        )
      )
    ]));
    setState(() {body =ret;});
  }

  spin(int i){
    this.widget.bn = BottomNav(this.widget.aircrafts[i]);
  }

  List<String> getMDSNames(){
    var ret = List<String>();
    for(var a in this.widget.aircrafts){
      ret.add(a.name);
    }
    return ret;
  }

  void accept(){
    setState((){body = this.widget.bn;});
  }

  void help(){
    print('help');
  }
    
  
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: body,
        backgroundColor: Const.background
      )
    );
  }
}

