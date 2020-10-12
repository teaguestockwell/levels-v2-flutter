import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets.dart';

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

class CustomButton extends StatelessWidget {
  final String text;
  final IntCallBack onPressed;
  CustomButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        child: FlatButton(
          onPressed: () {
            onPressed();
          },
          child: Text(this.text),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.white38),
          ),
        ));
  }
}

class Icon extends StatefulWidget {
  final Icon ico;
  final Alignment alin;
  Icon(this.ico, this.alin);
  @override
  _IconState createState() => _IconState();
}

class _IconState extends State<Icon> {
  @override
  Widget build(BuildContext context) {
    return AlignPadding(
        10,
        this.widget.alin,
        IconButton(
          onPressed: null,
          icon: this.widget.ico,
        ));
  }
}

//stless
class RowCenter extends StatelessWidget {
  final Widget w;
  RowCenter(this.w);

  @override
  Widget build(BuildContext context) {
    return AlignPadding(10.0, Alignment.center, this.w);
  }
}

class RowCenterText extends StatelessWidget {
  final String w;

  RowCenterText(this.w);

  @override
  Widget build(BuildContext context) {
    return AlignPadding(
        10.0,
        Alignment.center,
        SelectableLinkify(
          text: w,
          options: LinkifyOptions(humanize: false),
          onOpen: (link) async {
            if (await canLaunch(link.url)) {
              await launch(link.url);
            } else {
              throw 'Could not launch $link';
            }
          },
        ));
  }
}

class RowLeftText extends StatelessWidget {
  final String w;

  RowLeftText(this.w);

  @override
  Widget build(BuildContext context) {
    return AlignPadding(10.0, Alignment.centerLeft, Text(w));
  }
}

class AlignPadding extends StatelessWidget {
  final Alignment ali;
  final double padd;
  final Widget chil;
  AlignPadding(this.padd, this.ali, this.chil);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: ali,
        child: Padding(
          padding: EdgeInsets.all(padd),
          child: chil,
        ));
  }
}

class RowTwo extends StatelessWidget {
  ///@return a row containing center, padded, and space between two param widgets
  final Widget one, two;
  RowTwo(this.one, this.two);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[this.one, Spacer(), this.two],
        ));
  }
}

class RowOneLeft extends StatelessWidget {
  final Widget one;
  RowOneLeft(this.one);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[this.one, Spacer()],
        ));
  }
}


class CustomTextField extends StatefulWidget {
  TextEditingController c;
  CustomTextField(this.c);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return //Flexible(child:
        Container(
            height: 30,
            width: 160,
            child: TextField(
              controller: this.widget.c,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white60))),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ));
    //);
  }
}
class Row2 extends StatelessWidget {
  final Widget one, two;
  double l, t, r, b;
  Row2.padding(this.l, this.t, this.r, this.b, this.one, this.two);
  Row2(this.one, this.two) {
    this.l = 0;
    this.t = 0;
    this.r = 0;
    this.b = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(l, t, r, b),
        child: Container(
            height: 30,
            margin: EdgeInsets.all(10),
            child: Column(children: [
              Spacer(),
              Row(children: [one, Spacer(), two]),
              Spacer()
            ])));
  }
}




