import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/backend/model.dart';
import 'package:five_level_one/screens/glossary/glossary.dart';
import 'package:five_level_one/screens/percentMac/percentmac.dart';
import 'package:five_level_one/screens/units/units.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final Aircraft air;
  var tabPages =List<Widget>();
  BottomNav(this.air){
    tabPages.add(Units());
    tabPages.add(PerMacScreen(air));
    tabPages.add(GlossaryScreen(air));
  }

  @override
  _BottomNavState createState() => new _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _pageIndex = 0;
  PageController _pageController;
  var titleArr = ['Units', 'MAC%', 'Glossary'];

  @override
  void initState() {
    _pageController = PageController(initialPage: _pageIndex);
    super.initState();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: Const.animationDuration), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Const.background,
          appBar: AppBar(
            backgroundColor: Const.bottombarcolor,
            title: Tex(titleArr[_pageIndex]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: _pageIndex,
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
            children: this.widget.tabPages,
            onPageChanged: onPageChanged,
            controller: _pageController,
          ),
        ));
  }
}
