import 'package:five_level_one/Widgets/PercentMacWidgets/aircraftCard.dart';
import 'package:five_level_one/Widgets/UIWidgets/Cards.dart';
import 'package:five_level_one/Widgets/UIWidgets/Rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Backend/model.dart';

class GlossaryScreen extends StatefulWidget {
  Aircraft air;
  List<Widget> cards;
  GlossaryScreen(this.air);
  @override
  _GlossaryScreenState createState() => _GlossaryScreenState();
}

class _GlossaryScreenState extends State<GlossaryScreen> {
  initState(){
    this.widget.cards = getGlossCards();
    super.initState();
  }

  List<Widget> getGlossCards() {
    var ret = List<Widget>();
    ret.add(aircraftCard(this.widget.air.name));
    for (int i = 0; i < this.widget.air.titles.length; i++) {
      ret.add(CCards.C(this.widget.air.titles.elementAt(i),
          RowCenterText(this.widget.air.bodys.elementAt(i))));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder( //ony render on screen widgets-recycle viewer
      itemCount: this.widget.cards.length,
      itemBuilder: (BuildContext context,int index){ 
          return this.widget.cards[index];}
    );
  }
}
