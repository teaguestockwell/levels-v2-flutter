import 'package:five_level_one/Widgets/PercentMacWidgets/aircraftCard.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Backend/model.dart';

class GlossaryScreen extends StatelessWidget {
  Aircraft air;
  List<Widget> cards;
  final sc = ScrollController();
  GlossaryScreen(this.air){
    this.cards = getGlossCards();
  }

  List<Widget> getGlossCards() {
    var ret = List<Widget>();
    ret.add(AircraftCard(air.name));
    for (int i = 0; i < air.titles.length; i++) {
      ret.add(CCards(air.titles.elementAt(i),
          RowCenterText(air.bodys.elementAt(i))));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      isAlwaysShown: true,
      controller: sc, 
      child:ListView.builder(
        controller: sc, //ony render on screen widgets-recycle viewer
        itemCount: cards.length,
        itemBuilder: (BuildContext context,int index){ 
            return cards[index];}
      ));
  }
}
