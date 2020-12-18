import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:flutter/material.dart';

import '../alignPadding.dart';
import '../max.dart';

class CCards extends StatefulWidget {
  final String title;
  Widget child;
  bool open;

  ///starts open
  CCards(this.title, this.child) {
    this.open = true;
    addPadding();
  }
  //starts closed
  CCards.C(this.title, this.child) {
    this.open = false;
    addPadding();
  }

void addPadding(){
  //wraps first and last widets in padding.
  if(child is Column){
    Column childp = child;
    if(childp.children.length > 1){
      Widget first = childp.children.first;
      Widget last = childp.children.last;
      childp.children.removeAt(0);
      childp.children.removeAt(childp.children.length-1);
      var firstP = Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0), child: first);
      var lastP = Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),child: last,);
      childp.children.insert(0, firstP);
      childp.children.insert(childp.children.length, lastP);
      child =childp;
    }
  }
}

  @override
  _CCardsState createState() => _CCardsState();
}

class _CCardsState extends State<CCards> {
  bool ope;
  Widget chil;

  @override
  void initState() {
    ope = this.widget.open;
    if (ope) {
      chil = this.widget.child;
    } else {
      chil = Container();
    }
    super.initState();
  }

  void toggleChild() {
    ope = !ope;
    setState(() {
      if (ope) {
        chil = this.widget.child;
      } else {
        chil = Container();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Max(
      w: Const.maxCardWidth,
      child:Padding(
        padding: EdgeInsets.fromLTRB(
          Const.cardP,
          Const.cardP,
          Const.cardP,
          0.0
          ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(
                color: Const.cardColor,
                shape: Border(
                    top: BorderSide(
                  color: Const.cardColor,
                  width: 22,
                )),
                child: Column(
                  children: [
                    InkWell(
                        child: AlignPadding(
                            3.0, Alignment.center, Tex(this.widget.title,fontWeight: FontWeight.normal,)),
                        onTap: toggleChild),
                    chil
                  ],
                )))));
  }
}