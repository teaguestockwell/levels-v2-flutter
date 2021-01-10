import '../alignPadding.dart';
import '../max.dart';
import '../../../backend/cont.dart';
import '../../../widgets/display/titleText.dart';
import 'package:flutter/material.dart';

class CardAllwaysOpenTex extends StatefulWidget {
  final Widget chil;
  final TitleText tex;
  CardAllwaysOpenTex({@required this.tex, @required this.chil});
  @override
  _CardAllwaysOpenTexState createState() => _CardAllwaysOpenTexState();
}

class _CardAllwaysOpenTexState extends State<CardAllwaysOpenTex> {
  Widget chil;

  @override
  void initState() {
    super.initState(); //wraps first and last widets in padding.
    if (chil is Column) {
      Column childp = chil;
      if (childp.children.length > 1) {
        Widget first = childp.children.first;
        Widget last = childp.children.last;
        childp.children.removeAt(0);
        childp.children.removeAt(childp.children.length - 1);
        var firstP =
            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0), child: first);
        var lastP = Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: last,
        );
        childp.children.insert(0, firstP);
        childp.children.insert(childp.children.length, lastP);
        chil = childp;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Max(
        w: Const.maxCardWidth,
        child: Padding(
            padding:
                EdgeInsets.fromLTRB(Const.cardP, Const.cardP, Const.cardP, 0.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Card(
                    color: Const.cardColor,
                    shape: Border(
                        top: BorderSide(
                      color: Const.cardColor,
                      width: Const.cardTabSize,
                    )),
                    child: Column(
                      children: [
                        AlignPadding(
                            3.0,
                            Alignment.center,
                            Container(
                                height: Const.cardTabSize,
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: this.widget.tex,
                                )))),
                        chil
                      ],
                    )))));
  }
}
