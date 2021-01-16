import 'dart:collection';
import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/leadingMDS.dart';
import '../../widgets/input/moreOpPopup.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final LinkedHashMap<int, List<Widget>> tabPages;
  final MoreOp moreOp;
  final List<String> airNames;
  BottomNav(this.tabPages, this.moreOp, this.airNames);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;
  List<String> titleArr = ['Units', 'MAC%', 'Glossary'];
  double widthFrac;
  PageController pc;
  MoreOp airSelector;
  int airIdx = 0;

  @override
  void initState() {
    super.initState();

    print(this.widget.airNames.toString());

    airSelector = MoreOp(
        name: List.generate(this.widget.airNames.length, (i) => this.widget.airNames[i]),
        url: null,
        icon: null);
  }

  @override
  void dispose() {
    pc.dispose();
    super.dispose();
  }

  void pcAnimate(int i) {
    pc.animateToPage(i,
        duration: const Duration(milliseconds: Const.animationDuration),
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

    if (MediaQuery.of(context).size.width / Const.maxCardWidth > 1.8) {
      pc = PageController(initialPage: 0, viewportFraction: .33);
      pageIndex = 1;
      return Scaffold(
          backgroundColor: Const.background,
          appBar: AppBar(
            backgroundColor: Const.bottombarcolor,
            title: Tex('Five Level'),
            actions: [MoreOpPopup(this.widget.moreOp)],
            leadingWidth: Const.pickerWidth,
            leading: LeadingMDS(
              moreOp: airSelector,
              text: this.widget.airNames[airIdx],
              onPressed: airChange,
            ),
          ),
          body: PageView(
              key: UniqueKey(),
              physics: NeverScrollableScrollPhysics(),
              children: this.widget.tabPages[airIdx],
              controller: pc));
    } else {
      pc = PageController(initialPage: pageIndex, viewportFraction: 1);

      return Scaffold(
        backgroundColor: Const.background,
        appBar: AppBar(
          backgroundColor: Const.bottombarcolor,
          title: Tex(titleArr[pageIndex]),
          actions: [MoreOpPopup(this.widget.moreOp)],
          leadingWidth: Const.pickerWidth,
          leading: LeadingMDS(
            moreOp: airSelector,
            text: this.widget.airNames[airIdx],
            onPressed: airChange,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: pageIndex,
          onTap: onTabTapped,
          backgroundColor: Const.bottombarcolor,
          selectedItemColor: Const.navBarSelected,
          unselectedItemColor: Const.navBarDeselected,
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
        body: PageView(
            key: UniqueKey(),
            physics: NeverScrollableScrollPhysics(),
            children: this.widget.tabPages[airIdx],
            controller: pc),
      );
    }
  }
}
