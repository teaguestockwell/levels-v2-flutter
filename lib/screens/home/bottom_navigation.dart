import 'dart:collection';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../models/nested/general.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/leading_mds.dart';
import '../../widgets/input/more_op_popup.dart';

class BottomNav extends StatefulWidget {
  final LinkedHashMap<int, List<Widget>> tabPages;
  final General general;
  final List<String> airNames;
  BottomNav(
      {@required this.tabPages, @required this.general, @required this.airNames})
      : assert(tabPages != null),
        assert(general != null),
        assert(airNames != null);

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int pageIndex = 1;
  PageController pc;
  General airSelector;
  int airIdx = 0;
  final bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();

    airSelector = General.forPopupModal(
      icondatas: null,
      names: List.generate(this.widget.airNames.length, (i) => this.widget.airNames[i]),
      urls: null,
    );
  }

  @override
  void dispose() {
    pc.dispose();
    super.dispose();
  }

  void pcAnimate(int i) {
    pc.animateToPage(i,
        duration: const Duration(milliseconds: animationDuration),
        curve: Curves.easeInOut);
  }

  void onTabTapped(int i) {
    setState(() {
      pageIndex = i;
      pcAnimate(i);
    });
  }

  void airChange(int newAir) {
    setState(() {
      airIdx = newAir;
      pageIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pc != null) {
      pc.dispose();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pcAnimate(pageIndex);
    });

    /// apx 1270 is the cutoff width for desktop view
    if (MediaQuery.of(context).size.width / maxCardWidth > 1.8) {
      pc = PageController(initialPage: 1, viewportFraction: .33);
      pageIndex = 1;
      return Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            backgroundColor: bottombarcolor,
            title: Tex('Five Level'),
            actions: [MoreOpPopup(this.widget.general)],
            leadingWidth: pickerWidth,
            leading: LeadingMDS(
              general: airSelector,
              text: this.widget.airNames[airIdx],
              onPressed: airChange,
            ),
          ),
          body: PageStorage(
          bucket: bucket,
          //key: UniqueKey(),
          child:PageView(
              //key: UniqueKey(),
              physics: NeverScrollableScrollPhysics(),
              children: this.widget.tabPages[airIdx],
              controller: pc)));
    } else {
      pc = PageController(initialPage: pageIndex, viewportFraction: 1);

      return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: bottombarcolor,
          title: Tex(['Units', 'MAC%', 'Glossary'].elementAt(pageIndex)),
          actions: [MoreOpPopup(this.widget.general)],
          leadingWidth: pickerWidth,
          leading: LeadingMDS(
            general: airSelector,
            text: this.widget.airNames[airIdx],
            onPressed: airChange,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: pageIndex,
          onTap: onTabTapped,
          backgroundColor: bottombarcolor,
          selectedItemColor: navBarSelected,
          unselectedItemColor: navBarDeselected,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Units',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flight_land),
              label: 'MAC%',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Glossary',
            ),
          ],
        ),
        body: PageStorage(
          bucket: bucket,
          //key: UniqueKey(),
          child:PageView(
            //key: UniqueKey(),
            physics: NeverScrollableScrollPhysics(),
            children: this.widget.tabPages[airIdx],
            controller: pc),
      ));
    }
  }
}
