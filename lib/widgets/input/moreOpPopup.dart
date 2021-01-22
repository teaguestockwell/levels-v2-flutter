import '../../backend/models/moreOp.dart';
import '../../backend/const.dart';
import '../../widgets/display/text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreOpPopup extends StatelessWidget {
  final MoreOp moreOp;
  MoreOpPopup(this.moreOp)
      : assert(moreOp != null),
        assert(moreOp.icon != null),
        assert(moreOp.name != null),
        assert(moreOp.url != null);

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void more(var x) {
    try {
      launchURL(moreOp.url[x]);
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
              for (int i = 0; i < moreOp.name.length; i++) {
                String text = () {
                  if (moreOp.name[i].length > 24) {
                    return moreOp.name[i].substring(0, 20) + '...';
                  }
                  return moreOp.name[i];
                }();
                
                Icon icon = () {
                  try {
                    return Icon(IconData(int.parse(moreOp.icon[i]),
                        fontFamily: 'MaterialIcons'));
                  } catch (_) {
                    return Icon(IconData(59362, fontFamily: 'MaterialIcons'));
                  }
                }();

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
