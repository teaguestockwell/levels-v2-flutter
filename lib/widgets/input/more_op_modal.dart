import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../backend/const.dart';
import '../../backend/models/more_op.dart';
import '../display/text.dart';
import 'custom_button.dart';

class MoreOpModal extends StatefulWidget {
  final MoreOp moreOp;
  MoreOpModal(this.moreOp)
      : assert(moreOp != null),
        assert(moreOp.icon != null),
        assert(moreOp.name != null),
        assert(moreOp.url != null);

  @override
  MoreOpModalState createState() => MoreOpModalState();
}

class MoreOpModalState extends State<MoreOpModal> {
  int spinIdx = 0;
  int _timesPressed = 0;
  List<Widget> _spinnerWidgets = [];
  FixedExtentScrollController sc;

  @override
  void initState() {
    super.initState();
    sc = FixedExtentScrollController(initialItem: spinIdx);
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  void _spin(int newIdx) {
    spinIdx = newIdx;
    sc = FixedExtentScrollController(initialItem: spinIdx);
  }

  void select() async {
    String url = Uri.encodeFull(this.widget.moreOp.url[spinIdx]);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Const.modalPickerColor,
          content: Container(
              height: Const.pickerHeight * 2,
              child: Center(
                  child: Tex(
                'Error, please email tsAppDevelopment@gmail.com',
                fontWeight: FontWeight.bold,
                color: Const.nonfocusedErrorBoderColor,
              )))));
    }
  }

  _getSpinnerWidgets() {
    _spinnerWidgets.clear();
    for (int i = 0; i < this.widget.moreOp.name.length; i++) {
      Icon icon = () {
        try {
          return Icon(IconData(int.parse(this.widget.moreOp.icon[i]),
              fontFamily: 'MaterialIcons'));
        // ignore: avoid_catches_without_on_clauses
        } catch (_) {
          return Icon(IconData(59362, fontFamily: 'MaterialIcons'));
        }
      }();

      var tex = Tex(
        this.widget.moreOp.name[i],
        size: Const.textSizeModalSpinner,
        fontWeight: Const.fwSpinner,
        color: Const.textColor,
      );

      _spinnerWidgets.add(Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
            icon,
            Padding(padding: EdgeInsets.only(left: 9), child: tex),
          ])));
    }
  }

  press() {
    //build children only on first press
    if (_timesPressed == 0) {
      _getSpinnerWidgets();
      _timesPressed++;
    }

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Const.modalSpinHeight,
          color: Const.modalPickerColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    height: Const.modalSpinHeight,
                    child: Column(children: [
                      Flexible(child: Container()),
                      Flexible(
                          flex: 9,
                          child: CupertinoPicker(
                            scrollController: sc,
                            children: _spinnerWidgets,
                            onSelectedItemChanged: _spin,
                            itemExtent: 35,
                          )),
                      Flexible(child: Container()),
                      Flexible(
                          flex: 3,
                          child: CustomButton(
                            'Select',
                            onPressed: () {
                              Navigator.pop(context);
                              select();
                            },
                          )),
                      Flexible(child: Container()),
                    ])),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      'Help',
      onPressed: press,
    );
  }
}
