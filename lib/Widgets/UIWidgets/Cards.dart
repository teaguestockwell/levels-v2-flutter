import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Uitls.dart';

class CCards extends StatefulWidget {
  final String title;
  final Widget child;
  bool open;

  CCards(this.title, this.child) {
    this.open = true;
  }
  CCards.C(this.title, this.child) {
    this.open = false;
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
    return Padding(
        padding: EdgeInsets.all(2),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(
                color: Colors.white10,
                shape: Border(
                    top: BorderSide(
                  color: Colors.white10,
                  width: 22,
                )),
                child: Column(
                  children: [
                    InkWell(
                        child: AlignPadding(
                            3.0, Alignment.center, Text(this.widget.title)),
                        onTap: toggleChild),
                    chil
                  ],
                ))));
  }
}

class CardAllwaysOpen extends StatelessWidget {
  CardAllwaysOpen(this.title, this.chil);
  final Widget chil;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(
                color: Colors.white10,
                shape: Border(
                    top: BorderSide(
                  color: Colors.white10,
                  width: 22,
                )),
                child: Column(
                  children: [
                    InkWell(
                      child: AlignPadding(3.0, Alignment.center, Text(title)),
                    ),
                    chil
                  ],
                ))));
  }
}

//stless
