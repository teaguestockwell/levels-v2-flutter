import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constant.dart';
import '../../models/nested/aircraft.dart';
import '../../models/nested/general.dart';
import '../../screens/glossary/glossary.dart';
import '../../screens/units/units.dart';
import '../../services/user_service.dart';
import '../../widgets/display/row_center_text.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/custom_button.dart';
import '../../widgets/input/more_op_modal.dart';
import '../../widgets/layout/card_allways_open.dart';
import '../../widgets/layout/div.dart';
import '../../widgets/layout/row2.dart';
import '../admin/side_bar.dart';
import '../percentmac/per_mac_screen.dart';
import 'bottom_navigation.dart';
import 'loading.dart';

class Home extends StatefulWidget {
  final UserService services;
  Home(this.services): assert(services!=null);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BottomNav bn;
  General general;
  Widget body = Loading();
  Image img = Image.asset('assets/0.png');
  bool didLoad = false;
  bool didAccept = false;
  final sc = ScrollController();
  String apiResponse;

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

    //pre cach should complete before general is built
    general = await this.widget.services.getGeneral();

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
        general: general,
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
        backgroundColor: background,
        body: CupertinoScrollbar(
            isAlwaysShown: true,
            controller: sc,
            child:Center(child: SingleChildScrollView( //wrapper to prevent jitters
            controller: sc,
            child:Container(
              width: maxCardWidth*.75,
              child:Column(
              children: [
              CardAllwaysOpen(
                  name: 'FIVE LEVEL', children: [Center(child: Container(width: 500, height: 500, child: img))], color: textColor),
              CardAllwaysOpen(
                  name: 'TODO: encode users name here',
                  color: textColor,
                  children: [
                    RowCenterText('instead on disclaimer, put date time of last api req, the aircraft that currently loaded for ofline, and an update button to reload models. Also make I accept a page navigation, not a setstate so user can go back an refresh models'),
                    Div(),
                    Row2(CustomButton('I Accept', onPressed: accept),
                        MoreOpModal(general))
                  ]),
                  getAdminCard()
            ]))))));

    setState(() {
      body = ret;
    });
  }

  Widget getAdminCard(){
    if(general.role > 1){
      return CardAllwaysOpen(
        name: 'Admin',
        color: textColor,
        children: [
          RowCenterText('short blurb about admin goes here with hyperlink to youtube tuts https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
          Div(),
          Row2(
            Tex('Admin Portal (Desktop Only)'),

            CustomButton(
              'Open',
              onPressed: pushAdminPortal
            ),
          )
        ]
      );
    }else{
      return Container();
    }
  }

  void pushAdminPortal(){
     Navigator.push(
      context,
      MaterialPageRoute( 
        builder: (_) => SideBar()
      )
    );
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
