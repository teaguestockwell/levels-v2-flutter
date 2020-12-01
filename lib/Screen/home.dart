import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_level_one/Widgets/LogicWidgets/selectmds.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:five_level_one/Widgets/UIWidgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Backend/model.dart';
import 'bottomnav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget body;
  SelectMDSBody selectedMdsBody;
  Aircraft air;

  @override
  void initState() {
    body = Loading();
    //Center(child: Tex('Loading'));
    init();
    super.initState();
  }

  press() {
    body = Loading(); setState(() {
      
    });
    FirebaseFirestore.instance
    .collection('mds')
    .doc(selectedMdsBody.mdsSpin.selected)
    .get()
    .then((v) => setState(() {
          air = Aircraft(
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
          );
          body = BottomNav(air);
    }));
  }

 

  init() {
    FirebaseFirestore.instance
        .collection('general')
        .doc('general')
        .get()
        .then((value) => setState(() {
              var gen = General(value.get('allmds'), value.get('welcometitle'),
                  value.get('welcomebody'));

              selectedMdsBody = SelectMDSBody(gen.csvAllMds, onPressed: press);

              body = ListView(children: <Widget>[
                Image(image: AssetImage('assets/0.png')),
                CardAllwaysOpen(
                    gen.welcometitle, RowCenterText(gen.welcomebody)),
                selectedMdsBody,
                // CCards('Now', TimeGrid())
              ]);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: body,
          backgroundColor: Colors.black,
        ));
  }
}
