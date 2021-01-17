import 'dart:collection';
import 'package:five_level_one/backend/services.dart';
import 'package:five_level_one/screens/glossary/glossary.dart';
import 'package:five_level_one/screens/percentMac/percentmac.dart';
import 'package:five_level_one/screens/units/units.dart';
import 'package:five_level_one/widgets/layout/div.dart';
import 'bottomnav.dart';
import 'loading.dart';
import '../../backend/cont.dart';
import '../../widgets/display/rowCenterText.dart';
import '../../widgets/input/customButton.dart';
import '../../widgets/input/moreOpModal.dart';
import '../../widgets/layout/cards/cardAllwaysOpen.dart';
import '../../widgets/layout/rows/row2.dart';
import '../../backend/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BottomNav bn;
  HomeModel homeModel;
  Widget body = Loading();
  Image img = Image.asset('assets/0.png');
  final sc = ScrollController();
  bool didLoad = false;
  bool didAccept = false;

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      afterFirstBuild();
    });
  }

  void afterFirstBuild() async {
    await Firebase.initializeApp();

    //dont await precache
    precacheImage(img.image, context);

    //pre cach should complete before home is built
    homeModel = await getHomeModel();

    //state is set and disclaimer is drawn
    buildDiclaimer(homeModel);

    //after airpages load, accept unlocks
    getAirs().then((airs) {
      setBn(airs);
    });
  }

  void setBn(List<Aircraft> airs) {
    var ap = LinkedHashMap<int, List<Widget>>();

    //build air pages
    for (int i = 0; i < airs.length; i++) {
      ap[i] = [Units(), PerMacScreen(airs[i]), GlossaryScreen(airs[i])];
    }

    //set bn bar
    bn = BottomNav(
        tabPages: ap,
        moreOp: homeModel.moreop,
        airNames: List.generate(airs.length, (i) => airs[i].name));
    
    //set did load to unlock accept button
    didLoad = true;

    //if user clicked accept before ap were done building set state
    if (didAccept) {
      setState(() {
        body = bn;
      });
    }
  }

  void setBottomNav(LinkedHashMap<int, List<Widget>> ap) {}

  void buildDiclaimer(HomeModel hm) {
    var ret = Scaffold(
        backgroundColor: Const.background,
        body: CupertinoScrollbar(
            isAlwaysShown: true,
            controller: sc,
            child: ListView(controller: sc, children: [
              CardAllwaysOpen(
                  title: 'FIVE LEVEL', children: [img], color: Const.textColor),
              CardAllwaysOpen(
                  title: hm.welcome.title,
                  color: Const.textColor,
                  children: [
                    RowCenterText(hm.welcome.body),
                    Div(),
                    Row2(CustomButton('I Accept', onPressed: accept),
                        MoreOpModal(hm.moreop))
                  ])
            ])));

    setState(() {
      body = ret;
    });
  }

  void accept() {
    if (didLoad) {
      setState(() {
        body = bn;
      });
    } else {
      setState(() {
        didAccept = true;
        body = Loading();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return body;
  }
}
