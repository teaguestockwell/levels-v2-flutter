import 'dart:collection';
import 'package:five_level_one/screens/glossary/glossary.dart';
import 'package:five_level_one/screens/percentMac/percentmac.dart';
import 'package:five_level_one/screens/units/units.dart';
import 'package:five_level_one/widgets/layout/div.dart';
import '../../widgets/input/buttonModalSpinner.dart';
import 'bottomnav.dart';
import 'loading.dart';
import '../../backend/cont.dart';
import '../../widgets/display/rowCenterText.dart';
import '../../widgets/input/customButton.dart';
import '../../widgets/input/moreOpModal.dart';
import '../../widgets/layout/cards/cardAllwaysOpen.dart';
import '../../widgets/layout/rows/row2.dart';
import '../../backend/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ButtonModalSpinner airSpin;
  MoreOp moreOp;
  BottomNav bn;
  List<Aircraft> airs = [];
  var airPages = LinkedHashMap<int, List<Widget>>();
  List<String> airNames;
  Widget body = Loading();
  Image img;
  final sc = ScrollController();

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    //execute this function once after first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Firebase.initializeApp().then((_) {
        img = Image.asset('assets/0.png');
        precacheImage(img.image, context).then((_) {
          FirebaseFirestore.instance
              .collection('mds')
              .get()
              .then(buildAircraft);
        });
      });
    });
  }

  void buildAircraft(QuerySnapshot qs) {
    qs.docs.forEach((v) {
      airs.add(Aircraft(
          name: v.get('name'),
          fs0: v.get('fs0'),
          fs1: v.get('fs1'),
          mom0: v.get('mom0'),
          mom1: v.get('mom1'),
          weight0: v.get('weight0'),
          weight1: v.get('weight1'),
          simplemom: v.get('simplemom'),
          lemac: v.get('lemac'),
          mac: v.get('mac'),
          cargomaxweight: v.get('cargomaxweight'),
          tanknames: v.get('tanknames'),
          tankmoms: v.get('tankmoms'),
          tankweights: v.get('tankweights'),
          titles: v.get('titles'),
          bodys: v.get('bodys'),
          cargonames: v.get('cargonames'),
          cargoweights: v.get('cargoweights'),
          cargomoms: v.get('cargomoms'),
          configstrings: v.get('configs')));
    });

    for (int i = 0; i < airs.length; i++) {
      airPages[i] = [Units(), PerMacScreen(airs[i]), GlossaryScreen(airs[i])];
    }

    airNames = List.generate(airs.length, (i) => airs[i].name);

    getDislaimerDoc();
  }

  void getDislaimerDoc() {
    FirebaseFirestore.instance
        .collection('general')
        .doc('general')
        .get()
        .then(buildDiclaimer);
  }

  void buildDiclaimer(DocumentSnapshot ds) {
    moreOp = MoreOp(name: ds['name'], url: ds['url'], icon: ds['icon']);
    bn = BottomNav(airPages, moreOp, airNames);

    var ret = CupertinoScrollbar(
        isAlwaysShown: true,
        controller: sc,
        child: ListView(controller: sc, children: [
          CardAllwaysOpen(
              title: 'FIVE LEVEL', children: [img], color: Const.textColor),
          CardAllwaysOpen(
            title: ds.get('welcometitle'),
            color: Const.textColor,
            children: [
              RowCenterText(ds.get('welcomebody')),
              Div(),
              Row2(
                CustomButton('I Accept', onPressed: accept),
                MoreOpModal(moreOp),
              )
            ],
          ),
        ]));
    setState(() {
      body = ret;
    });
  }

  List<String> getMDSNames() {
    List<String> ret = [];
    airs.forEach((air) {
      ret.add(air.name);
    });
    return ret;
  }

  void accept() {
    setState(() {
      body = bn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body, backgroundColor: Const.background);
  }
}
