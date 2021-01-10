import '../../widgets/display/rowCenterTest.dart';
import '../../widgets/layout/cards/ccard.dart';
import '../../backend/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlossaryScreen extends StatelessWidget {
  final Aircraft air;
  final List<Widget> cards = [];
  final sc = ScrollController();
  GlossaryScreen(this.air) {
    getGlossCards();
  }

  void getGlossCards() {
    cards.clear();
    
    for (int i = 0; i < air.titles.length; i++) {
      cards.add(CCards(
          air.titles.elementAt(i), RowCenterText(air.bodys.elementAt(i))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
        isAlwaysShown: true,
        controller: sc,
        child: ListView.builder(
            controller: sc, //ony render on screen widgets-recycle viewer
            itemCount: cards.length,
            itemBuilder: (BuildContext context, int index) {
              return cards[index];
            }));
  }
}
