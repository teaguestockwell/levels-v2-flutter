import 'package:five_level_one/Backend/cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Uitls.dart';
import 'package:auto_size_text/auto_size_text.dart';


class Row2 extends StatelessWidget {
  final Widget one, two;
  double height;
  Row2.height(this.one,this.two,this.height);
  Row2(this.one, this.two);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height??Const.pickerHeight,
        margin: EdgeInsets.all(Const.rowInset),
        child: Center(
          child:Row(
            children:[
              one,
              Spacer(),
              two
            ]
          ),
        )
      );
  }
}

class Row3 extends StatelessWidget {
  final Widget one, two, three;
  Row3(this.one, this.two, this.three);
  @override
  Widget build(BuildContext context) {
    return Container(
            height: Const.rowHeight,
            margin: EdgeInsets.all(Const.rowInset),
            child: Center(
              child:Row(
                children: [
                  Flexible(flex: 10,child:one), 
                  Spacer(), 
                  Flexible(flex: 10,child:two), 
                  Spacer(), 
                  Flexible(flex: 10,child:three)
                ]
              ),
            )
        );
  }
}

class RowCenterOne extends StatelessWidget {
  Widget w;
  RowCenterOne(this.w);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.rowHeight,
        margin: EdgeInsets.all(Const.rowInset),
        child: Center(child: w ),
      );
  }
}

class RowCenter extends StatelessWidget {
  final Widget w;
  RowCenter(this.w);

  @override
  Widget build(BuildContext context) {
    return AlignPadding(Const.rowInset, Alignment.center, this.w);
  }
}

class RowCenterText extends StatelessWidget {
  final String w;

  RowCenterText(this.w);

  @override
  Widget build(BuildContext context) {
    return AlignPadding(
      Const.rowInset,
      Alignment.center,
      SelectableLinkify(
        showCursor: true,
        style: TextStyle(color: Const.textColor, fontSize: Const.maxTextSize/1.3),
        text: w,
        options: LinkifyOptions(humanize: false),
        onOpen: (link) async {
            if (await canLaunch(link.url)) {
              await launch(link.url);
            } else {
              throw 'Could not launch $link';
            }
        }
      )
    );
  }
}

class ConstText extends StatelessWidget {
  final String text;
  ConstText(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Const.pickerWidth,
      height: Const.pickerHeight,
      child: Center(
        child: Tex(
          this.text,
        )
      )
    );
  }
}
///AutoSizing Text
class Tex extends StatelessWidget {
  String text;
  AutoSizeGroup autoSizeGroup;
  Tex(this.text,{this.autoSizeGroup});
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxFontSize: Const.maxTextSize,
      minFontSize: Const.minTextSize,
      maxLines: 1,
      group: autoSizeGroup,
      style: TextStyle(
        color: Const.textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}