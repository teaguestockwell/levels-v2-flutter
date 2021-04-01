import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../models/nested/general.dart';
import '../../util.dart';
import '../../widgets/display/text.dart';

class LeadingMDS extends StatelessWidget {
  final String text;
  final IntCallBackIntPara onPressed;
  ///null icons, and
  final General general;

  LeadingMDS(
      {@required this.text, @required this.onPressed, @required this.general})
      : assert(text != null),
        assert(onPressed != null),
        assert(general != null),
        assert(general.names != null),
        assert(general.iconDatas == null),
        assert(general.urls == null);

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
                  color: modalPickerColor,

                  ///three vertical dots icon
                  icon: Icon(Icons.flight),
                  itemBuilder: (_) {
                    List<PopupMenuEntry> ret = [];
                    for (int i = 0; i < general.names.length; i++) {
                      String text = () {
                        if (general.names[i].length > 24) {
                          return general.names[i].substring(0, 20) + '...';
                        }
                        return general.names[i];
                      }();

                      Icon icon =Icon(IconData(59223, fontFamily: 'MaterialIcons'));
                     
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
