
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_level_one/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';
import "widgets.dart";
import 'uiwidgets.dart';

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
    body = Text('Loading');
    init();
    super.initState();
  }

  press() {
    FirebaseFirestore.instance
        .collection('mds')
        .doc(selectedMdsBody.selection)
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
                  v.get('tanknames'),
                  v.get('tankmoms'),
                  v.get('tankweights'),
                  v.get('titles'),
                  v.get('bodys'),
                  v.get('cargonames'),
                  v.get('cargoweights'),
                  v.get('cargomoms'));

              body = MyBottomBarDemo(air);
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
                CCards(gen.welcometitle, RowCenterText(gen.welcomebody)),
                CCards('Select MDS', selectedMdsBody),
               // CCards('Now', TimeGrid())
              ]);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          body: body,
          backgroundColor: Colors.black,
        ));
  }
}
