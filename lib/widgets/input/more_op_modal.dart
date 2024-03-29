import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../../models/nested/general.dart';
import '../display/text.dart';
import 'custom_button.dart';

class MoreOpModal extends StatefulWidget {
  final General general;
  MoreOpModal(this.general)
      : assert(general != null),
        assert(general.iconDatas != null),
        assert(general.names != null),
        assert(general.urls != null);

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
    String url = Uri.encodeFull(this.widget.general.urls[spinIdx]);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: modalPickerColor,
          content: Container(
              height: pickerHeight * 2,
              child: Center(
                  child: Tex(
                'Error',
                fontWeight: FontWeight.bold,
                color: nonfocusedErrorBoderColor,
              )))));
    }
  }

  _getSpinnerWidgets() {
    _spinnerWidgets.clear();
    for (int i = 0; i < this.widget.general.names.length; i++) {
      Icon icon;

        try {
          icon = Icon(IconData(this.widget.general.iconDatas[i],fontFamily: 'MaterialIcons'));
        // ignore: avoid_catches_without_on_clauses
        } catch (_) {
          icon = Icon(IconData(59362, fontFamily: 'MaterialIcons'));
        }
      ;

      var tex = Tex(
        this.widget.general.names[i],
        size: textSizeModalSpinner,
        fontWeight: fwSpinner,
        color: textColor,
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
          height: modalSpinHeight,
          color: modalPickerColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    height: modalSpinHeight,
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
