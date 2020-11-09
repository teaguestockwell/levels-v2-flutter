import 'package:five_level_one/Backend/cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Uitls.dart';

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
        // key: UniqueKey(),
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

class RowCenterOne extends StatelessWidget {
  Widget w;
  double l, t, r, b;
  RowCenterOne(
    this.w, {
    this.l = 0,
    this.t = 0,
    this.r = 0,
    this.b = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(l, t, r, b),
      child: Container(
        height: 30,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Spacer(),
            Row(
              children: [Spacer(), w, Spacer()],
            ),
            Spacer()
          ],
        ),
      ),
    );
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

class ConstText extends StatelessWidget {
  final String text;
  ConstText(this.text);
  @override
  Widget build(BuildContext context) {
    var text = Text(
                this.text,
                 textAlign: TextAlign.center
              );
    return Container(
            width: Const.pickerWidth,
            height: Const.pickerHeight,
            child: Center(
              child: Text(
                this.text,
                textAlign: TextAlign.center,
              )
             )
    );
  }
}
