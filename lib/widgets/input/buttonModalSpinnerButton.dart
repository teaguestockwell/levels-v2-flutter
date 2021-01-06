import 'package:five_level_one/backend/cont.dart';
import 'package:five_level_one/widgets/display/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils.dart';
import 'customButton.dart';

class ButtomSpinnerModalButton extends StatefulWidget {
  ///starting spinner index
  int spinIdx;
  int _timesPressed = 0;
  String _selected;
  ///text to show in modal button
  String modalButtonText;
  /// List<String> of modal window spinner
  final List<String> stringList;
  ///supertino spinner spined => this(index)
  final IntCallBackIntPara onSpin; 
  ///modal button is pressed this(index)
  final IntCallBack onPress;
  var _spinnerWidgets = List<Widget>();

  ButtomSpinnerModalButton({
    this.spinIdx = 0,
    this.modalButtonText = '',
    @required this.onSpin,
    @required this.onPress,
    @required this.stringList
  }){
    _selected = stringList[spinIdx];
  }

  @override
  _ButtomSpinnerModalButtonState createState() =>
      _ButtomSpinnerModalButtonState();
}

class _ButtomSpinnerModalButtonState extends State<ButtomSpinnerModalButton> {
 
  _getSpinnerWidgets() {
    this.widget._spinnerWidgets.clear();
    for (String x in this.widget.stringList) {
      this.widget._spinnerWidgets.add(Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Tex(
            x,
            size: Const.textSizeModalSpinner,
            fontWeight: Const.fwSpinner,
            color: Const.textColor,
          )));
    }
  }

  void _spin(int newIdx) {
    this.widget.spinIdx = newIdx;
    this.widget._selected = this.widget.stringList[newIdx];

    this.widget.onSpin?.call(newIdx);
    //rebuild to change button text
    setState(() {});
  }

  press() {
    //build children only on first press
    if (this.widget._timesPressed == 0) {
      _getSpinnerWidgets();
    }
    this.widget._timesPressed++;
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
                      child:
                      CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                          initialItem: this.widget.spinIdx),
                        children: this.widget._spinnerWidgets,
                        onSelectedItemChanged: _spin,
                        itemExtent: 35,
                      )
                    ),
                    
                    Flexible(child: Container()),
                    
                    Flexible(
                      flex: 3,
                      child:
                      CustomButton(this.widget.modalButtonText,
                      onPressed: (){Navigator.pop(context); this.widget.onPress();},
                      )
                    ),

                    Flexible(child: Container()),

                    ]
                  )
                ),
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
      this.widget._selected,
      onPressed: press,
    );
  }
}
