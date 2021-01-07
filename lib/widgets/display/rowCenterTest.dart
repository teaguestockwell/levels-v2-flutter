import '../../backend/cont.dart';
import '../../widgets/layout/alignPadding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class RowCenterText extends StatelessWidget {
  final String w;

  RowCenterText(this.w);

  @override
  Widget build(BuildContext context) {
    return AlignPadding(
      Const.rowInset,
      Alignment.center,
      SelectableLinkify(
        cursorColor: Colors.white,
        showCursor: true,
        style: TextStyle(color: Const.textColor, fontSize: Const.textSize, fontWeight: FontWeight.normal),
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