import 'package:flutter/material.dart';

import '../../backend/const.dart';
import '../../backend/models/more_op.dart';
import '../../backend/utils.dart';
import '../../widgets/display/text.dart';

class LeadingMDS extends StatelessWidget {
  final String text;
  final IntCallBackIntPara onPressed;
  ///null icons, and
  final MoreOp moreOp;

  LeadingMDS(
      {@required this.text, @required this.onPressed, @required this.moreOp})
      : assert(text != null),
        assert(onPressed != null),
        assert(moreOp != null),
        assert(moreOp.name != null),
        assert(moreOp.icon == null),
        assert(moreOp.url == null);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8),
        child: Row(children: [
          Theme(
              //theme wrapper to remove tooltip
              data: Theme.of(context).copyWith(
                  tooltipTheme: TooltipThemeData(
                      decoration: BoxDecoration(color: Colors.transparent))),
              child: PopupMenuButton(
                  onSelected: (var i) {
                    this.onPressed(i);
                  },
                  tooltip: '',
                  color: Const.modalPickerColor,

                  ///three vertical dots icon
                  icon: Icon(Icons.flight),
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
                        // ignore: avoid_catches_without_on_clauses
                        } catch (_) {
                          return Icon(
                              IconData(59223, fontFamily: 'MaterialIcons'));
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
                  })),
          Expanded(child: Tex(text)),
        ]));
  }
}
