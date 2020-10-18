import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'uiwidgets.dart';

class Screen4 extends StatefulWidget {
  Aircraft air;
  Screen4(this.air);
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  List<CCards> getGlossCards() {
    var ret = List<CCards>();

    ret.add(CCards(
        'About',
        RowCenterText('This glossary is specific to the ' +
            this.widget.air.name +
            '. To select a diffrent MDS, restart the application.')));

    for (int i = 0; i < this.widget.air.titles.length; i++) {
      ret.add(CCards.C(this.widget.air.titles.elementAt(i),
          RowCenterText(this.widget.air.bodys.elementAt(i))));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: getGlossCards());
  }
}
