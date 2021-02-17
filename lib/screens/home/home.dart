import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../backend/const.dart';
import '../../backend/models/aircraft.dart';
import '../../backend/models/home_model.dart';
import '../../backend/services.dart';
import '../../screens/glossary/glossary.dart';
import '../../screens/units/units.dart';
import '../../widgets/display/row_center_text.dart';
import '../../widgets/input/custom_button.dart';
import '../../widgets/input/more_op_modal.dart';
import '../../widgets/layout/cards/card_allways_open.dart';
import '../../widgets/layout/div.dart';
import '../../widgets/layout/rows/row2.dart';
import '../percentmac/per_mac_screen.dart';
import 'bottom_navigation.dart';
import 'loading.dart';

class Home extends StatefulWidget {
  final Services services;
  Home(this.services): assert(services!=null);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BottomNav bn;
  HomeModel homeModel;
  Widget body = Loading();
  Image img = Image.asset('assets/0.png');
  bool didLoad = false;
  bool didAccept = false;
  final sc = ScrollController();

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

    //dont await precache
    await precacheImage(img.image, context);

    //pre cach should complete before home is built
    homeModel = await this.widget.services.getHomeModel();

    //state is set and disclaimer is drawn
    buildDiclaimer();

    //after airpages load, accept unlocks
    this.widget.services.getAirs().then((airs) {
      setBn(airs);
    });

  }



  void setBn(List<Aircraft> airs) {
    var ap = LinkedHashMap<int, List<Widget>>();

    //build air pages
    for (int i = 0; i < airs.length; i++) {
      ap[i] = [Units(), PerMacScreen(airs[i]), GlossaryScreen(airs[i].glossarys)];
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

  void buildDiclaimer() {
    var ret = Scaffold(
      key:Key('home'),
        backgroundColor: Const.background,
        body: CupertinoScrollbar(
            isAlwaysShown: true,
            controller: sc,
            child: SingleChildScrollView( //wrapper to prevent jitters
            controller: sc,
            child:Column(children: [
              CardAllwaysOpen(
                  title: 'FIVE LEVEL', children: [Center(child: Container(width: 500, height: 500, child: img))], color: Const.textColor),
              CardAllwaysOpen(
                  title: homeModel.welcome.title,
                  color: Const.textColor,
                  children: [
                    RowCenterText(homeModel.welcome.body),
                    Div(),
                    Row2(CustomButton('I Accept', onPressed: accept),
                        MoreOpModal(homeModel.moreop))
                  ])
            ]))));

    setState(() {
      body = ret;
    });
  }

  void accept() {
    if (didLoad) {
      setState(() {body = bn;});

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
