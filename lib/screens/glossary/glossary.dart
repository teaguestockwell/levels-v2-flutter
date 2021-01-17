import '../../widgets/display/rowCenterText.dart';
import '../../widgets/layout/cards/ccard.dart';
import '../../backend/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlossaryScreen extends StatefulWidget {
  final Aircraft air;

  GlossaryScreen(this.air): super(key: PageStorageKey(UniqueKey()));
  _GlossaryScreenState createState() => _GlossaryScreenState();
  }

class _GlossaryScreenState extends State<GlossaryScreen> {
  final sc = ScrollController();
  final List<Widget> cards = [];

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getGlossCards();
  }

  void getGlossCards() {
    cards.clear();
    for (int i = 0; i < this.widget.air.titles.length; i++) {
      cards.add(CCard(
        title: this.widget.air.titles.elementAt(i),
        children: [RowCenterText(this.widget.air.bodys.elementAt(i))],
        initOpen: true,
      ));
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
