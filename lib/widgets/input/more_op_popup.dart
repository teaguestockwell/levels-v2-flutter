import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../backend/const.dart';
import '../../backend/models/general.dart';
import '../../widgets/display/text.dart';

class MoreOpPopup extends StatelessWidget {
  final General general;
  MoreOpPopup(this.general)
      : assert(general != null),
        assert(general.icondatas != null),
        assert(general.names != null),
        assert(general.urls != null);

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void more(var x) {
    try {
      launchURL(general.urls[x]);
    // ignore: avoid_catches_without_on_clauses
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        //theme wrapper to remove tooltip
        data: Theme.of(context).copyWith(
            tooltipTheme: TooltipThemeData(
                decoration: BoxDecoration(color: Colors.transparent))),
        child: PopupMenuButton(
            onSelected: more,
            tooltip: '',
            color: Const.modalPickerColor,
            padding: EdgeInsets.all(Const.rowInset),

            ///three vertical dots icon
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              List<PopupMenuEntry> ret = [];
              for (int i = 0; i < general.names.length; i++) {
                String text = () {
                  if (general.names[i].length > 24) {
                    return general.names[i].substring(0, 20) + '...';
                  }
                  return general.names[i];
                }();
                
                Icon icon = Icon(IconData(59362, fontFamily: 'MaterialIcons'));
                try {
                  icon =  Icon(IconData(general.icondatas[i],fontFamily: 'MaterialIcons'));
                // ignore: avoid_catches_without_on_clauses
                } catch(_){}
                
                 

                ret.add(PopupMenuItem(
                    value: i,
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: icon,
                      ),
                      Tex(text),
                    ])));
              }
              return ret;
            }));
  }
}
