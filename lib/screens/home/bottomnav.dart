import '../../backend/cont.dart';
import '../../backend/model.dart';
import '../../screens/glossary/glossary.dart';
import '../../screens/percentMac/percentmac.dart';
import '../../screens/units/units.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/leadingMDS.dart';
import '../../widgets/input/moreOpPopup.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final Aircraft air;
  final MoreOp moreOp;

  BottomNav(this.air, this.moreOp);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;
  List<Widget> tabPages;
  List<String> titleArr = ['Units', 'MAC%', 'Glossary'];
  double widthFrac;
  PageController pc;

  @override
  void initState() {
    super.initState();

    tabPages = [
      Units(),
      PerMacScreen(this.widget.air),
      GlossaryScreen(this.widget.air)
    ];
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
            title: Tex(titleArr[pageIndex]),
            actions: [MoreOpPopup(this.widget.moreOp)],
            leadingWidth: Const.pickerWidth,
            leading: LeadingMDS(
              text: this.widget.air.name,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: PageView(
              physics: NeverScrollableScrollPhysics(),
              children: tabPages,
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
            text: this.widget.air.name,
            onPressed: () {
              Navigator.pop(context);
            },
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
            physics: NeverScrollableScrollPhysics(),
            children: tabPages,
            controller: pc),
      );
    }
  }
}
