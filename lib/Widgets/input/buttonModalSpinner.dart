import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/Widgets/Uitls.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';
import 'customButton.dart';
class CustomButtomSpinnerModalString extends StatefulWidget {
  int spinIdx;
  String selected;
  var timesPressed = 0;
  var spinnerWidgets = List<Widget>();
  final List<String> stringList;
  final IntCallBackIntPara onPressed;

  CustomButtomSpinnerModalString(this.stringList,
      {this.spinIdx, this.onPressed, this.selected});
  @override
  _CustomButtomSpinnerModalStringState createState() =>
      _CustomButtomSpinnerModalStringState();
}

class _CustomButtomSpinnerModalStringState
    extends State<CustomButtomSpinnerModalString> {
  @override
  void initState() {
    this.widget.spinIdx ??= 0;
    this.widget.selected = this.widget.stringList[this.widget.spinIdx];
    super.initState();
  }

  _getSpinnerWidgets() {
    this.widget.spinnerWidgets.clear();
    for (String x in this.widget.stringList) {
      this.widget.spinnerWidgets.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Tex(
            x,
            size: Const.textSizeModalSpinner,
            fontWeight: Const.fwSpinner,
            color: Const.textColor,
          )));
      //print(x);
    }
  }

  void _spin(int newIdx) {
    this.widget.spinIdx = newIdx;
    this.widget.selected = this.widget.stringList[newIdx];

    this.widget.onPressed?.call(newIdx);
    //rebuild to change button text
    setState(() {});
  }

  press() {
    //build children only on first press
    if (this.widget.timesPressed == 0) {
      _getSpinnerWidgets();
    }
    this.widget.timesPressed++;
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
                    child: Center(
                        child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                          initialItem: this.widget.spinIdx),
                      children: this.widget.spinnerWidgets,
                      onSelectedItemChanged: _spin,
                      itemExtent: 35,
                    ))),
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
      this.widget.selected,
      onPressed: press,
    );
  }
}
