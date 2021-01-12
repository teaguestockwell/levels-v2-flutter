import '../../../utils.dart';
import '../max.dart';
import '../alignPadding.dart';
import '../../../backend/cont.dart';
import '../../../widgets/display/text.dart';
import 'package:flutter/material.dart';

class CCard extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final bool initOpen;
  final IntCallBack callBack;

  ///nullable, if null default value is Const.rc()
  final Color color;

  CCard(
      {@required this.title,
      @required this.children,
      @required this.initOpen,
      this.callBack,
      this.color});

  @override
  _CCardState createState() => _CCardState();
}

class _CCardState extends State<CCard> {
  bool open;
  List<Widget> children;
  Color color;
  String title;

  @override
  void initState() {
    super.initState();
    title = Util.getTruncated(this.widget.title);
    color = this.widget.color ?? Const.rc();
    open = this.widget.initOpen;
    children = this.widget.children;
  }

  ///toggles the cards open state
  List<Widget> getActive() {
    if (open) {
      return children;
    } else {
      return [Container()];
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
                        InkWell(
                            child: AlignPadding(
                                3.0,
                                Alignment.center,
                                TitleCC(
                                    open: open,
                                    tex: Tex(
                                      title,
                                      color: color,
                                    ))),
                            onTap: () => setState(() {
                                  this.widget.callBack?.call();
                                  open = !open;
                                })),
                        Column(children: getActive()),
                      ],
                    )))));
  }
}

///used for cccard titles to create a title row with drop cards
class TitleCC extends StatelessWidget {
  final Tex tex;
  final bool open;
  TitleCC({@required this.tex, @required this.open});
  @override
  Widget build(BuildContext context) {
    if (open) {
      return Container(
          width: MediaQuery.of(context).size.width / .8,
          child: Row(children: [
            Icon(Icons.arrow_drop_up),
            Spacer(),
            tex,
            Spacer(),
            Icon(Icons.arrow_drop_up),
          ]));
    } else {
      return Container(
          width: MediaQuery.of(context).size.width / .8,
          child: Row(children: [
            Icon(Icons.arrow_drop_down),
            Spacer(),
            tex,
            Spacer(),
            Icon(Icons.arrow_drop_down),
          ]));
    }
  }
}
