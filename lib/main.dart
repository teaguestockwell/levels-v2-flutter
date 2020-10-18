import 'package:firebase_core/firebase_core.dart';
import 'package:five_level_one/home.dart';
import 'package:five_level_one/model.dart';
import 'package:five_level_one/screen4.dart';
import 'package:five_level_one/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'screen0.dart';
import 'screen2.dart';
import 'screen4.dart';
import 'widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}

class MyBottomBarDemo extends StatefulWidget {
  final Aircraft air;
  MyBottomBarDemo(this.air);

  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<MyBottomBarDemo> {
  int _pageIndex = 0;
  PageController _pageController;
  var s2,s4;

  Color topBot = Colors.black87;
  Color select = Colors.white70;
  Color deselect = Colors.white30;
  Color back = Colors.black;
  Color car = Colors.white30;

  List<Widget> tabPages = [
    Screen0(),
    //Screen2(),
    //Screen3(),
  ];

  var titleArr = ['Units','%MAC','Glossary'];

  @override
  void initState() {
    s4 = Screen4(this.widget.air);
    s2 = PerMacScreen(this.widget.air);
    tabPages.add(s2);
    tabPages.add(s4);
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
          appBar: AppBar(
            backgroundColor: topBot,
            title: Text(titleArr[_pageIndex]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _pageIndex,
            onTap: onTabTapped,
            backgroundColor: topBot,
            selectedItemColor: select,
            unselectedItemColor: deselect,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm), label: 'Units',),
              BottomNavigationBarItem(
                  icon: Icon(Icons.flight_land), label: '%MAC',),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), label: 'Glossary',),
            ],
          ),
          body: PageView(
            children: tabPages,
            onPageChanged: onPageChanged,
            controller: _pageController,
          ),
        ));
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
