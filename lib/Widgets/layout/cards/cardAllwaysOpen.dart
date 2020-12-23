

import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:flutter/material.dart';
import '../alignPadding.dart';
import '../max.dart';



class CardAllwaysOpen extends StatelessWidget {
  Widget chil;
  final String title;
  CardAllwaysOpen(this.title, this.chil){
    //wraps first and last widets in padding.
    if(chil is Column){
      Column childp = chil;
      if(childp.children.length > 1){
        Widget first = childp.children.first;
        Widget last = childp.children.last;
        childp.children.removeAt(0);
        childp.children.removeAt(childp.children.length-1);
        var firstP = Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0), child: first);
        var lastP = Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),child: last,);
        childp.children.insert(0, firstP);
        childp.children.insert(childp.children.length, lastP);
        chil =childp;
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Max(w:Const.maxCardWidth,child:Padding(
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
                      child: AlignPadding(3.0, Alignment.center, Tex(title, fontWeight: FontWeight.normal,)),
                    ),
                    chil
                  ],
                )))));
  }
}
