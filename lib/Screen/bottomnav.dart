import 'package:five_level_one/Backend/cont.dart';
import 'package:five_level_one/Backend/model.dart';
import 'package:five_level_one/Screen/glossary.dart';
import 'package:five_level_one/Screen/percentmac.dart';
import 'package:five_level_one/Screen/units.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final Aircraft air;
  BottomNav(this.air);

  @override
  _BottomNavState createState() => new _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _pageIndex = 0;
  PageController _pageController;
  var tabPages = List<Widget>();
  var titleArr = ['Units', '%MAC', 'Glossary'];

  @override
  void initState() {
    initTabPages();
    _pageController = PageController(initialPage: _pageIndex);
    super.initState();
  }

  void initTabPages() {
    tabPages.add(Units());
    tabPages.add(PerMacScreen(this.widget.air));
    tabPages.add(GlossaryScreen(this.widget.air));
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
            title: Text(titleArr[_pageIndex]),
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
                label: '%MAC',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Glossary',
              ),
            ],
          ),
          body: PageView(
            children: tabPages,
            onPageChanged: onPageChanged,
            controller: _pageController,
          ),
        ));
  }
}
