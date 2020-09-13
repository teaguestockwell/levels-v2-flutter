import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screen0.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyBottomBarDemo());
}

class MyBottomBarDemo extends StatefulWidget {
  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<MyBottomBarDemo> {
  int _pageIndex = 0;
  PageController _pageController;

  Color topBot = Colors.black87;
  Color select = Colors.white70;
  Color deselect = Colors.white30;
  Color back = Colors.black;
  Color car = Colors.white30;

  List<Widget> tabPages = [
    Screen0(),
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  @override
  void initState() {
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
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: topBot,
            title: Text("BottomNavigationBar"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _pageIndex,
            onTap: onTabTapped,
            backgroundColor: topBot,
            selectedItemColor: select,
            unselectedItemColor: deselect,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm), title: Text("Time")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center), title: Text("Units")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.flight_land), title: Text("%MAC")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), title: Text("Glossary")),
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
