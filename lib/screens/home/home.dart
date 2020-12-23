import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/widgets/display/rowCenterTest.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:five_level_one/widgets/input/buttonModalSpinner.dart';
import 'package:five_level_one/widgets/input/customButton.dart';
import 'package:five_level_one/widgets/layout/cards/cardAllwaysOpen.dart';
import 'package:five_level_one/widgets/layout/rows/row2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../backend/model.dart';
import 'bottomnav.dart';
import 'loading.dart';

class Home extends StatefulWidget {
  var aircrafts = List<Aircraft>();
  CustomButtomSpinnerModalString airSpin;
  BottomNav bn;
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget body = Loading();

  @override
  void initState() {
   super.initState();

   this.widget.aircrafts.clear();
   
    WidgetsBinding.instance
    .addPostFrameCallback((_){ Firebase.initializeApp().then((_){
        //execute this function once after first build
      Firebase.initializeApp().then((_) {
        FirebaseFirestore.instance.collection('mds').get().then(buildAircraft);
      });
    });});
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
          v.get('cargomaxweight'),
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: body,
        backgroundColor: Const.background
      )
    );
  }
}

